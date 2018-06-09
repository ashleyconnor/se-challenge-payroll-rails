class CreateTimeEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :time_entries do |t|
      t.string :workday
      t.integer :hours_worked
      t.references :employee, foreign_key: true, index: true
      t.references :job_group, foreign_key: true, index: true

      t.timestamps
    end
  end
end
