class CreateCompanies < ActiveRecord::Migration[5.2]
  def self.up
    create_table :companies do |t|
      t.string :name
      t.timestamps null: false
    end
  end

  def self.down
    drop_table :companies
  end
end
