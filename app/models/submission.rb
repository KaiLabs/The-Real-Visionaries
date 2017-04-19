class Submission < ApplicationRecord
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

end
