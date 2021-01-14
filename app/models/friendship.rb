class Friendship < ApplicationRecord
    belongs_to :writer, class_name: "User", foreign_key: :writer_id
    belongs_to :friend, class_name: "User", foreign_key: :friend_id
end
