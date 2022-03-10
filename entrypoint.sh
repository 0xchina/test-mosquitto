#!/bin/sh
mosquittoConf=$(cat <<-END
listener 1883
allow_anonymous true
plugin /usr/lib/mosquitto_dynamic_security.so
plugin_opt_config_file /mosquitto/auth/dynamic-security.json
END
)

auth=$(cat <<-END
{
	"clients":	[{
			"username":	"apsu",
			"textName":	"Dynsec admin user",
			"password":	"x7M7rzxVKR4VVG/SZRVhuSFTRTJYHXIfx0kpdBuZ1ATo74LqtY+BIq/SEf1GN50tq/EBAj+V/EEZQpxZ86c2zw==",
			"salt":	"Fg8DMd/3U3rJSQYu",
			"iterations":	101,
			"roles":	[{
					"rolename":	"admin"
				}]
		}],
	"roles":	[{
			"rolename":	"admin",
			"acls":	[{
					"acltype":	"publishClientSend",
					"topic":	"$CONTROL/dynamic-security/#",
					"allow":	true
				}, {
					"acltype":	"publishClientReceive",
					"topic":	"$CONTROL/dynamic-security/#",
					"allow":	true
				}, {
					"acltype":	"subscribePattern",
					"topic":	"$CONTROL/dynamic-security/#",
					"allow":	true
				}, {
					"acltype":	"publishClientReceive",
					"topic":	"$SYS/#",
					"allow":	true
				}, {
					"acltype":	"subscribePattern",
					"topic":	"$SYS/#",
					"allow":	true
				}, {
					"acltype":	"publishClientReceive",
					"topic":	"#",
					"allow":	true
				}, {
					"acltype":	"subscribePattern",
					"topic":	"#",
					"allow":	true
				}, {
					"acltype":	"unsubscribePattern",
					"topic":	"#",
					"allow":	true
				}]
		}],
	"defaultACLAccess":	{
		"publishClientSend":	false,
		"publishClientReceive":	true,
		"subscribe":	false,
		"unsubscribe":	true
	}
}
END
)

echo "${mosquittoConf}" > /mosquitto/config/mosquitto.conf
mkdir -p /mosquitto/auth/
echo "${auth}" > /mosquitto/auth/dynamic-security.json


exec "$@"