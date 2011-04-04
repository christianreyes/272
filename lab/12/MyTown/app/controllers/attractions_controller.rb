class AttractionsController < ApplicationController
  def index
    @attractions = Attraction.all
  end

  def show
    @attraction = Attraction.find(params[:id])
  end

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(params[:attraction])
    if @attraction.save
      redirect_to @attraction, :notice => "Successfully created attraction."
    else
      render :action => 'new'
    end
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update_attributes(params[:attraction])
      redirect_to @attraction, :notice  => "Successfully updated attraction."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @attraction = Attraction.find(params[:id])
    @attraction.destroy
    redirect_to attractions_url, :notice => "Successfully destroyed attraction."
  end
end
