require "./app.rb"

def main
	app = App.new
	
	loop do
		display_menu
		choose_option(app)
	end
end

def display_menu
	puts "Welcome to School Library App"
	puts "Select an option by entering a number:"
	puts "1. list all books"
	puts "2. list all people"
	puts "3. create a person"
	puts "4. create a book"
	puts "5. create a rental"
	puts "6. List rentals by person id"
	puts "7. Exit"
end

def choose_option(app)
	options = {
		'1' => -> {app.list_books},
		'2' => -> {app.list_people},
		'3' => -> {create_person(app)},
		'4' => -> {create_book(app)},
		'5' => -> {create_rental(app)},
		'6' => -> {list_rentals_by_person_id(app)},
		'7' => -> {exit_app}
	}
	user_choice = gets.chomp
	if options[user_choice]
		options[user_choice].call
	else
		puts "Invalid option, please try again"
	end
end

def exit_app
	puts "Thanks for using the school library app"
	exit
end


