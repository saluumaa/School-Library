require "./book.rb"
class App
	def initialize
		@books = []
	end

	## LIST BOOKS
	def listBooks
		@books.each do |book|
			puts "Title: #{book.title}", "Author: #{book.author}"
		end
	end