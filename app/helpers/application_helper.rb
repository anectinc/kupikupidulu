module ApplicationHelper
  def show_text text
    return '' if text.blank?
    sanitize text.gsub(/</, '&lt;').gsub(/\r\n|\n|\r/, '<br>'), tags: %w(br)
  end

  def asset_url asset
    "#{request.protocol}#{request.host_with_port}#{asset_path asset}"
  end
end
