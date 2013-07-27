class Job < ActiveRecord::Base
  belongs_to :recurrency
  belongs_to :type_task
  belongs_to :job
  belongs_to :user

  attr_accessible :description, :effort, :estimated_date, :job_id, :name, :status, :recurrency_id,  :type_task_id, :user_id


  validates :name, :presence=>true	
  validates :effort, :presence=>true
  validates :name, :uniqueness=>true

  before_destroy :is_delete_possible?
  before_save :validate_total_effort
  after_save :set_status

  def is_delete_possible?
    !has_child?
    #if has child should not be possible delete
  end

  def validate_total_effort
    if !is_main?
      main = Job.find(self.job_id)
      childs_effort = Job.where("job_id = #{main.id}").map(&:effort).sum + self.effort
       if childs_effort > main.effort
        main.update_attributes(:effort=>childs_effort)
      end
    end
  end
  
  def set_status
    if is_main? && has_child?
      childs = Job.where("job_id = #{self.id}")
      childs.each do |child|
        child.update_attributes(:status => self.status)
      end 
    end
  end

  def is_main?
    return true if self.job_id.blank?
    return false
  end

  def has_child?
    return true if Job.where("job_id = #{self.id}").count>0
    return false
  end

  def self.reminder_pending_tasks(user_id)
    pending_tasks(user_id)
  end

  def self.pending_tasks(user_id)
    Job.where("status = ? and estimated_date <= '#{Date.today}' and user_id= ?", false, user_id).sort_by(&:estimated_date)
  end

  def self.from_user(user_id)
    Job.where("user_id=? and job_id is null", user_id)
  end

end
