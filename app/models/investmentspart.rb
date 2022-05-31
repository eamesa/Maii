# == Schema Information
#
# Table name: investmentsparts
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  investment_id :integer
#  part_id       :integer
#
# Indexes
#
#  index_investmentsparts_on_investment_id  (investment_id)
#  index_investmentsparts_on_part_id        (part_id)
#
# Foreign Keys
#
#  investment_id  (investment_id => investments.id)
#  part_id        (part_id => parts.id)
#
class Investmentspart < ApplicationRecord
  belongs_to :part
  belongs_to :investment
end
