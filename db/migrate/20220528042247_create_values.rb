class CreateValues < ActiveRecord::Migration[6.0]
  def change
    create_table :values do |t|
      t.datetime :fecha_corte
      t.float :precio_cierre
      t.float :valor_unidad
      t.float :valor_fondo
      t.references :part, foreign_key: true

      t.timestamps
    end
  end
end
