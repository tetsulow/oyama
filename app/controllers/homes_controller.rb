class HomesController < ApplicationController

  def top
    @list = List.new
    @lists = List.all
  end

end
