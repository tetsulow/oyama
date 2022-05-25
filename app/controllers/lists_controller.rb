class ListsController < ApplicationController
  before_action :admin_user, only: :destroy

  def new
    @list = List.new
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

  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end

  def list_params
    params.require(:list).permit(:title, :body)
  end

end
