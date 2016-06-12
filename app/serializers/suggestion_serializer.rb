class SuggestionSerializer < ActiveModel::Serializer
  attributes :suggestion

  def suggestion
    query = @instance_options[:search_string]
    object.name.include?(query) ? object.name : object.address
  end
end
