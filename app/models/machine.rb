# == Schema Information
#
# Table name: machines
#
#  id         :integer          not null, primary key
#  name       :string
#  price      :float
#  service    :string
#  photo      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Machine < ApplicationRecord
  validates :name, presence: true, uniqueness: true          
  validates :price, presence: true
  validates :photo, presence: true          

  has_many :beans, :foreign_key => "recommended_machine_id", :dependent => :nullify

end
