class UsersController < ApplicationController

  def index
    @users = User.all
    #@users = User.paginate(:page => params[:page], :per_page => 10)
      @users = User.all
      @myusers = User.all
      @myusers = User.where({invited_by_id: current_user.id})
  end

  def users
    @users = User.all

    #@users = User.paginate(:page => params[:page], :per_page => 10)
  end

 def edit
   @user = User.find(params[:id])
 end

 def destroy
   @users = User.find(params[:id])
   @users.destroy

   redirect_to users_path
 end
 def update
    @users = User.find(params[:id])
    @users.update_attributes(params.require(:user).permit(:first_name, :last_name, :email, :company, :job_title, :phone, :role,:agency_id))

    redirect_to users_path
end

 private

   def user_params
     params.require(:user).permit(:first_name, :last_name, :email, :company, :job_title, :phone, :role, :agency_id)
   end


end
