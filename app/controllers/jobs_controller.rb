class JobsController < ApplicationController
  # GET /jobs
  # GET /jobs.json
  before_filter :authenticate_user!
  
  add_breadcrumb 'Job', :jobs_path
  add_breadcrumb 'Create a new job', '', :only => [:new, :create]
  add_breadcrumb 'Edit a job', '', :only => [:edit, :update]

  def index
    @recurrencies = Recurrency.all
    @jobs = Job.where(conditions_to_collection)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
    @job = Job.find(params[:id])
    @jobs = Job.where("job_id = #{@job.id}")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/new
  # GET /jobs/new.json
  def new
    @job = Job.new
    @job.user_id = current_user.id
    if params
    @job.job_id = params[:job_id] 
    @job.type_task_id = params[:type_task] 
    @job.recurrency_id = params[:recurrency] 
  end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job }
    end
  end

  # GET /jobs/1/edit
  def edit
    @job = Job.find(params[:id])
  end

  # POST /jobs
  # POST /jobs.json
  def create
    @job = Job.new(params[:job])

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
        format.json { render json: @job, status: :created, location: @job }
      else
        format.html { render action: "new" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /jobs/1
  # PUT /jobs/1.json
  def update
    @job = Job.find(params[:id])

    respond_to do |format|
      if @job.update_attributes(params[:job])
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
    @job = Job.find(params[:id])
    @job.destroy

    respond_to do |format|
      format.html { redirect_to jobs_url }
      format.json { head :no_content }
    end
  end

  def reminder_tasks
    @jobs = Job.reminder_pending_tasks(current_user.id)
     respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @jobs }
    end
  end
  
  protected
  def conditions_to_collection
    params[:status].blank? ? status = false : params[:status]=="true" ? status = true : status = false
    params[:recurrency].blank? ? recurrency = nil : recurrency = " and recurrency_id = #{params[:recurrency]}"
    ["job_id is null and status = ? #{recurrency} and user_id = ?", status, current_user.id]
  end

end
