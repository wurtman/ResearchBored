class CreateEditables < ActiveRecord::Migration[7.0]
  def change
    create_table :editables do |t|
      t.string :shortname
      t.text :kontent
      t.text :description

      t.timestamps
    end
  end
end
