# == Schema Information
#
# Table name: values
#
#  id            :integer          not null, primary key
#  fecha_corte   :datetime
#  precio_cierre :float
#  valor_fondo   :float
#  valor_unidad  :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  part_id       :integer
#
# Indexes
#
#  index_values_on_part_id  (part_id)
#
# Foreign Keys
#
#  part_id  (part_id => parts.id)
#
class Value < ApplicationRecord
  def Value.part_last_date(part_id)
    where(part_id: part_id).order(fecha_corte: :desc).last
  end

  belongs_to :part
  # Value.where(part_id: favorito.part.id).order(fecha_corte: :desc).last.fecha_corte
  scope :part_find, ->(part_id) {where(part_id: part_id)}
  scope :last_date, -> {order( fecha_corte: :desc)}
  #scope :part_last_date, ->(part_id) {where(part_id: part_id).order( fecha_corte: :desc)}
end
