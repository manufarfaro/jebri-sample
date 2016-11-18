require 'rails_helper'

RSpec.describe "net/users/index", type: :view do
  before(:each) do
    assign(:net_users, [
      Net::User.create!(),
      Net::User.create!()
    ])
  end

  it "renders a list of net/users" do
    render
  end
end
