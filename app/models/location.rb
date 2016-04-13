class Location < ActiveRecord::Base
  # params[:location].permit([:name, :lat, :lng, :content, :url])
  validates :name, presence: true
  validates :lat, presence: true
  validates :lng, presence: true
  belongs_to :brand
end
