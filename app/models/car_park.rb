class CarPark < ActiveRecord::Base
  belongs_to :company

  # By default, use the GEOS implementation for spatial columns.
  self.rgeo_factory_generator = RGeo::Geos.factory_generator

  # But use a geographic implementation for the :lonlat column.
  set_rgeo_factory_for_column(:lonlat, RGeo::Geographic.spherical_factory(:srid => 4326))

  validates_presence_of :street, :zip, :city

  before_save :generate_geocode

  def generate_geocode
    g = GeoLatLng.new("#{self.street}, #{self.zip} #{self.city}")
    coords = g.get_coordinates_from_address
    self.lonlat = "POINT(#{coords})"
  end
end
