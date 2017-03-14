class Submission < ApplicationRecord
	validates :positionTitle, presence: true
	validates :hours, presence: true
	validates :organizationName, presence: true
	validates :mailingAddress, presence: true
	validates :city, presence: true
	validates :zipcode, presence: true

end
