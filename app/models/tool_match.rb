# == Schema Information
#
# Table name: tool_matches
#
#  id         :integer          not null, primary key
#  beans_id   :integer
#  tools_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ToolMatch < ApplicationRecord
  validates :beans_id, presence: true          
  validates :tools_id, presence: true 

  belongs_to :beans, :class_name => "Bean"
  belongs_to :tools, :class_name => "Tool"
end
