class CreateImages < ActiveRecord::Migration[6.1]
  def change
    create_table :images do |t|
      t.string :title, limit:30, null: false
      t.belongs_to :user, null: false
      t.timestamps
    end
  end
end
