class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :password, :password_confirmation, presence: true, on: :create
  validates_length_of :password, minimum: 6, if: :password
  validates_confirmation_of :password, if: :password
end
