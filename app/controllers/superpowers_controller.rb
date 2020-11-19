class SuperpowersController < ApplicationController
  before_action :set_superpower, only: [:show, :edit, :update, :destroy]

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
    @superpowers = Superpower.srch(params[:query]) if params[:query].present?
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @markers = @superpowers.geocoded.map do |superpower|
      {
        lat: superpower.latitude,
        lng: superpower.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { superpower: superpower })
      }
    end
  end

  def show
    # set_superpower already included because of before_action where it's connected to show
    # display one superpower
    # no code needed due to set_superpower
  end

  def edit
    # set_superpower is already (similar to show)
    # in view being edited and then used in update
  end

  def update
    # don't forget to make the update method and to check if it's included in before_action!
    if @superpower.update(superpower_params)
      redirect_to superpower_path(@superpower)
    else
      render :edit
    end
  end

  def destroy
    # set_superpower finds it
    # deleting it
    # redirect
    @superpower.destroy
    redirect_to superpowers_path
  end

  private

  def set_superpower
    @superpower = Superpower.find(params[:id])
  end

  def superpower_params
    params.require(:superpower).permit(:name, :price, :description, :photo, :location, :coordinates)
  end
end
