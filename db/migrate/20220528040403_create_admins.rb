class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :nombre_admin
      t.string :tipo_admin
      t.string :codigo_admin
      t.integer :fondos_count

      t.timestamps
    end
  end
end
