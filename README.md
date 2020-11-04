# user-data
This repository contains the two scripts used during the IN THE CLOUD Webinar 5 "Using user data to create virtual Private Cloud instances".
To re-watch this webinar On Demand, visit https://event.on24.com/eventRegistration/EventLobbyServlet?target=reg20.jsp&referrer=&eventid=2797806&sessionid=1&key=0F0A5859F2FE42F8E9DBF870E3000384&regTag=1769090&sourcepage=register

webserver-userdata.sh provides an examople list of commands that can be passed at build-time. Essentilly, these will use yum to install an httpd server, install and configure s3fs-fuse, which in turn means the server can mount a bucket created in IBM Cloud Object Storage as though it was a native drive. It then copies the content of the bucket (which in this example, would hold all the files for a website), and starts the webserver.

To use this file, you will need an Object Storage bucket and credentials. You will need to update the file with those details, as indicated in the file. 

create-vsi.sh is a shell script that can be run to create a VPC Gen 2 virtual server, using the ibmcloud CLI. Further instructions on how to set this file up prior to running it can be found in the script. 

Further information about s3fs can be found here: https://github.com/jamesbeltonIBM/Mount-an-IBM-COS-bucket-to-Linux-using-s3fs

Again, these are just examples - you can do a lot with user data, so have a play!
