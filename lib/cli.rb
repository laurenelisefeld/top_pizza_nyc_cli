class TopPizzaNYC::CLI

  def call
    TopPizzaNYC::Scraper.scrape_pizza
    puts "Welcome to the 25 Best Pizza Places in NYC. I hope you brought your appetite!"
    start
  end

  def start
    puts "Which pizza joint would you prefer to see first? Enter a number 1-25."
    input = gets.strip.to_i

    restaurant = TopPizzaNYC::Pizza.all[input.to_i - 1]

    display_restaurant(restaurant)

    puts "Would you like to see another pizza joint? Enter Y or N"
    input = gets.strip.downcase

    if input == "y"
      start
    else
      puts "Not hungry enough? See you next time!"
      exit
    end
  end

  def display_restaurant(restaurant)
    puts "---------#{restaurant.name}-----------"
    puts
    puts "Neighborhood:    #{restaurant.neighborhood}"
    puts "Address:          #{restaurant.address}"
    puts "Website:          #{!restaurant.url.empty? ? restaurant.url : 'None Listed.'}"
    puts

    puts "---------Want More Info? Enter Y or N. Enter EXIT to quit-------------"
    input = gets.strip.downcase

    if input == "y"
      puts "Decription: #{restaurant.description}"
    elsif input == "n"
      start
    else
      puts "See you later!"
      exit
    end
  end
end
