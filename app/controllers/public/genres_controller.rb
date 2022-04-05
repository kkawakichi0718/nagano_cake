class Public::GenresController < ApplicationController
	def index
	end

	def show
		@genre = Genre.find(params[:id])
		@genres = @genre.items
	end
end
