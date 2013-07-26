class CreateRecurrencies < ActiveRecord::Migration
  def change
    create_table :recurrencies do |t|
      t.string :name

      t.timestamps
    end
  end
end
