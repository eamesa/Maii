class CreatePortfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :portfolios do |t|
      t.references :user, foreign_key: true
      t.string :nombre_portafolio
      t.integer :investments_count

      t.timestamps
    end
  end
end
