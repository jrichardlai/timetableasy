class UsersController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  before_filter :login_required
  load_and_authorize_resource
  # render new.rhtml
  def new
  end

  def edit
  end

  # PUT /cursuses/1
  # PUT /cursuses/1.xml
  def update
    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:notice] = 'User was successfully updated.'
        format.html { redirect_to(users_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def index
    @users = User.all  
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end
 
  def create
    success = @user && @user.save
    if success && @user.errors.empty?
      redirect_back_or_default('/')
    else
      render :action => 'new'
    end
  end

end
