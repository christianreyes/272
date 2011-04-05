class TownsController < ApplicationController
  def index
    @towns = Town.all
  end

  def show
    @town = Town.find(params[:id])
  end

  def new
    @town = Town.new
	3.times{@town.attractions.build}
  end

  def create
    @town = Town.new(params[:town])
    if @town.save
      redirect_to @town, :notice => "Successfully created town."
    else
      render :action => 'new'
    end
  end

  def edit
    @town = Town.find(params[:id])
  end

  def update
    @town = Town.find(params[:id])
    if @town.update_attributes(params[:town])
      redirect_to @town, :notice  => "Successfully updated town."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @town = Town.find(params[:id])
    @town.destroy
    redirect_to towns_url, :notice => "Successfully destroyed town."
  end
end
