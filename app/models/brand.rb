class Brand < ApplicationRecord
  has_many :car_models
  validates :webmotors_code, presence: true, uniqueness: true
  validates :name, presence: true, uniqueness: {case_sensitive: false}
end