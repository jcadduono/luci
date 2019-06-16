--[[
LuCI - Network model - MBIM protocol extension

Copyright 2015 Cezary Jackiewicz <cezary.jackiewicz@gmail.com>

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

	http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

]]--

local netmod = luci.model.network

local proto = netmod:register_protocol("mbim")
local interface = luci.model.network.interface

function proto.get_i18n(self)
	return luci.i18n.translate("MBIM Cellular")
end

function proto.get_interface(self)
	local _ifname=netmod.protocol.ifname(self)
	if not _ifname then
		_ifname = "wan"
	end
	return interface(_ifname, self)
end

function proto.opkg_package(self)
	return "umbim"
end

function proto.is_installed(self)
	return nixio.fs.access("/lib/netifd/proto/mbim.sh")
end

function proto.is_floating(self)
	return true
end

function proto.is_virtual(self)
	return true
end

function proto.get_interfaces(self)
	return nil
end

function proto.contains_interface(self, ifc)
	return (netmod:ifnameof(ifc) == self:ifname())
end

netmod:register_pattern_virtual("^mbim%-%w")

netmod:register_error_code("NO_DEVICE",	luci.i18n.translate("Control device does not exist"))
netmod:register_error_code("NO_IFNAME",	luci.i18n.translate("Failed to find matching interface"))
netmod:register_error_code("NO_APN",		luci.i18n.translate("No APN specified"))
netmod:register_error_code("PIN_FAILED",	luci.i18n.translate("Unable to verify PIN"))
netmod:register_error_code("NO_SUBSCRIBER",	luci.i18n.translate("Subscriber init failed"))
netmod:register_error_code("NO_REGISTRATION",	luci.i18n.translate("Subscriber registration failed"))
netmod:register_error_code("ATTACH_FAILED",	luci.i18n.translate("Failed to attach to network"))
