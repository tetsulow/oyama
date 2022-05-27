class ListsController < ApplicationController

  def new
    @list = List.new
    @current_user ||= User.find_by(id: session[:user_id])   #管理人にのみ操作できる機能を付与
  end

  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list.id)  #新しい記事が作成できたら記事の詳細ページに移行
    else
      render :new  #記事の作成に失敗したら記事作成画面に戻る  
    end
  end

  def index
    @lists = List.all  #投稿された全て記事を取得
  end

  def show
    @list = List.find(params[:id])
    @list_comment = ListComment.new
    @current_user ||= User.find_by(id: session[:user_id])   #管理人にのみ操作できる機能を付与
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)    #編集した記事が保存できたら記事の詳細ページに
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
    params.require(:list).permit(:title, :body, tag_ids: [])
  end

end
