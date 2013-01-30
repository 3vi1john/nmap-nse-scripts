description = [[
]]

---
-- @usage
-- 
-- @output
--
-- @args
--


author = ""
license = "Same as Nmap--See http://nmap.org/book/man-legal.html"
categories = {"vuln", "exploit"}

local http = require "http"
local shortport = require "shortport"
portrule = shortport.http

action = function(host, port)
local resp = "ProCurve"

local stat = http.get(host, port, '/home.html')
if stat.status == 401 and http.response_contains(stat, resp) then 
    return "Procurve Device Found"
  else
    return "Not a procurve Device"
  end
end
