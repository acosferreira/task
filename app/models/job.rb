class Job < ActiveRecord::Base
  belongs_to :recurrency
  belongs_to :type_task
  belongs_to :job
  attr_accessible :description, :effort, :estimated_date, :job_id, :name, :status, :recurrency_id,  :type_task_id


  validates :name, :presence=>true	
  validates :effort, :presence=>true

  def is_delete_possible?
  	#if has child should not be possible delete
  end

  def set_status
  	#if all child was concluded, set main as concluded too
  end

  def remain
  	#if the main task has recurrency remember by e-mail
  end
end
