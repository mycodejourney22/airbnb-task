class FlatsController < ApplicationController
  def index
    if params.present?
      @flats = Flat.where(final_query(params))
    else
      @flats = Flat.all
    end
  end

  def search
  end

  def new
    @flat = Flat.new
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flats_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:address, :price, :guest, :flat_type, photos: [])
  end

  def final_query(params)
    query_conditions = []
    if params[:address].present?
      query_conditions << "address ILIKE '%#{params[:address]}%'"
    end
    if params[:guest].present?
      query_conditions << "guest ILIKE '%#{params[:guest]}%'"
    end
    query_conditions.join(' AND ')
  end

end
