# Escreva um programa em Ruby, que simule uma corrida de cavalos

# Quais são as regras?
# • Uma corrida de cavalos é definida por uma lista de animais competidores;
# • Cada jogador pode escolher em qual cavalo apostar;
# • Ao final da corrida, resta apenas um vencedor (cavalo);
# • Devemos verificar se o jogador ganhou ou não a aposta;

# Definindo o passo a passo:

# 1. Imprimir uma mensagem de boas vindas ao jogador
amount = 100
puts "Welcome to horse race"

# 1.1 Definimos uma lista (estábulo) com os animais competidores
stable = ["Mustang","Pé de pano","Lucky","Sete","Pangaré","Victor","Azarao"]

# 2. Mostrar ao jogador, em quais cavalos ele pode apostar
stable.each_with_index do |horse, index|
  puts "#{index + 1} - #{horse}"
end

# 3. Guardamos qual foi o competidor escolhido pelo apostador e cobramos $20 pela aposta (amount -= 20)
puts "Choose a horse number to bet"
choice = gets.chomp.to_i
amount = amount - 20

# 4. Iniciarmos a corrida de cavalos!
puts "Bang! Race started"

# 5. Ao final da corrida, precisamos descobrir qual o vencedor, para isso,
# sorteamos um cavalo (amostra/sample) do estábulo
winner = stable.sample
puts "#{winner} is the champion"

# 6. Conferir se a aposta do jogador foi a ganhadora/perdedora
winner_index = stable.index(winner)

if winner_index + 1 == choice
  puts "Its the winner"
  amount = amount + 50
else
  puts "You lost"
  amount = amount - 10
end
puts "£ #{amount}"