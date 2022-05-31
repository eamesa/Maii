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
  belongs_to :part
end
