class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	include DeviseWhitelist
	include CurrentUser
	include SetSource
	include SetPageTitle
end
