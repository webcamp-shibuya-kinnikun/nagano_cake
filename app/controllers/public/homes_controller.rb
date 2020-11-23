class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @random = Item.all.sample(4)
  end

  def about
    @random = Item.all.sample(7)
  end
end
