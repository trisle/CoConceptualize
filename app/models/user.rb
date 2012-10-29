class User < ActiveRecord::Base
	has_many :project_users
	has_many :projects, :through => :project_users
	attr_accessible :email, :firstname, :id, :lastname, :password, :username, :password, :password_confirmation
	has_secure_password
end