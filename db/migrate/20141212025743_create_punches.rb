class CreatePunches < ActiveRecord::Migration
  def change
    create_table :punches do |t|
      t.integer :user_id
      t.string :punch_type
      t.timestamps
    end
    add_index :punches, :punch_type
    add_index :punches, :user_id
  end
end
