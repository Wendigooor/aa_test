class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.date :start_date
      t.date :end_date
      t.integer :premium_plan_id

      t.timestamps null: false
    end
  end
end
