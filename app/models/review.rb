class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :school

  validates :title, presence:true 
  validates :description, presence:true 
  validates :rating, presence:true 
end
