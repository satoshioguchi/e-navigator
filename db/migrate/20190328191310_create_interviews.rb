class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :schedule
      t.integer :propriety

      t.timestamps
    end
  end
end
