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

# Test comment
def nhu_method
end

def new
  @user = User.find(params[:id])
  @toy = Toy.new
end

def create

end

def show

end

def edit
end

def destroy
end

private

  # Use callbacks to share common setup or constraints between actions.
  def set_toy
    @toy = Toy.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def toys_params
    params.require(:toys).permit(:name, :description, :category, :price, :owner_id)
  end
end
