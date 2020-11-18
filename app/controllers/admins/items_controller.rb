class Admins::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @item = Item.all
  end

  def new
    @item = Item.new()
    @genre = Genre.all

  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admins_item_path (@item.id)
    else
      @genre = Genre.all
      render new_admins_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    @genre = Genre.all
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to admins_item_path(@item)
    else
      @genre = Genre.all
      render template: 'admins/items/edit'

    end
  end

  private
  def item_params
    params.require(:item).permit(:genre_id, :name, :explanation, :tax_out_price, :image, :is_sale)
  end

end
