# coding: utf-8
module ImageDecorator
  def tag
    image_tag(file.try(:url) || 'no_image.jpg')
  end
end
