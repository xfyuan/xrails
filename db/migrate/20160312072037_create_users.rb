class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :firstname
      t.string :lastname
      t.string :password_digest, null: false
      t.string :authentication_token, null: false
      t.jsonb :info, default: '{}'

      t.timestamps null: false
    end

    add_index :users, :info, using: :gin
  end
end
