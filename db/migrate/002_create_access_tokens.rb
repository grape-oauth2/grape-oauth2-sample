class CreateAccessTokens < ActiveRecord::Migration[5.0]
  def change
    create_table :access_tokens do |t|
      t.integer :resource_owner_id
      t.integer :client_id

      t.string :token, null: false
      t.string :refresh_token
      t.string :scopes

      t.datetime :expires_at
      t.datetime :revoked_at
      t.datetime :created_at, null: false
    end

    add_index :access_tokens, :token, unique: true
    add_index :access_tokens, :resource_owner_id
    add_index :access_tokens, :client_id
    add_index :access_tokens, :refresh_token, unique: true
  end
end
