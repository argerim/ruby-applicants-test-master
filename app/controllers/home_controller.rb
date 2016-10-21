class HomeController < ApplicationController

  def index
    @brandes = Brand.all
  end
end
