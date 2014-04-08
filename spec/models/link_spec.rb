require 'spec_helper'

describe Link do

  it { should validate_presence_of :url }
  it { should validate_presence_of :title }

  it { should have_many :comments }

  describe '.order_by_score' do
    it 'should order the links' do
      link = FactoryGirl.create(:link)
      link2 = FactoryGirl.create(:link_with_score_10)
      link3 = FactoryGirl.create(:link_with_score_20)
      Link.order_by_score[0].should eq link3
      Link.order_by_score[1].should eq link2
      Link.order_by_score[2].should eq link
    end
  end

  # describe '#age' do
  #   it 'should return the hours since the link was created' do
  #     link = FactoryGirl.create(:link)
  #     link.update(:created_at => '2014-04-08 10:36 PDT')
  #     link.age.should eq "4 hours"
  #   end
  # end

  # describe '#age' do
  #   it 'should return the days since the link was created' do
  #     link = FactoryGirl.create(:link)
  #     link.update(:created_at => '2014-04-05 10:36 PDT')
  #     link.age.should eq "3 days"
  #   end
  # end

  # describe '#age' do
  #   it 'should return the minutes since the link was created' do
  #     link = FactoryGirl.create(:link)
  #     link.update(:created_at => '2014-04-08 14:32 PDT')
  #     link.age.should eq "31 minutes"
  #   end
  # end

  describe '#age' do
    it 'should return the minutes since the link was created' do
      link = FactoryGirl.create(:link)
      link.update(:created_at => '2014-04-03 14:32 PDT', :score => 100)
      link.modified_score.should eq 97.5
    end
  end

    describe '#age' do
    it 'should return the minutes since the link was created' do
      link = FactoryGirl.create(:link)
      link2 = FactoryGirl.create(:link_with_score_10)
      link3 = FactoryGirl.create(:link_with_score_20)
      link.update(:created_at => '2014-04-03 14:32 PDT', :score => 100)
      link2.update(:created_at => '2014-04-04 14:32 PDT', :score => 100)
      link3.update(:created_at => '2014-04-05 14:32 PDT', :score => 100)
      Link.order_by_modified_score[0].should eq link3
      Link.order_by_modified_score[1].should eq link2
      Link.order_by_modified_score[2].should eq link
    end
  end
end
