class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :name
      t.string :description
      t.date :estimated_date
      t.integer :effort
      t.references :recurrency
      t.boolean :status
      t.integer :job_id
      t.references :type_task

      t.timestamps
    end
    add_index :jobs, :recurrency_id
    add_index :jobs, :type_task_id
  end
end
