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
end