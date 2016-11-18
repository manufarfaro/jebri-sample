require 'rails_helper'

RSpec.describe "net/users/edit", type: :view do
  before(:each) do
    @net_user = assign(:net_user, Net::User.create!())
  end

  it "renders the edit net_user form" do
    render

    assert_select "form[action=?][method=?]", net_user_path(@net_user), "post" do
    end
  end
end
