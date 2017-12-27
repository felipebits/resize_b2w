class ImageGetter
  include HTTParty
  base_uri "http://54.152.221.29"

  def all
    request = self.class.get("/images.json")
    return {} if request.body.nil?
    JSON.parse request.body
  end
end
