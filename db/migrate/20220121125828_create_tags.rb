class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :shortname
      t.string :display_name
      t.text :description

      t.timestamps
    end
  end
end
