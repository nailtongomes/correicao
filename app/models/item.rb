class Item < ActiveRecord::Base
  attr_accessible :process, :group, :status, :last, :obs
  
  belongs_to :eyre
  
  validates :process, presence: true
  validates_uniqueness_of :process 
  validates :eyre_id, presence: true

  default_scope order: 'items.status DESC'

  def self.search(search)
    if search
      where("LOWER(process) LIKE ? OR LOWER(group) LIKE ?", "%#{search.downcase}%")
    else
      scoped
    end
  end
end
