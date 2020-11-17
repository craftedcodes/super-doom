class RentsController < ApplicationController
  def index 
    @rents = Rent.all
  end
  
  def create
    @superpower = Superpower.find(params[:superpower_id])
    @rent = Rent.new(rent_params)
    @rent.superpower = @superpower 
    if @rent.save 
      redirect_to @superpower 
    else 
      render "superpowers/show"
    end
  end
  
  #to cancel a reservation
  def destroy
    @rent = Rent.find(params[:id])
    @rent.destroy
    redirect_to superpowers_path
  end

  private
  def rent_params
    params.require(:rent).permit(:date_from, :date_to)
  end
end
