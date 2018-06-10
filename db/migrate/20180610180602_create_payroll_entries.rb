class CreatePayrollEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :payroll_entries do |t|
      t.integer :employee_id
      t.date :pay_period_start
      t.date :pay_period_end
      t.decimal :wages, precision: 8, scale: 2, default: 0.0

      t.timestamps
    end

    add_index :payroll_entries, [:employee_id, :pay_period_start, :pay_period_end],
      unique: true, name: "index_payroll_entries_on_employee_id_and_wage_period"
  end
end
