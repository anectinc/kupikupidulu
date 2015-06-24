# coding: utf-8
class Article < ActiveRecord::Base
  acts_as_paranoid

  paginates_per 10

  belongs_to :category
  has_many :media
  has_many :images
  has_many :videos

  default_scope { order(:id).reverse_order }

  validates :title, :category_id, presence: true
  accepts_nested_attributes_for :media, allow_destroy: true, reject_if: proc { |form| self.attr_blank(form) }
  validates_format_of :source_url, with: /\Ahttps?:\/\/.+\z/, allow_blank: true
  validate :validate_number_of_media

  before_destroy :destroy_redis_record

  def self.public
    where displayable: true
  end

  def self.redis
    Redis::Namespace.new('ArticlesCount', redis: Redis.current)
  end

  def self.by_popularity
    ranking = self.public.where(id: redis.zrevrange(Date.today.prev_day.to_s, 0, 9)).includes(:media)
    ranking + (ranking.length < 10 ? self.public.limit(10 - ranking.length).includes(:media) : [])
  end

  def redis
    self.class.redis
  end

  def source?
    source_name.present? && source_url.present?
  end

  def description
    before_description.presence || after_description
  end

  def increment_tweeted_count
    increment! :tweeted_count
    increment_score
  end

  def increment_shared_count
    increment! :shared_count
    increment_score
  end

  def destroy_redis_record
    redis.zrem(Date.today.prev_day.to_s, self.id)
    redis.zrem(Date.today.to_s, self.id)
    true
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

  def increment_score
    increment! :score
  end
end
