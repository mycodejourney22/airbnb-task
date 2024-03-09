class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flat = Flat.find(params[:flat_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat
    if @booking.save
      redirect_to flat_path(@flat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @flat = current_user.flats if current_user.is_host
    @bookings = current_user.bookings
  end

  private

  def booking_params
    params.require(:booking).permit(:check_in_date, :check_out_date)
  end
end
