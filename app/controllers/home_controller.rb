class HomeController < ApplicationController

  def index
    uri = URI("http://www.webmotors.com.br/carro/marcas")

    response = Net::HTTP.post_form(uri, {})
    json = JSON.parse response.body

    json.each do |make_params|
      Brand.create(name: make_params["Nome"], webmotors_code: make_params["Id"])
    end

    @brandes = Brand.all
  end
end
