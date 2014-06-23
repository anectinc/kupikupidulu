# coding: utf-8
module ArticleDecorator
  def thumbnail_tag height = 315, width = 560
    if thumbnail_medium.image?
      image_tag(thumbnail_medium.file.url || 'no_image.jpg')
    elsif thumbnail_medium.video?
      content_tag :iframe, nil, height: height, width: width, src: thumbnail_medium.url, frameborder: 0
    end
  end
end
