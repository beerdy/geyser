class MainController < ApplicationController
  def index
    @pages.each { |page| @page_index = page if page.link == 'index'  }

    @why_we = []
    Content.all.each do |content|
      @why_we.push content if content.url == 'why_we'
    end
  end
  def contacts
  end
end
