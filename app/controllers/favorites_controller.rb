class FavoritesController < ApplicationController
	before_action :set_favorite, only: [:show, :edit, :update, :destroy]
	protect_from_forgery
	skip_before_action :authorize, only: [:create, :index, :destroy]
	
	include CurrentCart
    before_action :set_cart

    def index
    	@client = current_client

    end


    # POST /favorites
	# POST /favorites.json
	
	def create
		@favorite = current_client.favorite
		p = Product.find(params[:product_id])
		if (p!=@favorite.products.find(params[:product_id]))
			@favorite.products << p
			redirect_to home_url
		else redirect_to store_index_url, notice: 'Товар уже добавлен в избранное' 
		end
		
    end


	

	def destroyRef
		

		redirect_to home_url
	end

private 

	def set_favorite
		@favorite = Favorite.find(params[:id])
	end
	def favorite_params
		params.require(:favorite).permit(:id, :product_id)
	end

end