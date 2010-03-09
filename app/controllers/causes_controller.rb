class CausesController < ApplicationController
  # GET /causes
  # GET /causes.xml
  def index
    @causes = Cause.all :order => 'created_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @causes }
    end
  end

  # GET /causes/1
  # GET /causes/1.xml
  def show
    @cause = Cause.find(params[:id])
    if params.key? :editorId
      case params[:editorId]
      when 'description'
        render :text => @cause.description
      end
    end
    # respond_to do |format|
    #   format.html # show.html.erb
    #   format.xml  { render :xml => @cause }
    # end
  end

  # GET /causes/new
  # GET /causes/new.xml
  def new
    @cause = Cause.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cause }
    end
  end

  # GET /causes/1/edit
  def edit
    @cause = Cause.find(params[:id])
  end
  def edit_inplace
    @cause = Cause.find(params[:id])
    @cause.update_attribute(:description, params[:value])
    @text = @cause.description
  end
  
  # def hello
  #   @cause = Cause.find(params[:id])
  #   
  #   if params.key? @cause.login_hash
  #       @cause.update_attribute :confirmed, true
  #       session["cause-#{@cause.id}"] = true
  #   end
  #   redirect_to @cause
  # end

  # POST /causes
  # POST /causes.xml
  def create
    @cause = Cause.new(params[:cause])
    
    user_session = UserSession.find
    @cause.user = user_session.user if user_session

    respond_to do |format|
      if @cause.save
        # flash[:notice] = 'Cause was successfully created.'
        session["cause-#{@cause.id}"] = true
        format.html { redirect_to(@cause) }
        format.xml  { render :xml => @cause, :status => :created, :location => @cause }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cause.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /causes/1
  # PUT /causes/1.xml
  def update
    @cause = Cause.find(params[:id])

    respond_to do |format|
      if @cause.update_attributes(params[:cause])
        flash[:notice] = 'Cause was successfully updated.'
        format.html { redirect_to(@cause) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cause.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /causes/1
  # DELETE /causes/1.xml
  def destroy
    @cause = Cause.find(params[:id])
    @cause.destroy

    respond_to do |format|
      format.html { redirect_to(causes_url) }
      format.xml  { head :ok }
    end
  end
end
