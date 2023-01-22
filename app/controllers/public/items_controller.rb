class Public::ItemsController < ApplicationController

  def new
    @items = Item.new
  end

  def show
    @items = Item.find(params[:id])
    @cart_item = CartItem.new
  end

  def index
    @items = Item.all
    @allitems = Item.page(params[:page])
  end

  def create
    item = Item.new(params[:id])
    item.save
    redirect_to public_items_path
  end



  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :genre_id, :is_active, :image)
  end

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :email, :postal_code,:address, :telephon_number, :is_deleted )
  end

end
