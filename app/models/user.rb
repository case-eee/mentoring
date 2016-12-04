class User < ApplicationRecord
  def self.from_github(data)
    user = find_or_create_by(github_id: data['id'])

    user.update_columns(name:     data['name'])     if user.name.nil?
    user.update_columns(email:    data['email'])    if user.email.nil?
    user.update_columns(location: data['location']) if user.location.nil?

    user.update_columns(
      image_url:  data['avatar_url']
    )

    user
  end

  def mentor!
    self.category = "mentor"
    self.save
  end
end
