class Project < ActiveRecord::Base
	belongs_to :users
	attr_accessible :date_created, :id, :name
end
