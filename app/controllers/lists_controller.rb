class ListsController < ApplicationController
before_filter :authenticate_user!
  # GET /lists
  # GET /lists.xml
  def index
    @lists = List.all(:conditions=>{:user_id => current_user})
    @latest = List.all(:conditions=>{:share=>true}, :limit=>5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @lists }
    end
  end

  # GET /lists/1
  # GET /lists/1.xml
  def show
    @list = List.find(params[:id])
    if @list.share == true || @list.user == current_user
      @tasks = Task.all(:conditions=>{:list_id => @list}, :order=>"status ASC, priority_id ASC")
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @list }
      end
    end
  end

  # GET /lists/new
  # GET /lists/new.xml
  def new
    @list = List.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @list }
    end
  end

  # GET /lists/1/edit
  def edit
    @list = List.find(params[:id])
  end

  # POST /lists
  # POST /lists.xml
  def create
    @list = List.new(params[:list])
    @list.user = current_user

    respond_to do |format|
      if @list.save
        flash[:notice] = 'List was successfully created.'
        format.html { redirect_to(:action=>"index") }
        format.xml  { render :xml => @list, :status => :created, :location => @list }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /lists/1
  # PUT /lists/1.xml
  def update
    @list = List.find(params[:id])
    if @list.user == current_user
      respond_to do |format|
        if @list.update_attributes(params[:list])
          flash[:notice] = "List was successfully updated."
          format.html { redirect_to(:action=>"index") }
          format.xml  { head :ok }
        else
          format.html { render :action => "edit" }
          format.xml  { render :xml => @list.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /lists/1
  # DELETE /lists/1.xml
  def destroy
    @list = List.find(params[:id])
    @list.destroy

    respond_to do |format|
      format.html { redirect_to(lists_url) }
      format.xml  { head :ok }
    end
  end
end
