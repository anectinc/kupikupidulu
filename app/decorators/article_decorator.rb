# coding: utf-8
module ArticleDecorator
  def thumbnail_tag height = 315, width = 560
    if thumbnail_medium.image?
      image_tag(thumbnail_medium.file.url || 'no_image.jpg')
    elsif thumbnail_medium.video?
      content_tag :div, class: ['embed-responsive', 'embed-responsive-16by9'] do
        content_tag :iframe, nil, src: "http://www.youtube.com/embed/#{thumbnail_medium.video_code}", class: 'embed-responsive-item'
      end
    end
  end

  def thumbnail_image_tag
    if thumbnail_medium.image?
      image_tag(thumbnail_medium.file.url || 'no_image.jpg', widht: 64, height: 64, class: 'media-object')
    elsif thumbnail_medium.video?
      image_tag("http://img.youtube.com/vi/#{thumbnail_medium.video_code}/1.jpg", widht: 64, height: 64, class: 'media-object')
    end
  end

  def source
    link_to source_name, source_url
  end
end
