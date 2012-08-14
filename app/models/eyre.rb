class Eyre < ActiveRecord::Base
  attr_accessible :description
  
  belongs_to :user
  has_many :items, dependent: :destroy
  
  validates :description, presence:   true
end
