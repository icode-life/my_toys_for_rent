class ToysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_toy, only: [:edit, :update, :destroy]
  skip_after_action :verify_authorized, only: :show
  skip_after_action :verify_policy_scoped


  # Everyone that comes on the website can search for items
  def index
    if params[:search].blank?
      @toys = Toy.all
    else
      @toys = Toy.where("name ilike '%#{params[:search]}%'")
    end
    # @toys = policy_scope(Toy)
  end

  # Everyone can have access to details about a specific item
  def show
    @toy = Toy.find(params[:id])
  end

  # Only logged in users/admins can create new items
  def new
    @toy = Toy.new
    authorize @toy
  end

  def create
    @toy = Toy.new(toy_params)
    @toy.owner = current_user
    authorize @toy
    # raise
    if @toy.save
      redirect_to toy_path(@toy)
    else
      render :new
    end
  end


  def edit
  end

  def update
    @toy.update(toy_params)
    redirect_to toy_path(@toy)
  end


  def destroy
    if @toy.destroy
      redirect_to toys_path
    else
      "Something went wrong"
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_toy
    @toy = Toy.find(params[:id])
    authorize @toy
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def toy_params
    params.require(:toy).permit(:name, :description, :category, :price, :photo)
  end
end
