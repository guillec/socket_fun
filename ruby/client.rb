require 'socket'  


message = "<message from='northumberland@shakespeare.lit/westminster' id='richard2-4.1.247' to='kingrichard@royalty.england.lit/throne'><body>My lord, dispatch; read o'er these articles.</body></message>"

Socket.tcp("localhost", 2000) {|sock|
  sock.send message, 0
  sock.close_write
  puts sock.read
}
