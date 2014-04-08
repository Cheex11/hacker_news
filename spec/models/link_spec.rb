require 'spec_helper'

describe Link do

  it { should validate_presence_of :url }
  it { should validate_presence_of :title }

  it 'does something' do
    link = FactoryGirl.create(:link)
    link2 = FactoryGirl.create(:link)
  end
end
