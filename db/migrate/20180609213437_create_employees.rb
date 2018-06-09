class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :employee_id, index: {unique: true}
      t.references :job_group, foreign_key: true, index: {unique: true}

      t.timestamps
    end
  end
end
