class User < ActiveRecord::Base
  authenticates_with_sorcery!

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates_uniqueness_of :email
  validates :password, presence: true
  validates_confirmation_of :password, message: "should match confirmation", if: :password
end
