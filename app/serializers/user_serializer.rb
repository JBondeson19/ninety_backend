class UserSerializer < ActiveModel::Serializer


  attributes :id, :username, :email, :bio
  has_many :posts
  
end
