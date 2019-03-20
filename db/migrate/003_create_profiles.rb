class CreateProfiles < ActiveRecord::Migration[5.2]
  def self.up
    create_table :profiles do |t|
      t.text :address
      t.string :hoby
      t.integer :user_id
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :profiles
  end
end
