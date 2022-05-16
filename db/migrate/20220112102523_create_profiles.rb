class CreateProfiles < ActiveRecord::Migration[7.0]

  def change

    create_table "profiles", force: :cascade do |t|
      t.bigint "account_id"
      t.json "preferences", default: {}
      t.string "name", null: false
      t.index ["account_id"], name: "index_profiles_on_account_id"
      t.timestamps
    end

  end

end
