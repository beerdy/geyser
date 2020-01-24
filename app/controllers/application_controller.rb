class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :init
  
  def init
    @pages = Page.all

    Content.all.each do |content|
      @catalog_xls_url = content.asset.url if content.url == 'catalog_xls_url'
    end

  end
end
