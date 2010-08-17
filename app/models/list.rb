class List < ActiveRecord::Base

	validates_presence_of :title

  belongs_to :user, :dependant => :destroy
	has_many :tasks
end
