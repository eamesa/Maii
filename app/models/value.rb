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
    where(part_id: part_id).order(fecha_corte: :desc).first
  end
  def Value.part_date(part_id, fecha)
    where(part_id: part_id).where(fecha_corte: fecha)
  end

  def Value.rentabilidad(part_id,date_t0,date_t1)
    value_t0 = self.part_date(part_id,date_t0).first.valor_unidad
    value_t1 = self.part_date(part_id,date_t1).first.valor_unidad
    days = date_t1 - date_t0
    rentabilidad = (value_t0/value_t1)**(365/(date_t1 - date_t0))-1
    return rentabilidad
  end

  belongs_to :part
  # Value.where(part_id: favorito.part.id).order(fecha_corte: :desc).last.fecha_corte
  scope :part_find, ->(part_id) {where(part_id: part_id)}
  scope :find_date, -> {order( fecha_corte: :desc)}
  #scope :part_last_date, ->(part_id) {where(part_id: part_id).order( fecha_corte: :desc)}
end
