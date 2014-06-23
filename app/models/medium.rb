class Medium < ActiveRecord::Base
  belongs_to :article

  def image?
    type == 'Image'
  end

  def video?
    type == 'Video'
  end
end
