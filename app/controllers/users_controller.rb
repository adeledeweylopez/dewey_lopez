class UsersController < ApplicationController
  before_action :hide_blogroll,     only: [:show]
  before_action :signed_in_user,    only: [:edit, :update, :destroy]
  #before_action :signed_out_user,  only: [:new, :create]
  before_action :correct_user,    only: [:edit, :update]
  before_action :admin_user,    only: [:destroy, :new, :create]

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:user_alias])
    if @user.nil?
      redirect_to root_url
    end
  end

  def blog
    @user = User.find(params[:user_alias])
    @page = current_user.pages.build if signed_in?
    @display = true
    if current_user?(@user)
      @feed_items = @user.feed.paginate(page: params[:page])
    else
      # Only show public pages to the public.
      @feed_items = @user.feed.where("public = ?",
                                     true).paginate(page: params[:page])
    end
  end

  def feed
    @user = User.find(params[:user_alias])

    @title = @user.name + "'s blog"
    @feed_items = @user.feed

    @updated = @feed_items.first.updated_at unless @feed_items.empty?

    respond_to do |format|
      format.atom { render :layout => false }

      # we want the RSS feed to redirect permanently to the ATOM feed
      format.rss { redirect_to feed_path(:format => :atom), :status => :moved_permanently }
    end

  end


  def new
    @user = User.new
  end

  def create
    # TODO: Fix messaging system.
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome!"
      redirect_to username_url(@user.user_alias)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    # TODO: Fix messaging system.
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to username_url(@user.user_alias)
    else
      render 'edit'
    end
  end

  def destroy
    # TODO: Fix messaging system.
    @user = User.find(params[:user_alias])
    if @user.nil?
      redirect_to root_url
    elsif current_user?(@user)
      redirect_to root_url
    else
      @user.destroy
      flash[:success] = "User deleted."
      redirect_to users_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:name,
                                 :user_alias,
                                 :email,
                                 :password,
                                 :password_confirmation,
                                 :icon,
                                 :sidebar,
                                 :bio)
  end

  # Before filters

  def signed_out_user
    unless !signed_in?
      redirect_to root_url
    end
  end

  def correct_user
    @user = User.find(params[:user_alias])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end

  def hide_blogroll
    @display = false
  end
end
