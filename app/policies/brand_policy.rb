class BrandPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  attr_reader :user, :brand

  def initialize(user, brand)
    @user = user
    @brand = brand
  end

  def update?
    user.admin? or not brand.published?
  end
end
