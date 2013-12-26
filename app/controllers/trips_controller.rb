class TripsController < ApplicationController
before_filter :admin_user, only: [:create, :destroy, :new, :edit, :update]


  def home
    @trips = Trip.all
  end

  def show
  	@trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
    @trip.aviasalers.build
    @trip.hotels.build
    @trip.tickets.build
    @trip.hotelsalers.build
  end

  def create
    @trip = current_user.trips.build(params[:trip])
    if @trip.save
      flash[:success] = "Trip created!"
      redirect_to root_url
    else
      render 'new'
    end
  end

  def destroy
    Trip.find(params[:id]).destroy
    flash[:success] = "deleted"
    redirect_to root_url
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])
    if @trip.update_attributes(params[:trip])
      flash[:success] = "Trip updated"
      redirect_to @trip
    else
      render 'edit'
    end
  end  
end