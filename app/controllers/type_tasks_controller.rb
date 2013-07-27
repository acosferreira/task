class TypeTasksController < ApplicationController
  # GET /type_tasks
  # GET /type_tasks.json
  before_filter :authenticate_user!

  add_breadcrumb 'Type Tasks', :type_tasks_path
  add_breadcrumb 'Create a new type_tasks', '', :only => [:new, :create]
  add_breadcrumb 'Edit a type_tasks', '', :only => [:edit, :update]

  def index
    @type_tasks = TypeTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @type_tasks }
    end
  end

  # GET /type_tasks/1
  # GET /type_tasks/1.json
  def show
    @type_task = TypeTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @type_task }
    end
  end

  # GET /type_tasks/new
  # GET /type_tasks/new.json
  def new
    @type_task = TypeTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @type_task }
    end
  end

  # GET /type_tasks/1/edit
  def edit
    @type_task = TypeTask.find(params[:id])
  end

  # POST /type_tasks
  # POST /type_tasks.json
  def create
    @type_task = TypeTask.new(params[:type_task])

    respond_to do |format|
      if @type_task.save
        format.html { redirect_to @type_task, notice: 'Type task was successfully created.' }
        format.json { render json: @type_task, status: :created, location: @type_task }
      else
        format.html { render action: "new" }
        format.json { render json: @type_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /type_tasks/1
  # PUT /type_tasks/1.json
  def update
    @type_task = TypeTask.find(params[:id])

    respond_to do |format|
      if @type_task.update_attributes(params[:type_task])
        format.html { redirect_to @type_task, notice: 'Type task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @type_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_tasks/1
  # DELETE /type_tasks/1.json
  def destroy
    @type_task = TypeTask.find(params[:id])
    @type_task.destroy

    respond_to do |format|
      format.html { redirect_to type_tasks_url }
      format.json { head :no_content }
    end
  end
end
