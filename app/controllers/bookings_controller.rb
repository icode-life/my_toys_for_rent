class BookingsController < ApplicationController
  before_action :find_booking


  def index
    if params[:search].blank?
      @bookings = Booking.all
    else
      @bookings = Booking.where("name ilike '%#{params[:search]}%'")
    end
    @bookings = policy_scope(Booking)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    if @booking.save
      redirect_to toys_path
    else
      render :new
    end
  end

  def show
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






