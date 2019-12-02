class OrdersController < ApplicationController
  def show
    @message = Message.find_by( session: message_params[:session] )
  end

  private
    def message_params
      params.require(:order).permit( :link, :phone, :description, :session )
    end
end
