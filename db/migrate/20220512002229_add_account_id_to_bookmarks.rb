class AddAccountIdToBookmarks < ActiveRecord::Migration[7.0]
  def change
    add_column :bookmarks, :account_id, :integer
    add_index :bookmarks, :account_id
  end
end
