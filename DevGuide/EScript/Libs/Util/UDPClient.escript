// This script is basically a client, therefore it is OK to let the system use some random port
var socket = Util.Network.createUDPNetworkSocket(); // no port or 0 means that a random port is chosen
socket.open();
socket.addTarget("127.0.0.1", 8080);
socket.sendString("Ping");
// wait for response

var count = 0;
while(true) {
	outln("Waiting for response");
	Util.sleep(1000); // wait one second
	var msg = socket.receive();
	if(msg) {
		outln("Received: ", msg.data);
		outln("From: ", msg.host, ":", msg.port);
		return;
	} else if(count++ == 10) {
		outln("Timeout!");
		return;
	}
}
