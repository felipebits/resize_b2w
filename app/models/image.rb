class Image
  include Mongoid::Document
  include Mongoid::Paperclip

  has_mongoid_attached_file :attachment,
    styles: { small: '320x240>', medium: "384x288>", large: "640x480>" },
    url: "/images/:basename_:style.:extension"
  validates_attachment_content_type :attachment, content_type: /\Aimage\/.*\z/

  %i(small medium large).each do |style|
    define_method "#{style}_url" do
      attachment.url(style, timestamp: false)
    end
  end

  def self.from_url(url)
    image = new
    image.attachment = URI.parse(url)
    image.save
  end
end
