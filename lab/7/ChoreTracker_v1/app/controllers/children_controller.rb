class ChildrenController < ApplicationController
  
  before_filter :login_required
  
  def index
    @children = Child.all
  end
  
  def show
    @child = Child.find(params[:id])
    @upcoming_chores = Chore.all.upcoming.for_child(@child.id).paginate :page => params[:page], :per_page => 5
  end
  
  def new
    @child = Child.new
  end
  
  def create
    @child = Child.new(params[:child])
    if @child.save
      flash[:notice] = "Successfully created child."
      redirect_to @child
    else
      render :action => 'new'
    end
  end
  
  def edit
    @child = Child.find(params[:id])
  end
  
  def update
    @child = Child.find(params[:id])
    if @child.update_attributes(params[:child])
      flash[:notice] = "Successfully updated child."
      redirect_to @child
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    flash[:notice] = "Successfully destroyed child."
    redirect_to children_url
  end
end
