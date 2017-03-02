
Add this snippet to app/assets/javascripts/application.js
 
```javascript
var blocmetrics = {};
  blocmetrics.report = function(eventName){
    var event = {event: { name: eventName }};
    var request = new XMLHttpRequest();
    request.open("POST", "https://bloc-foundation-2-agrund.c9users.io/api/events", true);
    request.setRequestHeader('Content-Type', 'application/json');
    request.send(JSON.stringify(event));
  };
```
Add this snippet to the page you are trying to track
```javascript  
<script type="text/javascript">
  $(document).on("ready page:load", function () {
    blocmetrics.report("Add event name here");
  })
</script>
```
