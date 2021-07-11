class AlterPasswordDigestFromUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :password_digest, :string, null: false
  end
end
