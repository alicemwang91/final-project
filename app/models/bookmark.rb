# == Schema Information
#
# Table name: bookmarks
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  blogpost_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Bookmark < ApplicationRecord
  validates :user_id, presence: true          
  validates :blogpost_id, presence: true 

  belongs_to :user
  belongs_to :blogpost
end
