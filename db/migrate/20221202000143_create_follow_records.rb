class CreateFollowRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :follow_records do |t|
      t.integer :followee_id
      t.integer :follower_id

      t.timestamps
    end
  end
end
