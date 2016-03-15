class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, limit: 50, unique: true
      t.string :firstname, limit: 30
      t.string :lastname, limit: 30
      t.string :password_digest
      t.string :authentication_token, unique: true
      t.jsonb :info, default: '{}'

      t.timestamps null: false
    end

    add_index :users, :info, using: :gin
    add_index :users, :authentication_token, unique: true
  end
end
