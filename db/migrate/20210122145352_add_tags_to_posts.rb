class AddTagsToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :tags, :string, null: true 
  end
end
