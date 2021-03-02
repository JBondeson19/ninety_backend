class CreateImageElements < ActiveRecord::Migration[6.0]
  def change
    create_table :image_elements do |t|

      t.timestamps
    end
  end
end
