# coding: utf-8
class Article < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :category
  has_many :media
  has_many :images
  has_many :videos

  validates :title, :category_id, presence: true
  accepts_nested_attributes_for :images, reject_if: :all_blank
  accepts_nested_attributes_for :videos, reject_if: :all_blank
  validates_format_of :source_url, with: /\Ahttps?:\/\/.+\z/
  validate :validate_number_of_media

  private

  def validate_number_of_media
    return if Rails.env.test? || !(images.size == 0 && videos.size == 0)
    errors.add(:media, "は最低1つは指定してください")
  end

  def thumbnail_medium
    media.first
  end
end
