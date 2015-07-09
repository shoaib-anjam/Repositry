class UsersController < ApplicationController
  def index
  	@users=User.all
  end
  def new
    @user = User.new
  end
    def show
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def delete
  	@user = User.find(params[:id])
  end


  def create
  	@user=User.new(story_prams)

  	if @user.save
  		flash[:notice] = 'User Has Been Created successfully'
  		redirect_to users_path
  	else
  		render('new')
  	end
  end

  def destroy
  	user = User.find(params[:id])
  	user.destroy
  	flash[:notice] = "User #{user.name} Deleted successfully"

  	redirect_to users_path
  end


  def update
  	@user = User.find(params[:id])
	if @user.update_attributes(user_prams)
		flash[:notice] = 'User updated successfully'

		redirect_to user_path(@user)
	else
	  	render('edit')
	end
  end

  private 
  def story_prams
  	params.require(:user).permit(:name,:email)
  end 
end
