class HomesController < ApplicationController

  def top
    @list = List.new
    @lists = params[:name].present? ? Tag.find(params[:name]).lists : List.all  #nameがセットされていたらTagから関連づけられたlistsを呼び、nameの指定がなければ、全ての投稿を表示する
    @tags = Tag.all  #全ての登録されたタグを取得
  end

end
