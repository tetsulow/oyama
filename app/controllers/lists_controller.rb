class ListsController < ApplicationController

  def new
    @list = List.new
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)
    else
      render :new
    end
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
    @list_comment = ListComment.new
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to root_path
  end

  def list_params
    params.require(:list).permit(:title, :body)
  end

end
