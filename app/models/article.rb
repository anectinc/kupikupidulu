# coding: utf-8
class Article < ActiveRecord::Base
  acts_as_paranoid

  belongs_to :category
  has_many :media
  has_many :images
  has_many :videos

  default_scope { order(:id).reverse_order }

  validates :title, :category_id, presence: true
  accepts_nested_attributes_for :media, allow_destroy: true, reject_if: proc { |form| self.attr_blank(form) }
  validates_format_of :source_url, with: /\Ahttps?:\/\/.+\z/, allow_blank: true
  validate :validate_number_of_media

  def self.public
    where displayable: true
  end

  def self.by_popularity
    order(:id).reverse_order
  end

  def source?
    source_name.present? && source_url.present?
  end

  private

  def validate_number_of_media
    return if Rails.env.test? || !(media.size == 0)
    errors.add(:media, 'は最低1つは指定してください')
  end

  def thumbnail_medium
    media.first
  end

  def self.attr_blank form
    form[:type].blank? && form[:file].blank? && form[:video_code].blank?
  end
end
