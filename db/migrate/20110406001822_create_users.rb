class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.timestamp :logged_in_at

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
