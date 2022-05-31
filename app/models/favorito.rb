# == Schema Information
#
# Table name: favoritos
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  part_id    :integer
#  user_id    :integer
#
# Indexes
#
#  index_favoritos_on_part_id  (part_id)
#  index_favoritos_on_user_id  (user_id)
#
# Foreign Keys
#
#  part_id  (part_id => parts.id)
#  user_id  (user_id => users.id)
#
class Favorito < ApplicationRecord
  belongs_to :part
  belongs_to :user
end
