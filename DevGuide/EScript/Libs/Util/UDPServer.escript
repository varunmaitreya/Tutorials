var socket = Util.Network.createUDPNetworkSocket(8080);
socket.open();

// wait to receive a message

var count = 0;
while(true) {
	outln("Waiting for a message");
	Util.sleep(1000); // wait one second
	var msg = socket.receive();
	if(msg) {
		outln("Received: ", msg.data);
		outln("From: ", msg.host, ":", msg.port);
		// In this simple example we don't want to remember the sender
		// Therefore we just add it as a target, send the message and then we remove the target
		socket.addTarget(msg.host, msg.port).sendString("Pong");
		socket.removeTarget(msg.host, msg.port);
		return;
	} else if(count++ == 10) {
		outln("Timeout!");
		return;
	}
}
