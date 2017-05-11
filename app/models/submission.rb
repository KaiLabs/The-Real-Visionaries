class Submission < ApplicationRecord
	attr_accessor :rating, :season, :year, :state, :compensation, :country, :positionTitle, :hours, :organizationName, :mailingAddress, :city, :zipcode, :organizationMission, :organizationRecommendation
  attr_writer :current_step

	validates :rating, presence: true
	validates :season, presence: true
	validates :year, presence: true
	validates :compensation, presence: true
	validates :country, presence: true
	validates :positionTitle, presence: true
	validates :hours, presence: true
	validates :organizationName, presence: true
	validates :mailingAddress, presence: true
	validates :city, presence: true
	validates :zipcode, presence: true
	validates :organizationMission, presence:true
	validates :organizationRecommendation, presence: true

	def self.search(search, compensationSearch, locationSearch)
		# if search
		positions = Submission.where("positionTitle LIKE ? AND city LIKE ? AND compensation LIKE ?", "%#{search}%", "%#{locationSearch}%", "%#{compensationSearch}")

		return positions

	end

	def current_step
		@current_step || steps.first
	end

	def last_step?
	  current_step != steps[1] && current_step != steps[2]
	end

	def last_step1?
		current_step == steps.last
	end

	def steps
		%w[firstpage secondpage thirdpage]
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
