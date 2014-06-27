# coding: utf-8
class Video < Medium
  def self.model_name
    Medium.model_name
  end

  # validates_format_of :url, with: /\Ahttps?:\/\/.+\z/
end
