class Resources < ApplicationRecord
  has_many :calender_event_resource_links
  
  belongs_to :resource, polymorphic: true
end
