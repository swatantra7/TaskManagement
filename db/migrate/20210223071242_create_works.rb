class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :name
      t.integer :user_id, integer: :true
      t.integer :status_id, integer: :true
      t.datetime :deadline

      t.timestamps
    end
  end
end
