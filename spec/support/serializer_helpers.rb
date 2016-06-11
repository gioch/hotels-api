module SerializerExampleGroup
  extend ActiveSupport::Concern

  included do
    metadata[:type] = :serializer

    def serialize(object, scope=nil)
      serializer = described_class.new(object, root: false)
      serializer.scope = scope if scope.present?

      JSON.parse(serializer.to_json)
    end

    def serialize_array(objects, scope=nil)
      serializer = ActiveModel::ArraySerializer.new(objects, each_serializer: described_class)
      serializer.scope = scope if scope.present?

      JSON.parse(serializer.to_json)
    end
  end

  RSpec.configure do |config|
    config.include self,
      type: :serializer,
      file_path: %r(spec/serializers)
  end
end

RSpec::Matchers.define :serialize_object do |object, scope=nil|
  match do |response|
    serializer = @serializer_klass.new(object, root: false)
    serializer.scope = scope if scope.present?
    serializer.to_json == response.body
  end

  chain :with do |serializer_klass|
    @serializer_klass = serializer_klass
  end
end

RSpec::Matchers.define :serialize_array do |object, scope=nil|
  match do |response|
    serializer = ActiveModel::ArraySerializer.new(object, each_serializer: @serializer_klass)
    serializer.scope = scope if scope.present?
    serializer.to_json == response.body
  end

  chain :with do |serializer_klass|
    @serializer_klass = serializer_klass
  end
end
