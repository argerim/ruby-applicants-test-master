class HomeController < ApplicationController

  def index
    WebMotorsService.new(:brand, {}).json_parse.each do |make_params|
      Brand.create(name: make_params["Nome"], webmotors_code: make_params["Id"])
    end

    @brandes = Brand.all
  end
end
