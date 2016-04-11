class Brand < ActiveRecord::Base
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :logo, presence: true
  validates :url, presence: true

  belongs_to :user
  has_many :brand_locations
end
