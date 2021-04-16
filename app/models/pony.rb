# == Schema Information
#
# Table name: ponies
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Pony < ApplicationRecord
  has_paper_trail
  validates :name, presence: true
end
