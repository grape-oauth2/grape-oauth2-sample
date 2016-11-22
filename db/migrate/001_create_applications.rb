class CreateApplications < ActiveRecord::Migration[5.0]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :key
      t.string :secret
      t.string :redirect_uri

      t.timestamps null: false
    end

    add_index :applications, :key, unique: true
  end
end
