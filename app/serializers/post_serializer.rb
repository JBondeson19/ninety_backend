class PostSerializer < ActiveModel::Serializer
  attributes :id, :content

  belongs_to :user

  def user
    {user_id: self.object.user.id,
     user_username: self.object.user.username}
  end
end
