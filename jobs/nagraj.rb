
SCHEDULER.every '5s' do
  

  host_count = ` curl  -s -k -L -u nagiosadmin:123 'https://nagios.example.com/nagios/cgi-bin/objectjson.cgi?query=hostcount' | jq '.data.count' `

  host_status = ` curl  -s -k -L -u nagiosadmin:123 'https://nagios.example.com/nagios/cgi-bin/statusjson.cgi?query=hostcount&hoststatus=up+down+unreachable+pending' | jq '.data.count.up' `
 
  host_dow = ` curl  -s -k -L -u nagiosadmin:123 'https://nagios.example.com/nagios/cgi-bin/statusjson.cgi?query=hostcount&hoststatus=up+down+unreachable+pending' | jq '.data.count.down' `
  
  service_count = ` curl  -s -k -L -u nagiosadmin:123 'https://nagios.example.com/nagios/cgi-bin/objectjson.cgi?query=servicecount' | jq '.data.count' `

  service_ok = ` curl  -s -k -L -u nagiosadmin:123 'https://nagios.example.com/nagios/cgi-bin/statusjson.cgi?query=servicecount' | jq '.data.count.ok' `

  service_warn = ` curl  -s -k -L -u nagiosadmin:123 'https://nagios.example.com/nagios/cgi-bin/statusjson.cgi?query=servicecount' | jq '.data.count.warning' `

  service_crit = ` curl  -s -k -L -u nagiosadmin:123 'https://nagios.example.com/nagios/cgi-bin/statusjson.cgi?query=servicecount' | jq '.data.count.critical' `

  host_under_downtime = ` curl  -s -k -L -u nagiosadmin:123 'https://nagios.example.com/nagios/cgi-bin/statusjson.cgi?query=downtimecount&downtimeobjecttypes=host' | jq '.data.count' `


  send_event('synergy',   { value: host_status, max: host_count })
  send_event('host_down',   { value: host_dow, max: host_count })
  send_event('service_okay',   { value: service_ok, max: service_count })
  send_event('service_warning',   { value: service_warn, max: service_count })
  send_event('service_critical',   { value: service_crit, max: service_count })
  send_event('customwid',   { current: host_under_downtime })


end
