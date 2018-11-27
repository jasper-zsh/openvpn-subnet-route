# openvpn-subnet-route

This set of scripts add routes to subnet for multiple users via their remote ip automatically.

## Usage

Modify or add the following lines to your openvpn config

```
# Make sure the script-security option is larger or equal than 2 (actually 2 or 3)
script-security 2

# Point the script path in the two lines below to the real path, absolute path or relative path are both ok.
client-connect client-connect.sh
client-disconnect client-disconnect.sh
```

Then add your username and subnet mappings to subnets.txt.
The format is `your-username your-cidr-subnet`

That's all, just enjoy it. The route to the subnet will be added when a client connected and removed when the client disconnected automatically.'
