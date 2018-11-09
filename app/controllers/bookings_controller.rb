class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]
  before_action :availability?, only: [:create, :update]
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
    @booking = Booking.new
    @toy = Toy.find(params[:toy_id])
    @booking.date_start = convert_to(booking_params[:date_start])
    @booking.date_end = convert_to(booking_params[:date_end])
    @booking.toy = @toy
    @booking.user = current_user
    authorize @booking
    if availability?
      if @booking.save!
        redirect_to user_path(current_user)
      else
        render :new
      end

    else
      render :show
    end
  end


  def edit
    @toy = Toy.find(params[:toy_id])
  end

  def update
    # view action: make a display of the updated item (show)
    # display the editable item fields
    if availability?
      if @booking.update(booking_params)
        redirect_to user_path(current_user)
      else
        render :edit
      end
    else
      render :show
    end
  end

  def destroy
    @booking.destroy
    redirect_to user_path(current_user)
  end

  private

  def availability?
    dates = Booking.where(toy_id: @toy)
    available = true
    dates.each do |existing_record|
      # if @booking[:date_start] >= existing_record[:date_end] && existing_record[:date_start] >= @booking[:date_end]
      if !((@booking[:date_start]..@booking[:date_end]).overlaps?(existing_record[:date_start]..existing_record[:date_end]))

      else
        available = false
      end
      return available
    end
  end

  def convert_to(date_string_from_picker)
    date_object = Date.strptime(date_string_from_picker, "%m/%d/%Y")
    date_object
  end

  def find_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:date_start, :date_end, :user_id, :toy_id)
  end
end
