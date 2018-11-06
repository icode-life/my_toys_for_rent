class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @booking = policy_scope(Booking).find(params[:id])
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    authorize @booking
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






