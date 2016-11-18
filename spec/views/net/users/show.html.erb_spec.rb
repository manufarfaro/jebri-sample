require 'rails_helper'

RSpec.describe "net/users/show", type: :view do
  before(:each) do
    @net_user = assign(:net_user, Net::User.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
