class StaticPagesController < ApplicationController
  def index
  end

  def landing_page
    @featured_product = Product.first
	@products = Product
	@featuredBrand = "Taylor Made"
	@brand = "TaylorMade"
  end
  
end
