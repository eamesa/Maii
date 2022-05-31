class CreateFavoritos < ActiveRecord::Migration[6.0]
  def change
    create_table :favoritos do |t|
      t.references :part, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
