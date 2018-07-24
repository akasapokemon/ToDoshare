class User < ApplicationRecord
  has_many :todos, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_todos, through: :likes, source: :todo
  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    twitter_id = auth[:uid]
    name = auth[:info][:name]
    image_url = auth[:info][:image]
  
    self.find_or_create_by(provider: provider, twitter_id: twitter_id) do |user|
      user.name = name
      user.image_url = image_url
    end
  end
 end
