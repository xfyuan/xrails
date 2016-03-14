class User < ActiveRecord::Base
  validates_presence_of :email, :authentication_token
  validates_uniqueness_of :email

  validates_length_of :email, in: 6..50
  validates_length_of :password, in: 4..30
  validates_length_of :firstname, in: 2..30
  validates_length_of :lastname, in: 2..30

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_secure_password
end
