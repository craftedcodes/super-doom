class SuperpowersController < ApplicationController
  before_action :set_superpower, only: [:show, :update, :destroy]

  def new
    @superpower = Superpower.new
  end

  def create
    user = current_user
    @superpower = Superpower.new(superpower_params)
    @superpower.user = user
    if @superpower.save
      redirect_to superpowers_path
    else
      render :new
    end
  end

  def index
    @superpowers = Superpower.all
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_superpower
    @superpower = Superpower.find(params[:id])
  end

  def superpower_params
    params.require(:superpower).permit(:name, :price, :description)
  end
end
