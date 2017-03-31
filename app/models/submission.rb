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

	def self.search(search)
		if search
			where("positionTitle LIKE ?", "%#{search}%")
			#where()
		else
			all
		end
	end

end
