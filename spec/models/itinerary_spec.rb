require 'spec_helper'

describe PlanB::Itinerary do
  it { should validate_presence_of(:title) }
  it { should validate_uniqueness_of(:title) }
  it { should have_many(:hiking_templates).through(:itinerary_templates) }

  describe 'itinerary template creation' do
    let(:itinerary) { PlanB::Itinerary.create title: 'Great stuff' }

    it 'should be able to add a hiking template' do
      itinerary.itinerary_templates.create(template: PlanB::HikingTemplate.new)
      expect(itinerary.itinerary_templates.count).to eql(1);
    end
  end

  context 'scopes' do
    before do
      @upcoming_itinerary     = PlanB::Itinerary.create title: 'Upcoming', start: Date.tomorrow
      @past_itinerary         = PlanB::Itinerary.create title: 'Past',     start: Date.yesterday
      @without_date_itinerary = PlanB::Itinerary.create title: 'Without date'
      @published_itinerary    = PlanB::Itinerary.create title: 'Published', published: true
    end

    it 'should only return upcoming itineraries' do
      PlanB::Itinerary.upcoming.should == [@upcoming_itinerary]
    end

    it 'should only return past itineraries' do
      PlanB::Itinerary.past.should == [@past_itinerary]
    end

    it 'should only return published itineraries' do
      PlanB::Itinerary.published.should == [@published_itinerary]
    end
  end
end