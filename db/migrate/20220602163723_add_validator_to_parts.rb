class AddValidatorToParts < ActiveRecord::Migration[6.0]
  def change
    add_column :parts, :part_validator, :string
  end
end
