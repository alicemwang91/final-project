# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  photo      :string
#  caption    :text
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ApplicationRecord
  
  validates :title, presence: true, uniqueness: true          
  validates :caption, presence: true
  validates :photo, presence: true          
  
  
end
