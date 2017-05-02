class SessionsController < ApplicationController
	def create
		user = User.from_omniauth(env["omniauth.auth"])
		session[:user_id] = user.id
		redirect_to controller: "home", action:"index"
	end

	def destroy
		session[:user_id] = nil
		redirect_to controller: "login", action:"index"
	end
end
