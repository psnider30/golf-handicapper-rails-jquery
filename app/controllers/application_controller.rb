class ApplicationController < ActionController::Base
  ApplicationHelper
  
  protect_from_forgery with: :exception
end
