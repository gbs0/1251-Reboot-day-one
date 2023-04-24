def get_items
  [{name: "kiwi", price: 1.25, quantity: 5}, {name: "banana", price: 0.8, quantity: 0}, {name: "apple", price: 1.2, quantity: 10}, {name: "pineapple", price: 5, quantity: 99}]
end

def generate_cart
  []
end

def sum_cart_items(cart)
  price_items = cart.map { |item| (item[:price] * item[:quantity]) }
  price_items.sum
end

def add_cart_item(cart, store_item, user_item_quantity)
  if store_item && user_item_quantity <= store_item[:quantity]
    store_item[:quantity] = user_item_quantity
    cart << store_item
    puts "Item succesfully added to cart!"
  else
    puts "Invalid quantity!"
  end
end