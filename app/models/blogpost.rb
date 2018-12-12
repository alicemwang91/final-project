# == Schema Information
#
# Table name: blogposts
#
#  id         :integer          not null, primary key
#  caption    :text
#  image      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  body       :text
#

class Blogpost < ApplicationRecord
  validates :user_id, presence: true          
  validates :body, presence: true, uniqueness: true
  validates :image, presence: true  
  validates :caption, presence: true, uniqueness: true

  belongs_to :user, :class_name => "User", :foreign_key => "user_id" 
  has_many :bookmarks, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :bookmarked_users, :through => :bookmarks, :source => :user
end
