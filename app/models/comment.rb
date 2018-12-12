# == Schema Information
#
# Table name: comments
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  body        :text
#  blogpost_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Comment < ApplicationRecord
  validates :user_id, presence: true          
  validates :body, presence: true, uniqueness: true
  validates :blogpost_id, presence: true

  belongs_to :user
  belongs_to :blogpost
end
