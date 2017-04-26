class Submission < ApplicationRecord
	attr_accessor :rating, :season, :year, :compensation, :country, :positionTitle, :hours, :organizationName, :mailingAddress, :city, :zipcode, :organizationMission, :organizationRecommendation
  attr_writer :current_step

	# validates :rating, presence: true
	# validates :season, presence: true
	# validates :year, presence: true
	# validates :compensation, presence: true
	# validates :country, presence: true
	# validates :positionTitle, presence: true
	# validates :hours, presence: true
	# validates :organizationName, presence: true
	# validates :mailingAddress, presence: true
	# validates :city, presence: true
	# validates :zipcode, presence: true
	# validates :organizationMission, presence:true
	# validates :organizationRecommendation, presence: true

	def self.search(search)
		if search
			where("positionTitle LIKE ?", "%#{search}%")
			where("compensation LIKE ?", "%#{search}%")
			where("city LIKE ?", "%#{search}%")
			where("agriculture LIKE ?", "%#{search}%")

		else
			all
		end
	end

	def current_step
		@current_step || steps.first
	end

	def steps
		%w[new1 new2 new3]
	end

	def next_step
		self.current_step = steps[steps.index(current_step)+1]
	end

	def previous_step
		self.current_step = steps[steps.index(current_step)-1]
	end

	def first_step?
		current_step == steps.first
	end
end
