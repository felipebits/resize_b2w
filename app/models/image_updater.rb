class ImageUpdater
  def initialize
    @image_getter = ImageGetter.new
  end

  def update_all
    Image.destroy_all
    create_all_images @image_getter.all
  end

  private

  def create_all_images image_hash
    return nil unless image_hash['images'].present?

    extract_urls(image_hash).map do |image_url|
      Image.from_url image_url
    end.all?
  end

  def extract_urls image_hash
    image_hash['images'].map { |i| i['url'] }
  end
end
