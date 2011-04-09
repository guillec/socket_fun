require 'socket'

Socket.tcp("localhost", 2000) {|sock|
  sock.send "GET /index.html HTTP/1.1", 0
  sock.close_write
  puts sock.read
}
