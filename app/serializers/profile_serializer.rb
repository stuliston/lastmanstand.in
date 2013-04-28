class ProfileSerializer < ActiveModel::Serializer
  attributes :id, :avatar_image_url

  def avatar_image_url
    "http://www.gravatar.com/avatar/" + Digest::MD5.hexdigest(object.email.to_s.strip.downcase)
  end
end
