class HomeController < ApplicationController

  def index
    UpdateBrands.new

    @brandes = Brand.all
  end
end
