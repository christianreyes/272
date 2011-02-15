class ChoresController < ApplicationController
  def index
    @chores = Chore.all
  end

  def show
    @chore = Chore.find(params[:id])
  end

  def new
    @chore = Chore.new
  end

  def create
    @chore = Chore.new(params[:chore])
    if @chore.save
      flash[:notice] = "Successfully created chore."
      redirect_to @chore
    else
      render :action => 'new'
    end
  end

  def edit
    @chore = Chore.find(params[:id])
  end

  def update
    @chore = Chore.find(params[:id])
    if @chore.update_attributes(params[:chore])
      flash[:notice] = "Successfully updated chore."
      redirect_to chore_url
    else
      render :action => 'edit'
    end
  end

  def destroy
    @chore = Chore.find(params[:id])
    @chore.destroy
    flash[:notice] = "Successfully destroyed chore."
    redirect_to chores_url
  end
end
