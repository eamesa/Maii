class CreateInvestmentsparts < ActiveRecord::Migration[6.0]
  def change
    create_table :investmentsparts do |t|
      t.references :part, foreign_key: true
      t.references :investment, foreign_key: true

      t.timestamps
    end
  end
end
