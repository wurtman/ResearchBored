class CreateBookmarks < ActiveRecord::Migration[7.0]
  def change
    create_table :bookmarks do |t|
      t.string :title
      t.text :description
      t.text :url

      t.timestamps
    end
  end
end
