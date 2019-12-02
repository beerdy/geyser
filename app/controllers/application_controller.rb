class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :init
  
  def init
    @pages = Page.all
  end
end
