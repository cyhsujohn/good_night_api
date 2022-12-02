class CreateClockIns < ActiveRecord::Migration[7.0]
  def change
    create_table :clock_ins do |t|
      t.string :way, null: false
      t.integer :user_id

      t.timestamps
    end
  end
end
