class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.references :fondo, foreign_key: true
      t.integer :codigo_participaciones

      t.timestamps
    end
  end
end
