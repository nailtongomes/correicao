class Group < ActiveRecord::Base
  attr_accessible :name 

  validates :name, presence: true

  default_scope order: 'groups.name asc'
end
