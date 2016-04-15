class Brand < ActiveRecord::Base
  include Obfuscate

  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :description, presence: true
  validates :logo, presence: true
  validates :url, presence: true

  belongs_to :user
  has_many :locations

  def to_param
    encrypt id
  end
end
