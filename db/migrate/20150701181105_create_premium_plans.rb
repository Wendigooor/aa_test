class CreatePremiumPlans < ActiveRecord::Migration
  def change
    create_table :premium_plans do |t|
      t.string :label
      t.float :price_per_month, :scale => 2
      t.string :plan_type

      t.timestamps null: false
    end
  end
end
