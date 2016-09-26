static TCPServer = Util.Network.TCPServer;
static TCPConnection = Util.Network.TCPConnection;

var server = TCPServer.create(8080);
if(!server) {
	outln("Failed to start server");
	return;
}

var count = 0;
var client;
while(!client) {
	outln("Waiting for client");
	Util.sleep(1000); // wait one second
	client = server.getIncomingConnection();
	if(count++ == 10) {
		outln("Timeout!");
		server.close(); // never forget to close!
		return;
	}
}

// client is connected, now we just respond
var data;
while(!data) {
	data = client.receiveString();
}
outln("Received: ", data);
client.sendString("Pong");

Util.sleep(1000);
server.close();
client.close();
