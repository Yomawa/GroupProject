class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password
      t.string :password_digest
      t.string :reset_token
      t.string :picture
      t.string :bio
      t.string :contact_link
      t.timestamps null: false
    end
  end
end
