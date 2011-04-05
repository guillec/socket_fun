require 'socket'

Socket.tcp_server_loop(2000) {|sock, client_addrinfo|
  Thread.new {
    begin
      request = sock.readline
      p request.to_s
    ensure
      sock.close
    end
  }
}

