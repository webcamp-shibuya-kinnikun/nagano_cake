class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    @random = Item.where(is_sale: true).sample(4)
  end

  def about
    @random = Item.where(is_sale: true).sample(5)
  end
end
