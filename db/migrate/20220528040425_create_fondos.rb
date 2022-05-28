class CreateFondos < ActiveRecord::Migration[6.0]
  def change
    create_table :fondos do |t|
      t.string :nombre_fondo
      t.references :admin, foreign_key: true
      t.string :tipo_fondo
      t.string :codigo_tipo_fondo
      t.string :codigo_fondo
      t.integer :tipo_participaciones_count

      t.timestamps
    end
  end
end
