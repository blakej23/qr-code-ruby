require "rqrcode"

puts "What kind of QR code would you like to generate?

1. Open a URL
2. Join a wifi network
3. Sent a text message

Press 4 to exit"

selection = gets.chomp 

if selection == "1"
  puts "What is the URL you would like to encode?"
    qr_code_input = gets.chomp
elsif selection == "2"
  puts "What is the name of the Wifi network?"
    network_name = gets.chomp
  puts "What is the password?"
    password = gets.chomp
elsif selection == "3"
  puts "What is the phone number you want the code to send a text message to?"
    phone_number = gets.chomp
  puts "What's your message?"
    message_content = gets.chomp
  qr_code_input = "SMSTO:#{phone_number}:#{message_content}"
elsif selection == "4"
    puts "Goodbye!"
else
    puts "I did not recognize that selection."
end

puts "What would you like to call the PNG?"
url_png_name = gets.chomp

# # Use the RQRCode::QRCode class to encode some text
qrcode = RQRCode::QRCode.new(qr_code_input)

# # Use the .as_png method to create a 500 pixels by 500 pixels image
png = qrcode.as_png({ :size => 500 })

# # Write the image data to a file
IO.binwrite(url_png_name, png.to_s)
