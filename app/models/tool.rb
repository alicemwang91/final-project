# == Schema Information
#
# Table name: tools
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :float
#  photo      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tool < ApplicationRecord
    
  validates :name, presence: true, uniqueness: true          
  validates :price, presence: true   
  validates :photo, presence: true    

  has_many :tool_matches, :foreign_key => "tools_id", :dependent => :destroy
  has_many :beans, :through => :tool_matches, :source => :beans

end
