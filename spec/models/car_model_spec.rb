require 'rails_helper'

RSpec.describe CarModel, type: :model do
  subject { create(:car_model) }

  context 'Validations' do
    [:name].each do |attr|
      it { should validate_uniqueness_of(attr).scoped_to(:brand_id).case_insensitive  }
    end
    [:name, :brand_id].each do |attr|
      it { should validate_presence_of(attr) }
    end
  end

  context 'Associations' do
    [:brand].each do |asso|
      it { should belong_to(asso) }
    end
  end
end
