class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :user_name, unique: true, index: true
      t.string :password_digest
      t.timestamps
    end
  end
end
