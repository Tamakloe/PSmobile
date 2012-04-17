class UsersController < ApplicationController

  before_filter :authenticate, :except => [:show, :new, :create]
  before_filter :correct_user, :only => [:edit, :update]
  before_filter :admin_user,   :only => :destroy

  # GET /users
  # GET /users.xml
  def index
    @title = "Members"
    @users = User.paginate(:page => params[:page], :per_page => 10)



    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(:page => params[:page],:per_page => 6)
    @title = @user.name

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/new
  # GET /users/new.xml
  def new
    @title = "Sign up"
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end

  # GET /users/1/edit
  def edit
    @title = "Edit Member"
   # @user = User.find(params[:id])    No longer required as the correct_user before filter defines @user 
  end

  # POST /users
  # POST /users.xml
  def create
    @user = User.new(params[:user])

    respond_to do |format|
      if @user.save
        sign_in @user
	flash[:success] = "Welcome to ProblemShared!        A problem shared is a problem halved!"
        format.html { redirect_to @user }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
	@title = "Sign Up"
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @title = "Update"
   # @user = User.find(params[:id])    No longer required as the correct_user before filter defines @user 

    respond_to do |format|
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile updated."
        format.html { redirect_to(@user, :notice => 'Member Profile updated.') }
        format.xml  { head :ok }
      else
	@title = "Edit Member"
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.xml
  def destroy
    @title= "Delete"
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "Member Removed."

    respond_to do |format|
      format.html { redirect_to(users_url) }
      format.xml  { head :ok }
    end
  end
  def ajaxdestroy
     @user = User.find(params[:id]).destroy
     render :partial => "users"  
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(:page => params[:page],:per_page => 5)
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(:page => params[:page],:per_page => 5)
    render 'show_follow'
  end


 private

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end


end
