#!/usr/bin/ruby
@humens = 20
@machines = 20

def luck?
	rand(0..1) == 1
end

def boom
	diff = rand(1..5)
	if luck?
		@machines-=diff
		puts "#{diff} машин уничтожено"
	else
		@humens-=diff
		puts "#{diff} людей погибло"
	end
end

def random_city
	dice = rand(1..5)
	if dice == 1
		'Moscow'
	elsif dice == 2
		'Los Angeles'
	elsif dice == 3
		'Saint Petersburg'
	elsif dice == 4
		'London'
	elsif dice == 5
		'California'
	end
end

def random_sleep
	sleep rand(0.3..1.5)
end

def stats
	puts "Осталось #{@humens} людей и #{@machines} машин"
end

def event1
	puts "Запущена ракета по городу #{random_city}"
	random_sleep
	boom
end

def event2
	puts "Примерно радиактивное оружие в городе #{random_city}"
	random_sleep
	boom
end

def event3
	puts "Группа солдат прорывает оборону в городе #{random_city}"
	random_sleep
	boom
end

def check_victory
	if @humens <= 0
		puts "\n[x_x] Людей не осталось, человечество проиграло"
		exit
	elsif @machines <= 0
		puts "\n[x_x] Машин не осталось, человечество победило"
		exit
	end
end

loop do
	check_victory

	dice = rand(1..3)
	if dice == 1
		event1
	elsif dice == 2
		event2
	elsif dice == 3
		event3
	end

	stats
	random_sleep
end