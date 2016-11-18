require 'rails_helper'

RSpec.describe "net/users/new", type: :view do
  before(:each) do
    assign(:net_user, Net::User.new())
  end

  it "renders new net_user form" do
    render

    assert_select "form[action=?][method=?]", net_users_path, "post" do
    end
  end
end
