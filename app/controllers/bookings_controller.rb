class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
  after_action :verify_policy_scoped, only: :index

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @toy = Toy.find(params[:toy_id])
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
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end


  def edit
    @toy = Toy.find(params[:toy_id])
  end

  def update
    # view action: make a display of the updated item (show)
    # display the editable item fields
    if @booking.update(booking_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to user_path(current_user)
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
