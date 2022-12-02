class CreateDurationOfSleeps < ActiveRecord::Migration[7.0]
  def change
    create_table :duration_of_sleeps do |t|
      t.date :date
      t.float :duration
      t.integer :user_id

      t.timestamps
    end
  end
end
