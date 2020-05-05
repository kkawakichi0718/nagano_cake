class Public::ItemsController < ApplicationController
	def top
	end
    
	def index
		@items = Item.all
	end
end
