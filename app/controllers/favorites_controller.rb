class FavoritesController < ApplicationController
	protect_from_forgery
	skip_before_action :authorize, only: [:create, :index]
	
	include CurrentCart
    before_action :set_cart

    def index
    	@client = current_client

    end

	
	def create
		@client = current_client
		@client.favorite.products << Product.find_by(params[:id])
    end


	

	def destroy 
	end

private 
	def favorite_params
      params.require(:favorite).permit(:id)
    end

end