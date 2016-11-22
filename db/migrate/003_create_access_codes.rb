class CreateAccessCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :access_codes do |t|
      t.integer :resource_owner_id
      t.integer :client_id

      t.string :token, null: false
      t.string :redirect_uri
      t.string :scopes

      t.datetime :expires_at
      t.datetime :revoked_at
      t.datetime :created_at, null: false
    end

    add_index :access_codes, :token, unique: true
    add_index :access_codes, :resource_owner_id
    add_index :access_codes, :client_id
  end
end
