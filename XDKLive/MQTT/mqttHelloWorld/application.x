/**
 * Welcome to XDK LIVE.
 *
 * Not sure what to do now?
 * Check out the "Getting started" guide in the Eclipse help.
 */

package main;
import platforms.xdk110;

// Create a wireless connection named 'wireless'
setup wireless : WLAN {
	ssid = "ssidnetwork";
	psk = "password";
	useDHCP = true;
}

// Create a MQTT instance
setup messaging : MQTT {
	transport = wireless;
	url = "mqtt://broker.hivemq.com:1883"; // Try differents brokers iot.eclipse.org, etc. 
	cleanSession = true;
	clientId = "1234";  //Define your userID
	var Test = topic("XDK/RBTest",1);	//Define your own topic
}

// When button one is pressed, send text via MQTT
every button_one.pressed {
	messaging.Test.write("Test Write"); //Define your message
}

