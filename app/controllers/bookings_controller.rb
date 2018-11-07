class BookingsController < ApplicationController
<<<<<<< HEAD
  before_action :find_booking, except: [:index, :new, :create]

=======
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index
>>>>>>> f5a09acf58a8fee108fa25535a0caf3c1b4e1ba6

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @booking = policy_scope(Booking).find(params[:id])
  end

  def new
    @booking = Booking.new
    @toy = Toy.find(params[:toy_id])
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @toy = Toy.find(params[:toy_id])
    @booking.toy = @toy
    @booking.user = current_user
    authorize @booking
    raise
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end


  def edit
  end

  def update
    # view action: make a display of the updated item (show)
    # display the editable item fields
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :user_id, :toy_id)
  end
end
