# InterviewAssignment

The exercise involves build a “proof of concept” app which consumes a REST service and displays photos with headings and descriptions. 

Created a universal iOS app using Swift which includes:

1.  Ingests a json feed https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json

2.  Have not used a third party Json parser to parse. Used default URLSession for request and parsing.

3.  Displays the content (including image, title and description) in a table.

4.  The title in the navbar is updated from the json.

5.  Each row should be the right height to display its own content and no taller. No content should be clipped. This means some rows will be larger than others.

6.  Downloaded images asynchronously.

7.  Immplemented pull to refresh to refresh the content whenever required.

8.  Its not blocking UI when web requests are happening. All UI related stuff is handled on main thread.

9.  Supports all iOS versions from the latest back at least 2 versions
