class CreateSettings < ActiveRecord::Migration[7.0]
  def change
    create_table :settings do |t|
      t.boolean :shareable_draft, default: false
      t.integer :clock_diff, default: 0
      t.timestamps
    end
  end
end
