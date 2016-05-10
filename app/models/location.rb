class Location < ActiveRecord::Base
  validates :name, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :region, presence: true
  belongs_to :brand
end
