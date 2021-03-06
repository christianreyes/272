class PublishersController < ApplicationController
  def index
    @publishers = Publisher.all
  end

  def show
    @publisher = Publisher.find(params[:id])
  end

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.new(params[:publisher])
    if @publisher.save
      flash[:notice] = "Successfully created publisher."
      redirect_to @publisher
    else
      render :action => 'new'
    end
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update_attributes(params[:publisher])
      flash[:notice] = "Successfully updated publisher."
      redirect_to publisher_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy
    flash[:notice] = "Successfully destroyed publisher."
    redirect_to publishers_url
  end
end
