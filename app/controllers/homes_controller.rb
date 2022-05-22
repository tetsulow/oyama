class HomesController < ApplicationController

  def top
    @lists = List.all
  end

end
