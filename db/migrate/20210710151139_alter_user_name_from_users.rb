class AlterUserNameFromUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :user_name, :string, null: false
  end
end
