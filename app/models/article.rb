# coding: utf-8
class Article < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :category
  has_many :media
  has_many :images
  has_many :videos

  validates :title, :category_id, presence: true
  accepts_nested_attributes_for :media, allow_destroy: true, reject_if: proc { |form| self.attr_blank(form) }
  validates_format_of :source_url, with: /\Ahttps?:\/\/.+\z/, allow_blank: true
  validate :validate_number_of_media

  private

  def validate_number_of_media
    return if Rails.env.test? || !(media.size == 0)
    pp 'validate_number_of_media'
    errors.add(:media, "は最低1つは指定してください")
  end

  def thumbnail_medium
    media.first
  end

  def self.attr_blank form
    form[:type].blank? && form[:file].blank? && form[:url].blank?
  end
end
