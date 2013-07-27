class Recurrency < ActiveRecord::Base
  attr_accessible :name
  has_many :jobs
  validates :name, :presence=>true
  validates :name, :uniqueness=>true

  before_destroy :is_delete_possible?

  def is_delete_possible?
  	return true if self.jobs.blank?
  	return false
  end
end
