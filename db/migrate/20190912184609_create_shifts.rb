class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.integer :user_id
      t.date :shift_date
      t.time :start
      t.time :finish
      t.integer :break_length

      t.timestamps
    end
  end
end
