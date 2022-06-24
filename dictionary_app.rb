require "http"
require "launchy"

system "clear"

while true
  puts "Enter a word: (Enter 'q' to quit)"
  word = gets.chomp.downcase
  
  if word == 'q'
    break
  end

  response = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=3&includeRelated=false&useCanonical=false&includeTags=false&api_key=YOUR_API_KEY")

  response_example = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/examples?includeDuplicates=false&useCanonical=false&limit=5&api_key=YOUR_API_KEY")

  response_pronunce = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=YOUR_API_KEY")

  response_audio = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/audio?useCanonical=false&limit=50&api_key=YOUR_API_KEY")

  puts "#{word} - #{response.parse(:json)[0]["text"]}"
  puts "#{word} - #{response_example.parse(:json)["examples"][0]["text"]}"
  puts "#{word} - #{response_pronunce.parse(:json)[0]["raw"]}"
  Launchy.open(response_audio.parse(:json)[0]["fileUrl"])
end

