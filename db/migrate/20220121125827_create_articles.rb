class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :slug
      t.text :kontent
      t.string :title
      t.text :description
      t.text :image_url
      t.datetime :publication_date
      t.boolean :is_published, default: false

      t.timestamps
    end
  end
end
