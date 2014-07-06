# coding: utf-8
module ArticleDecorator
  def thumbnail_tag height = 315, width = 560
    if thumbnail_medium.image?
      link_to self do
        content_tag :div, class: 'thumb_image', style: "background-image: url(#{thumbnail_medium.file.url || asset_path('no_image.jpg')})" do
        end
      end
    elsif thumbnail_medium.video?
      content_tag :div, class: ['embed-responsive', 'embed-responsive-16by9'] do
        content_tag :iframe, nil, src: "http://www.youtube.com/embed/#{thumbnail_medium.video_code}", class: 'embed-responsive-item'
      end
    end
  end

  def thumbnail_image_tag
    image_tag(thumbnail_image_path, widht: 64, height: 64, class: 'media-object')
  end

  def thumbnail_image_path
    if thumbnail_medium.image?
      thumbnail_medium.file.url || 'no_image.jpg'
    elsif thumbnail_medium.video?
      "http://img.youtube.com/vi/#{thumbnail_medium.video_code}/1.jpg"
    end
  end

  def thumbnail_thumb_image_path
    if thumbnail_medium.image?
      thumbnail_medium.file.thumb.url || 'no_image.jpg'
    elsif thumbnail_medium.video?
      "http://img.youtube.com/vi/#{thumbnail_medium.video_code}/1.jpg"
    end
  end

  def source
    link_to source_name, source_url
  end

  def displayable_status
    content_tag :span, class: displayable_label do
      displayable ? 'Released' : 'Unreleased'
    end
  end

  def displayable_label
    ['label'] << (displayable ? 'label-success' : 'label-default')
  end
end
