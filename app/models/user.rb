class User < ActiveRecord::Base
  validates_presence_of :email
  validates_length_of :email, in: 6..50
  validates_length_of :password, in: 4..30
  validates_length_of :firstname, in: 2..30
  validates_length_of :lastname, in: 2..30

  has_secure_password
end
