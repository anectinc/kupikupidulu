# coding: utf-8
module VideoDecorator
  def tag height = 315, width = 560
    content_tag :iframe, nil, height: height, width: width, src: url, frameborder: 0
  end
end
