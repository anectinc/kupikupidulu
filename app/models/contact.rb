# coding: utf-8
class Contact
  include ActiveAttr::Model

  attribute :name
  attribute :email
  attribute :medium1
  attribute :medium2
  attribute :content

  validates_presence_of :name, :email, :content
  validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  validates_length_of :content, maximum: 500
end
