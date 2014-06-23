# coding: utf-8
class Image < Medium
  def self.model_name
    Medium.model_name
  end

  mount_uploader :file, FileUploader
end
