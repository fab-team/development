class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.text :tagname
      t.string :slug

      t.timestamps
    end
  end
end
