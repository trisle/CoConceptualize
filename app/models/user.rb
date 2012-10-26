class User < ActiveRecord::Base
  attr_accessible :email, :firstname, :id, :lastname, :password, :username
  has_secure_password
end