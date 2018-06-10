class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :employee_id, index: {unique: true}

      t.timestamps
    end
  end
end
