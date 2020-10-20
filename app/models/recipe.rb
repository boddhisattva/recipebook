class Recipe < ContentfulModel::Base
  self.content_type_id = 'recipe'

  coerce_field title: :String
  coerce_field description: :Text

  def photo_url
    photo&.image_url
  end

  def tag_names
    tags&.map(&:name)&.join(', ')
  end

  def chef_name
    chef&.name
  end
end
