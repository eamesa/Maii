# == Schema Information
#
# Table name: portfolios
#
#  id                :integer          not null, primary key
#  investments_count :integer
#  nombre_portafolio :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  user_id           :integer
#
# Indexes
#
#  index_portfolios_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
class Portfolio < ApplicationRecord
  belongs_to :user
end
