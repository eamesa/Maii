# == Schema Information
#
# Table name: admins
#
#  id           :integer          not null, primary key
#  codigo_admin :string
#  fondos_count :integer
#  nombre_admin :string
#  tipo_admin   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Admin < ApplicationRecord
end
