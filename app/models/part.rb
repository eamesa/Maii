# == Schema Information
#
# Table name: parts
#
#  id                     :integer          not null, primary key
#  codigo_participaciones :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  fondo_id               :integer
#
# Indexes
#
#  index_parts_on_fondo_id  (fondo_id)
#
# Foreign Keys
#
#  fondo_id  (fondo_id => fondos.id)
#
class Part < ApplicationRecord
  belongs_to :fondo
end
