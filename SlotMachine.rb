#!/usr/bin/ruby
@balans = 100

@result1 = 'Вишенка '
@result2 = 'Яблоко '
@result3 = 'Ананас '
@sharp = '#'*80

def count
	@count_vishenka = 0
	@count_apple = 0
	@count_ananas = 0
end

def diff?
	if @balans >= 1200
		many_many = @balans
		@balans = 0
		puts "\nМы отобрали все ваши деньги, так как вы подозреваетесь в мухлеже!\nВаш баланс был #{many_many}$"
		exit
	end
end

def games
	3.times do
		random_number = rand(1..3)
		if random_number == 1
			result = @result1
			@balans-=10 
			@count_vishenka += 1
		elsif random_number == 2
			result = @result2
			@balans-=10
			@count_apple+=1
		elsif random_number == 3
			result = @result3
			@balans-=10
			@count_ananas += 1
		end
		print "#{result}"
		sleep rand(0.5..1)
	end
end

def jackpot?
	jack = "\nВы сорвали Jackpot"
	if @count_vishenka == 3
		@balans += 500
		puts jack
	end
	if @count_apple == 3
		@balans += 500
		puts jack
	end
	if @count_ananas == 3
		@balans += 500
		puts jack
	end
end

def whileGame
	helpInform
	loop do
		if @balans > 0
			count

			puts "\nНажмите ENTER? что бы сыграть, ваш баланс #{@balans}$"
			resp = gets.chomp
			if resp == 'help'
				helpInform
			end
			games
			jackpot?
			puts "\nВаш баланс #{@balans}$"
			puts @sharp
			diff?
		elsif @balans <= 0
			puts "\nВы проиграли все деньги"
			puts @sharp
			exit
		end
	end
end

def helpInform
	print """

#{@sharp}
У тебя на старте есть 100$
Попробуй выиграть Джекпот, но смотри не мухлю!
За срыв Джекпота тебе будет начислсяться 500$, за каждый проигранный раунд будет отниматься 30$
Игра идет до тех пор, пока ты не останешься должен заведению или пока мы не поймаем тебя
#{@sharp}

	"""
end

puts "Нажмите ENTER, что бы начать игру..."
puts "Вам есть 18 лет? (y/n), можете вызвать подсказку(help)"
response = gets
if response >= 'y'
	whileGame
else
	puts "Ваш возраст не соответствует минимальным требованиям"
	exit
end


