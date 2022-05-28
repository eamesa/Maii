# == Schema Information
#
# Table name: fondos
#
#  id                         :integer          not null, primary key
#  codigo_fondo               :string
#  codigo_tipo_fondo          :string
#  nombre_fondo               :string
#  tipo_fondo                 :string
#  tipo_participaciones_count :integer
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  admin_id                   :integer
#
# Indexes
#
#  index_fondos_on_admin_id  (admin_id)
#
# Foreign Keys
#
#  admin_id  (admin_id => admins.id)
#
class Fondo < ApplicationRecord
  belongs_to :admin, class_name: "Admin", foreign_key: "admin_id", counter_cache: true
  validates_uniqueness_of :nombre_fondo
end
