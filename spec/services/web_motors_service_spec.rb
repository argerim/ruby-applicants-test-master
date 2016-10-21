require 'rails_helper'

RSpec.describe WebMotorsService do

  context "Brands", vcr: { cassette_name: "post_webmotors_brands" } do
    let(:web_motors_service) { WebMotorsService.new(:brand, {}).json_parse }

    it "returns all brands as Array" do
      expect(web_motors_service).to be_kind_of(Array)
    end

    it "returned first brand" do
      expect(web_motors_service.first).to eql({"Id"=>0, "Nome"=>"", "Count"=>0, "IsPrincipal"=>false, "Selected"=>false, "NomeAmigavel"=>""})
    end

    it "not empty array" do
      expect(web_motors_service).to_not be_empty
    end
  end

  context "Car Models", vcr: { cassette_name: "post_webmotors_car_models" } do
    context "with valid id (2)" do
      let(:web_motors_service) { WebMotorsService.new(:car_model, { marca: 2 }).json_parse }

      it "returns all car models as Array" do
        expect(web_motors_service).to be_kind_of(Array)
      end

      it "returned first car model" do
        expect(web_motors_service.first).to eql({"Id"=>2079, "Nome"=>"A10", "Count"=>0, "NomeAmigavel"=>"a10"})
      end
    end

    context "not send data" do
      let(:web_motors_service) { WebMotorsService.new(:car_model).json_parse }

      it 'returns error' do
        expect { web_motors_service }.to raise_error(ArgumentError)
      end
    end
  end
end