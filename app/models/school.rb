class School < ActiveRecord::Base
  
  validates :name, presence: true, uniqueness: true
  validates :logo, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :webpage, presence: true
  has_many :reviews, dependent: :destroy
end
