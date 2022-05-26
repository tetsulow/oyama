class HomesController < ApplicationController

  def top
    @list = List.new
    @lists = List.all
    @tags = Tag.all
  end

end
