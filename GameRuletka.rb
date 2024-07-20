#!/usr/bin/ruby
ruletka = rand(1..6)
puts "[ Заголовок ] Играем в Русскую Рулетку\n[ Задача ] Отгадать число от 1 до 6\n\n"
count = 0
loop do
	if count == 5
		puts "[x Внимание x] У тебя последния попытка!!!"
	end
	if count == 6
		puts "[x Внимание x]Ты проиграл!!!"
		exit
	end
	count+=1
	left = 6 - count
	response = gets.to_i
	if response == ruletka
		puts "[x Попытка #{count} x] Вы угадали число: #{ruletka}\nСчитай, что повезло"
		if count == 1
			puts "[x Восторг x] Ты Везунчик, получилось с первой попытки!!!\n"
		end
		exit
	end
	if response != ruletka
		puts "[x Попытка #{count} x] Вы не угадали, попробуйте еще раз\n[x Примечаение x] Осталось попыток: #{left}\n"
	end
end

		

