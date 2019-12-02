class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @message = Message.new

    @link = get_link

    @carts = Cart.where(session: request.session.id)

    @cart_html = '
      <table class="cart-table">
      <thead>
        <tr>
          <th><h3>Товар</h3></th>
          <th><h3>Количество</h3></th>
          <th><h3>-</h3></th>
        </tr>
      </thead>
      <tbody>'

    @carts.each do |cart|
      @cart_html += "
        <tr>
          <td><h4> #{cart.product} </h4></td>
          <td><h4> #{cart.quantify} </h4></td>
          <td><a data-confirm='Are you sure?' rel='nofollow' data-method='delete' href='/carts/#{cart.id}'>УДАЛИТЬ</a></td>
        </tr>"  
    end

    @cart_html += '</tbody></table>'
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
  end

  # GET /carts/new
  def new
    @cart = Cart.new
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Добавление в корзину прошло успешно' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Товар удален из корзины' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:session, :product, :quantify, :active)
    end

    def get_link
      if Rails.env.development?
        @link = "http://localhost:3000/orders/#{request.session.id}"
      else
        @link = "http://geyzer.su/orders/#{request.session.id}"
      end
    end
end
