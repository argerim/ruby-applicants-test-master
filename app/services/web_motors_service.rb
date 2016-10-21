class WebMotorsService

  attr_accessor :endpoint, :data

  def initialize(endpoint, data)
    @endpoint = endpoint
    @data     = data
  end

  def host
    "http://www.webmotors.com.br/carro/"
  end

  def uri
    URI(host.concat(possibles_endpoints.fetch(@endpoint)))
  end

  def post_form
    Net::HTTP.post_form(uri, @data)
  end

  def possibles_endpoints
    { car_model: "modelos", brand: "marcas" }
  end

  def json_parse
    JSON.parse(post_form.body)
  end

end