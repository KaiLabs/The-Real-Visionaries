class User < ApplicationRecord

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
			user.provider = auth.provider
			user.uid = auth.uid
			user.name = auth.info.name
			user.oauth_token = auth.credentials.token
			user.oauth_expires_at = Time.at(auth.credentials.expires_at)
			user.save!

			#add user admin check
			if user.name == "Shirley He"
				user.admin =  true
			else
				user.admin = false
			end
		end
		
		
	end
end
