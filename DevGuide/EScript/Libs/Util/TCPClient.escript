static TCPConnection = Util.Network.TCPConnection;

var client = TCPConnection.connect("127.0.0.1", 8080);
if(!client) {
	outln("Failed to connect!");
	return;
}

client.sendString("Ping");
var data;
while(!data) {
	data = client.receiveString();
}
outln("Received: ", data);

client.close();
