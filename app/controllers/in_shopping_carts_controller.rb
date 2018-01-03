class InShoppingCartsController < ApplicationController
  def create
    in_shopping_cart = InShoppingCart.new(product_id: params[:product_id],
                        shopping_cart: @shopping_cart)
    if in_shopping_cart.save
      redirect_to carrito_path, notice: "Guardamos el producto en tu carrito de compra"
    else
      redirect_to products_path(id: params[:product_id]), notice: "No pudimos agregar el producto, intenta denuevo"
    end
  end
  
  def destroy

  end
end
