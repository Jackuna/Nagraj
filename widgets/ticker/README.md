##Description
A Dashing widget that overlays a scrolling news ticker on the bottom of your Dashboard.

This widget is a little different, in that it doesn't occupy a typical space in the Dashing grid, but instead overlays the bottom of the dashboard.  If it doesn't have any data, it will be hidden.  If you send it an array of Strings, it will scroll through them either vertically or horizontally.  Our office uses it on our dashboards to occasionally flash important notices or reminders in an eye catching fashion, most of the time it is not displayed.

See http://widget-challenge.herokuapp.com/vertical-ticker and http://widget-challenge.herokuapp.com/horizontal-ticker for a live demo.

##Screenshots
<img src="http://i.imgur.com/x2rJDHF.png?1"><br><br>
<img src="http://i.imgur.com/mgJdEcl.png?1">

##Dependencies
[jQuery Transit](https://github.com/rstacruz/jquery.transit)

Put jquery.transit.js in your assets/javascripts/ directory to use CSS3 animations (the default).  Or change @CSS_ANIMATION to false in ticker.coffee and jQuery's animate() will be used instead.

##Usage
To install this widget, copy ticker.html, ticker.scss, and ticker.coffee in to the widgets/ticker directory.  Optionally, copy the ticker.rb file into your jobs folder for example usage.

To include the widget on a dashboard, add the following snippet to your dashboard layout file BETWEEN the closing ul tag and closing div tag with the class gridster like this:

        </ul>
        <div data-id="ticker" data-view="Ticker" style="display: none;" ></div>
    </div>

By default, items will scroll vertically, pausing for 10 seconds on each item.  You also have the option of a continuous horizontal scrolling animation if you specify:

    <div data-id="ticker" data-view="Ticker" data-scroll_orientation="horizontal" style="display: none;" ></div>

The widget is not displayed by default, and will only display if it has content.  You send it an array of any number of Strings, and it will rotate through them.  If you send it an empty array, it will hide itself again.

    curl -d '{ "auth_token": "YOUR_AUTH_TOKEN", "items": ["Hello World!", "Well Hello Yourself!"] }' http://localhost:3030/widgets/ticker

    curl -d '{ "auth_token": "YOUR_AUTH_TOKEN", "items": [] }' http://localhost:3030/widgets/ticker
