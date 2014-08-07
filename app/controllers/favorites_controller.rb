class FavoritesController < ApplicationController
	before_action :set_favorite, only: [:show, :edit, :update, :destroy]
	protect_from_forgery
	skip_before_action :authorize, only: [:create, :index]
	
	include CurrentCart
    before_action :set_cart

    def index
    	@client = current_client

    end


    # POST /favorites
	# POST /favorites.json
	
	def create
		@client = current_client
		@client.favorite.products << Product.find_by(params[:id])
		redirect_to home_url
    end


	

	def destroy 
	end

private 

	def set_favorite
		@favorite = Favorite.find(params[:id])
	end
	def favorite_params
		params.require(:favorite).permit(:id)
	end

end