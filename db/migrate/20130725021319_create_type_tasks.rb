class CreateTypeTasks < ActiveRecord::Migration
  def change
    create_table :type_tasks do |t|
      t.string :name

      t.timestamps
    end
  end
end
