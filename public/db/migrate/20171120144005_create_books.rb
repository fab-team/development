class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.integer :user_id
      t.integer :tag_id
      t.string :title
      t.text :body
      t.integer :status

      t.timestamps
    end
  end
end
