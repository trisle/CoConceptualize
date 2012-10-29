class Project < ActiveRecord::Base
	has_many :project_users
	has_many :users, :through => :project_users
	attr_accessible :date_created, :id, :name, :assignuser

	def assignuser
	end

	def assignuser=(arg)
	end
end
