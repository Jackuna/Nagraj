ticker_items = [
  "NagiosXI Custom Dashing dashbpard is on the way..",
	" It's a coll widget afterall.. and it needs some more time"
]

SCHEDULER.every '20s', :first_in => 0 do
	send_event( 'ticker', { :items => ticker_items } )
end
