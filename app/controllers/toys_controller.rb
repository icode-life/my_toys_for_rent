class ToysController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_toy, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].blank?
      @toys = Toy.all
    else
      @toys = Toy.where("name ilike '%#{params[:search]}%'")
    end
  end

  def new
    # @user = User.find(params[:owner_id])
    @toy = Toy.new
  end

  def create
   @toy = Toy.new(toy_params)
   @toy.owner = current_user
   if @toy.save
    redirect_to toy_path(@toy)
  else
    render :new
  end
end

def show

end

def edit
  @toy.owner = current_user
end

def update
  @toy.owner = current_user
  @toy.update(toy_params)
  redirect_to toy_path(@toy)
end

def destroy
  @toy.destroy
  redirect_to = toys_path
end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_toy
    @toy = Toy.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def toy_params
    params.require(:toy).permit(:name, :description, :category, :price, :photo)
  end
end
