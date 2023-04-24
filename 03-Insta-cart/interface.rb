require_relative 'store'

# Escrever um programa que simule uma pequena loja de venda de items

# 1. Imprimir na tela a mensagem de boas vindas!
puts "--------------------"
puts "Welcome to Instacart"
puts "--------------------"
puts "In our store today:"
# store = {"kiwi": , quantity: 2, "apple": 0.8, quantity: 3}
# store = [{name: "kiwi", price: 1.25, quantity: 5}, {name: "banana", price: 0.8, quantity: 0}, {name: "apple", price: 1.2, quantity: 10}, {name: "pineapple", price: 5, quantity: 99}]
store = get_items
cart = generate_cart
user_item_name = ""

# 2. Mostrar na tela, quais são os itens disponiveis na loja
# kiwi: 1.25€
# banana: 0.5€
# mango: 4€
# asparagus: 9€
def display_menu(store)
  store.each do |hash|
    puts "#{hash[:name]}: #{hash[:price]}$ | Quantity: #{hash[:quantity]}"
  end
end
 
display_menu(store)

# 3. Perguntar ao usuário, qual o item que ele quer.
# 3.1 Se tivermos o item, vamos adicionar no carrinho
# 3.2 Se NÃO tivermos o item, mostraremos uma mensagem de item indisponivel


# 4. Pergunta ao user se ele quer comprar mais items
# 4.1 Caso sim, voltamos ao passo 3
# 4.2 Caso não, encerramos o programa e mostramos a "nota fiscal"
while user_item_name != "quit"
    puts "What item you want to buy? (Or type quit to exit)"
    user_item_name = gets.chomp
    
    # Se o usuário digitar quit, já saimos do while antes de rodar o .find!
    break if user_item_name == "quit"
    
    store_item = store.find { |fruit| fruit[:name] == user_item_name }

    unless store_item
        puts "Item not found, please try again!"
    end

    # 3.3 Perguntar qual a quantidade dos itens que ele quer adicionar
    puts "What's the quantity for #{store_item[:name]}"
    user_item_quantity = gets.chomp.to_i

    add_cart_item(cart, store_item, user_item_quantity)
end

# 5. Mostrar na tela, os items que o usuário comprou!
amount = cart.empty? ? 0 : sum_cart_items(cart)

puts "-------BILL---------"
puts "TOTAL: $ #{amount}"
puts "--------------------"

