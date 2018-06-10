class CreateTimeEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :time_entries do |t|
      t.date :workday
      t.decimal :hours_worked
      t.string :report_id, index: true
      t.references :employee, foreign_key: true, index: true
      t.references :job_group, foreign_key: true, index: true

      t.timestamps
    end
  end
end
