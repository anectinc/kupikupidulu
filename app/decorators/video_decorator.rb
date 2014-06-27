# coding: utf-8
module VideoDecorator
  def tag
    content_tag :div, class: ['embed-responsive', 'embed-responsive-16by9'] do
      content_tag :iframe, nil, src: "http://www.youtube.com/embed/#{video_code}", class: 'embed-responsive-item'
    end
  end
end
