class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.time :schedule
      t.integer :propriety

      t.timestamps
    end
  end
end
