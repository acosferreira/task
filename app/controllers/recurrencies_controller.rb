class RecurrenciesController < ApplicationController
  # GET /recurrencies
  # GET /recurrencies.json
  def index
    @recurrencies = Recurrency.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recurrencies }
    end
  end

  # GET /recurrencies/1
  # GET /recurrencies/1.json
  def show
    @recurrency = Recurrency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recurrency }
    end
  end

  # GET /recurrencies/new
  # GET /recurrencies/new.json
  def new
    @recurrency = Recurrency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recurrency }
    end
  end

  # GET /recurrencies/1/edit
  def edit
    @recurrency = Recurrency.find(params[:id])
  end

  # POST /recurrencies
  # POST /recurrencies.json
  def create
    @recurrency = Recurrency.new(params[:recurrency])

    respond_to do |format|
      if @recurrency.save
        format.html { redirect_to @recurrency, notice: 'Recurrency was successfully created.' }
        format.json { render json: @recurrency, status: :created, location: @recurrency }
      else
        format.html { render action: "new" }
        format.json { render json: @recurrency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recurrencies/1
  # PUT /recurrencies/1.json
  def update
    @recurrency = Recurrency.find(params[:id])

    respond_to do |format|
      if @recurrency.update_attributes(params[:recurrency])
        format.html { redirect_to @recurrency, notice: 'Recurrency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recurrency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recurrencies/1
  # DELETE /recurrencies/1.json
  def destroy
    @recurrency = Recurrency.find(params[:id])
    @recurrency.destroy

    respond_to do |format|
      format.html { redirect_to recurrencies_url }
      format.json { head :no_content }
    end
  end
end
