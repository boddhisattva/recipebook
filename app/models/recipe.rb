class Recipe < ContentfulModel::Base
  self.content_type_id = 'recipe'

  coerce_field title: :String
  coerce_field description: :Text
end
