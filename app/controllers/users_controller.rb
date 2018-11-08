class UsersController < ApplicationController
  def show
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @user = User.find(params[:id])
    authorize @user
    # authorize @bookings
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    params.required(:user).permit(:email, :address, :f_name, :l_name, :photo)
  end

end
