class CreateJobGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :job_groups do |t|
      t.string :code, null: false, index: {unique: true}
      t.decimal :hourly_wage, precision: 8, scale: 2

      t.timestamps
    end
  end
end
