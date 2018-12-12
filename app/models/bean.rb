# == Schema Information
#
# Table name: beans
#
#  id                     :integer          not null, primary key
#  origin                 :string
#  roast                  :string
#  process_method         :string
#  flavor                 :string
#  altitude               :integer
#  precipitation          :string
#  instruction            :text
#  recommended_machine_id :integer
#  photo                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  name                   :string
#

class Bean < ApplicationRecord
  validates :name, presence: true, uniqueness: true    
  validates :origin, presence: true                
  validates :roast, presence: true                 
  validates :process_method, presence: true        
  validates :flavor, presence: true                 
  validates :instruction, presence: true      
  validates :recommended_machine_id, numericality: {allow_blank: true}
 
  has_many :tool_matches, :foreign_key => "beans_id", :dependent => :destroy
  belongs_to :recommended_machine, :class_name => "Machine"
  has_many :tools, :through => :tool_matches, :source => :tools
end
