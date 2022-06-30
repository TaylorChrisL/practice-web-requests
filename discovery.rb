require "http"

while true
  system "clear"

  response = HTTP.get("https://v2.jokeapi.dev/joke/Any?type=single").parse(:json)

  puts response["joke"]

  puts
  puts "Would you like another joke? (no to quit)"
  input = gets.chomp.downcase
  if input == "no"
    break
  end
end

# require "http"

# while true
#   system "clear"

#   response = HTTP.get("https://randomuser.me/api/").parse(:json)

#   puts response["results"][0]["name"]["first"]

#   puts
#   puts "Would you like another first name? (no to quit)"
#   input = gets.chomp.downcase
#   if input == "no"
#     break
#   end
# end