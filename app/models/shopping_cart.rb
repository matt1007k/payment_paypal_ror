# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  status     :integer          default("default")
#  ip         :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShoppingCart < ApplicationRecord

  has_many :in_shopping_carts
  has_many :products, through: :in_shopping_carts
  enum status: {payed: 1, default: 0}

  def total
    products.sum(:pricing)
  end
  #ShoppingCart.payed  obtener todos los carrito pagados
  #ShoppingCart.default  obtener todos los carrito no pagados
  #ShoppingCart.find(1).payed! marcar el carrito con id 1 como pagado
  #ShoppingCart.find(1).default! marcar el carrito con id 1 como no pagado
end
