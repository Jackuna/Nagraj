nagiosurl = "http://nagios.example.com/nagios/"
nagios_hostgroup_all = "http://nagios.example.com/nagios/cgi-bin/status.cgi?hostgroup=all";

SCHEDULER.every '180s' do

    url = "http://nagios.example.com/nagios";

    allalerts = "http://nagios.example.com/nagios/cgi-bin/history.cgi?host=all";

    host_problem = "http://nagios.example.com/nagios/cgi-bin/status.cgi?hostgroup=all&style=hostdetail&hoststatustypes=12";
    host_down  =  "http://nagios.example.com/nagios/cgi-bin/status.cgi?hostgroup=all&style=hostdetail&hoststatustypes=4";

    service_problem = "http://nagios.example.com/nagios/cgi-bin/status.cgi?hostgroup=all&style=detail&servicestatustypes=28&hoststatustypes=15"

    service_citical =  "http://nagios.example.com/nagios/cgi-bin/status.cgi?hostgroup=all&style=detail&servicestatustypes=4&hoststatustypes=15 "

    service_warning = "http://nagios.example.com/nagios/cgi-bin/status.cgi?hostgroup=all&style=detail&servicestatustypes=4&hoststatustypes=4"

    send_event('iframeId1',   { src: url })

    sleep(10)

    send_event('iframeId1',   { src: host_problem })

    sleep(10)

    send_event('iframeId1',   { src: host_down })

    sleep(10)

    send_event('iframeId1',   { src: host_down })

    sleep(10)

    send_event('iframeId1',   { src: service_problem })

    sleep(10)

    send_event('iframeId1',   { src: service_citical })

    sleep(10)

    send_event('iframeId1',   { src: service_warning })

    sleep(10)
    
    send_event('iframeId1',   { src: url })


end
