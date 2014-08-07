class StoreController < ApplicationController
  skip_before_action :authorize#, only: :composition
  include CurrentCart
  before_action :set_cart
  def index
    #@products = Product.order(:title)
    @search = Product.search(params[:q])
    @products = @search.result(distinct: true)
    @categories = Category.all
    @carts = Cart.all
    @client = current_client
  end
end
