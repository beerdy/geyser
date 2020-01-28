class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :init
  
  def init
    @pages = Page.all

    Content.all.each do |content|
      
      @catalog_xls_url = content.asset.url if content.url == 'catalog_xls_url'
      @logo_image_url  = content.asset.url if content.url == 'logo_image_url'

      @whatsapp_link_1 = content.link if content.url == 'whatsapp_link_1'
      @telegram_link_1 = content.link if content.url == 'telegram_link_1'
      @whatsapp_link_2 = content.link if content.url == 'whatsapp_link_2'
      @telegram_link_2 = content.link if content.url == 'telegram_link_2'

    end

  end
end
