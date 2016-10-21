require 'rails_helper'

RSpec.describe "ApplicationScenario", type: :feature do

  it "go on Home#index, select option, click button and show results", js: true do
    VCR.use_cassette("post_webmotors_brands_form") do
      visit root_path
      expect(page).to have_content("Escolha a Fabricante")
      find('#webmotors_code').find(:xpath, 'option[2]').select_option
      find(:xpath, "//input[@type='submit']").click
      expect(page).to have_content("<< Voltar")
    end
  end

end