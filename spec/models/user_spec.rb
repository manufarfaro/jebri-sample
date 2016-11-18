require 'rails_helper'

RSpec.describe User, type: :model do

  it 'should have a name' do
    expect(:name).not_to be_blank
  end

  it 'should assign client role when initialized' do
    expect(subject.role).to eq(:client.to_s)
  end

end
