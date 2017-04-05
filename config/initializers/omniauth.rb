OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do 
	provider :google_oauth2, '923383627703-pfm075thfdgsuqerul1ga2kmimjr7egj.apps.googleusercontent.com', 'vL9mCO8H_mX6xtMb5E2ibhCw', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}},
	hd: 'wesleyan.edu',
	skip_jwt: true	
} 
end