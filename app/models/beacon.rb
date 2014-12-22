class Beacon < ActiveRecord::Base
  validates_presence_of :uuid, :lat, :lng
  validates :uuid, uniqueness: { scope: [ :lat, :lng ] }

  reverse_geocoded_by :lat, :lng
  after_validation :reverse_geocode

end
