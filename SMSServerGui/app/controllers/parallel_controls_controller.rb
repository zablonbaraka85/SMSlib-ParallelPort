class ParallelControlsController < ApplicationController
  # GET /users
  # GET /users.xml
  def index
    @parallel_controls = ParallelManagement.all
    @parallel_control = ParallelManagement.new
    @buildings = Building.find(:all)
    @floors   = Floor.find(:all)
    @flats   = Flat.find(:all)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parallel_controls }
    end
  end
  
  
   def update_buildings
    # updates artists and songs based on genre selected
    building = Building.find(params[:building_id])
    artists = genre.artists
    flats   = genre.flats

    render :update do |page|
      page.replace_html 'artists', :partial => 'floors', :object => floors
      page.replace_html 'songs',   :partial => 'flats',   :object => flats
    end
  end

  def update_floors
    # updates songs based on artist selected
    building = Building.find(params[:building_id])
    floor  = floor.flats

    render :update do |page|
      page.replace_html 'songs', :partial => 'flats', :object => flats
    end
  end
  
  
  
  # GET /users/1
  # GET /users/1.xml
  def show
    @parallel_management = ParallelManagement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @parallel_management }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @parallel_management = ParallelManagement.new
    @parallel_configuration = ParallelConfiguration.new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @parallel_management }
    end
  end

  # GET /users/1/edit
  def edit
    @parallel_management = ParallelManagement.find(params[:id])
  end

  # POST /users
  # POST /users.xml
  def create
    @parallel_management = ParallelConfiguration.new(params[:parallel_management])

    respond_to do |format|
      if @parallel_management.save
        flash[:notice] = 'Parallel Management was successfully created.'
        format.html { redirect_to(@parallel_management) }
        format.xml  { render :xml => @parallel_management, :status => :created, :location => @parallel_management }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @parallel_management.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @parallel_management = ParallelConfiguration.find(params[:id])

    respond_to do |format|
      if @parallel_management.update_attributes(params[:parallel_management])
        flash[:notice] = 'Parallel Management was successfully updated.'
        format.html { redirect_to(@parallel_management) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @parallel_management.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @parallel_management = ParallelConfiguration.find(params[:id])
    @parallel_management.destroy

    respond_to do |format|
      format.html { redirect_to(parallel_managements_url) }
      format.xml  { head :ok }
    end
  end
end
