class GeoLatLng
  def initialize(addr)
    # Instance variables
    @base_google_url = "http://maps.googleapis.com/maps/api/geocode/xml?sensor=false&address="
    @addr = addr
  end

  def get_coordinates_from_address
    res = RestClient.get(URI.encode("#{@base_google_url}#{@addr}"))
    parsed_res = Crack::XML.parse(res)
    lat = parsed_res["GeocodeResponse"]["result"]["geometry"]["location"]["lat"]
    lng = parsed_res["GeocodeResponse"]["result"]["geometry"]["location"]["lng"]
    return "#{lng} #{lat}"
  end
end
