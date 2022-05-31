# == Schema Information
#
# Table name: investments
#
#  id             :integer          not null, primary key
#  movement_date  :datetime
#  movement_type  :integer
#  movement_value :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  part_id        :integer
#  portfolio_id   :integer
#
# Indexes
#
#  index_investments_on_part_id       (part_id)
#  index_investments_on_portfolio_id  (portfolio_id)
#
# Foreign Keys
#
#  part_id       (part_id => parts.id)
#  portfolio_id  (portfolio_id => portfolios.id)
#
class Investment < ApplicationRecord
  belongs_to :part
  belongs_to :portfolio
end
