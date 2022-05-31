class CreateInvestments < ActiveRecord::Migration[6.0]
  def change
    create_table :investments do |t|
      t.references :part, foreign_key: true
      t.datetime :movement_date
      t.integer :movement_type
      t.float :movement_value
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
