class CarModel < ApplicationRecord
  belongs_to :brand
  validates :name, presence: true, uniqueness: { scope: :brand_id, case_sensitive: false }
  validates :brand_id, presence: true
end
