require 'rails_helper'

RSpec.describe "brands/index", type: :view do
  before(:each) do
    assign(:brands, [
      Brand.create!(),
      Brand.create!()
    ])
  end

  it "renders a list of brands" do
    render
  end
end
