class User < ApplicationRecord
    has_many :active_relationships, class_name: "Friendship", foreign_key: :friend_id, dependent: :destroy
    has_many :writers, through: :active_relationships, source: :writer

    has_many :passive_relationships, class_name: "Friendship", foreign_key: :writer_id, dependent: :destroy
    has_many :friends, through: :passive_relationships, source: :friend

    has_many :posts, dependent: :destroy
    has_many :comments, dependent: :destroy
end
