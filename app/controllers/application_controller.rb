class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    protect_from_forgery prepend: true
    
    def after_sign_in_path_for(resource)
	    stored_location_for(resource) || projects_path
    end
end
