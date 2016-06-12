class SuggestionSerializer < ActiveModel::Serializer
  attributes :suggestion

  def suggestion
    query = @instance_options[:search_string]
    suggestion = object.name.include?(query) ? object.name : object.address
  end
end
