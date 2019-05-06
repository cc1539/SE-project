Front-End
The front-end code can be found in the ZIP file called "Frontend Website.zip". Simply copy the files into the appropriate directory on a internet-facing device running server software (e.g. Wampserver). Then, any other devices that connect to this device will be able to view and interact with our website. To show what it would look like, the website is hosted on 000webhostapp.com at "https://inspark2019.000webhostapp.com/v2/". This website utilizes multiple web technologies, namely HTML and CSS, JavaScript, PHP, and SQL. Additionally, the p5.js, jQuery, and qrcode.js JavaScript libraries are used.

Back-End
Administrative Software
This software requires windows OS and a minimum java 8 runtime environment. This software will not work properly if it is run under linux based OS or Mac OS because of the file path difference between Windows file directory and the file directory in other OS. The back end software can be found under the folder called "Backend Management Software". There is a compiled file called Back_End.jar. All the car photos can be found under the folder called carPhoto. This folder should be located on the same directory to make back end software working properly. The car photos are named with increment number, and their extension should be png file. Basically, the functionalities of this software are based on SQL and car recognition API offered by OpenALPR. The credential information of back end software as well as online hosted database can be found in the text file which is called "Log in Info". To enter database, please follow the instruction in the text file mentioned above.

Hardware Interfacing Software
The hardware consists of an Arduino board, a camera, and a pressure sensor. The code that the arduino runs can be found in the folder called "arduino". To utilize the assembled product, connect the Arduino to a mouse and/or keyboard and power it on. After windows boots up, run the "ArduCAM" application. At this point, the camera will take a photo whenever the arduino's pressure sensor detects enough force. The intent is for this image to be sent to a remote license plate recognition API, which will return the license plate number to us.

Android Software
Android software projects can be found in the folder called "Android Software". To install these APP in your android phone, simply open these project folders using Android Studio and press run on android phone. In order to make sure that your android phone can be recognized by Android Studio, you should enable developer mode and open USB debugging mode.

