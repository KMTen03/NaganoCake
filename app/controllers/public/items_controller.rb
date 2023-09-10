class Public::ItemsController < ApplicationController
  def index
    @items = Item.page(params[:page])
    @item = Item.all
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def items_params
    params.require(:item).permit(:name, :introduction, :price, :image)
  end
end
