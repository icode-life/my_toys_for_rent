class UsersController < ApplicationController
  def show
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @user = User.find(params[:id])
    authorize @user
    # authorize @bookings
  end
end
