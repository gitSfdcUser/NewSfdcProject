import { LightningElement } from 'lwc';

export default class DynamicWebSocketConnector extends LightningElement {

    is_initialized = false;
    socket_keepalive = null;
    socket = null;

    connectedCallback() {
        if (this.is_initialized) {
            // connectedCallback() might be called multiple times, prevent opening multiple WebSocket connections
            return;
        }
        this.is_initialized = true;

        // Replace 'resource_url' with the actual WebSocket URL
        const resource_url = 'wss://echo-websocket.hoppscotch.io';
        this.socket = new WebSocket(resource_url);

        this.socket.onclose = () => {
            console.log('WebSocket connection closed.');
            if (this.socket_keepalive) {
                clearInterval(this.socket_keepalive);
            }
            this.reconnectWebsocket();
        };

        this.socket.onopen = () => {
            console.log('WebSocket connection established.');
            if (this.socket_keepalive) {
                clearInterval(this.socket_keepalive);
            }
            this.socket_keepalive = setInterval(() => {
                this.sendWsMessage({ event: 'ping' });
            }, 30000);
        };

        this.socket.onmessage = (event) => {
            console.log('Received message:', event.data);
            // Handle incoming WebSocket messages here
        };
    }

    reconnectWebsocket() {
        if (!this.is_initialized) {
            return; // No longer needed, component removed from DOM
        }

        this.socket = new WebSocket(this.socket.url);

        this.socket.onclose = this.onclose;
        this.socket.onopen = this.onopen;
        this.socket.onmessage = this.onmessage;
    }

    sendWsMessage(data) {
        if (this.socket.readyState !== 1) {
            this.reconnectWebsocket();
            return;
        }
        this.socket.send(JSON.stringify(data));
    }
}