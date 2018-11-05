class ToysController < ApplicationController

  def index
    if params[:search].blank?
      @toys = Toy.all
    else
      @toys = Toy.where("name ilike '%#{params[:search]}%'")
    end
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
end
