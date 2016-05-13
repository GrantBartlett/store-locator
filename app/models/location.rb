class Location < ActiveRecord::Base
  validates :name_en, presence: true
  validates :name_ar, presence: true
  validates :region_en, presence: true
  validates :region_ar, presence: true
  validates :opening_hours_en, presence: true
  validates :opening_hours_ar, presence: true
  validates :content_en, presence: true
  validates :content_ar, presence: true
  validates :lat, presence: true
  validates :lng, presence: true

  store_accessor :name, [:name_en, :name_ar]
  store_accessor :region, [:region_en, :region_ar]
  store_accessor :opening_hours, [:opening_hours_en, :opening_hours_ar]
  store_accessor :content, [:content_en, :content_ar]
  belongs_to :brand
end
