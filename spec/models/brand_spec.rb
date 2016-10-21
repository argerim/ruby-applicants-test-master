require 'rails_helper'

RSpec.describe Brand, type: :model do

  subject { create(:brand) }

  context 'Validations' do
    [:name].each do |attr|
      it { should validate_uniqueness_of(attr).case_insensitive  }
    end
    [:webmotors_code].each do |attr|
      it { should validate_uniqueness_of(attr) }
    end
    [:name, :webmotors_code].each do |attr|
      it { should validate_presence_of(attr) }
    end
  end

  context 'Associations' do
    [:car_models].each do |asso|
      it { should have_many(asso) }
    end
  end
end
