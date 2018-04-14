class CreatePropertyInvesmentForms < ActiveRecord::Migration
  def change
    create_table :property_invesment_forms do |t|
      t.integer :property_value
      t.integer :loan_amount
      t.decimal :interest_rate, :precision => 8, :scale => 2
      t.decimal :capital_growth, :precision => 8, :scale => 2
      t.integer :taxable_income
      t.integer :proposed_rent

      t.timestamps null: false
    end
  end
end
