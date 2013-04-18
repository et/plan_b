require 'friendly_id'

module PlanB
  class Itinerary < ActiveRecord::Base
    extend FriendlyId
    attr_accessible :title, :start, :end, :preplanning, :summary, :published

    has_many :itinerary_templates, dependent: :destroy
    has_many :hiking_templates, through: :itinerary_templates, source: :template, source_type: 'PlanB::HikingTemplate'

    friendly_id :title, use: :slugged

    validates :title, presence: true, uniqueness: true

    scope :upcoming,  where('start > ?', Time.now)
    scope :past,      where('start < ?', Time.now)
    scope :published, where(published: true)
  end
end
