class HomesController < ApplicationController

  def top
    @list = List.new
    @lists = params[:name].present? ? Tag.find(params[:name]).lists : List.all
    @tags = Tag.all
  end

end
