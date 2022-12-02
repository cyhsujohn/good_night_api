class CreateClockIns < ActiveRecord::Migration[7.0]
  def change
    create_table :clock_ins do |t|
      t.string :action, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
