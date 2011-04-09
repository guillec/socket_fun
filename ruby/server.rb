require 'socket'

Socket.tcp_server_loop("127.0.0.1", 2000){ |socket, client_addrinfo|
  request = socket.readline
  http_header = request.match(/GET .* HTTP\/1\.1/)
  
  unless (http_header)
    socket.puts "HTTP/1.1 400 BAD REQUEST"
    socket.close
    next #restart loop
  end
  
  file = request.split(' ')[1]
  file = '.' + file
  p file

  unless ( File.exists?(file) )
      socket.puts "HTTP/1.1 404 File Not Found"
      socket.close
      next
  end

  socket.puts "HTTP/1.1 200 OK\n"
  socket.puts "Connection: close\n"
  socket.puts "Content-Type: text/html\n"
  File.open(file, 'r') { |f|
      while (line = f.gets)
          socket.puts line
      end
  }

  socket.close
}

