# Healthify

An application built on the Flutter framework to cater to one's health needs. This app provides you with your current BMI, and if underweight/overweight, this app lets you set targets to get fit by providing the data of the required number of calories that one must consume in a day in order to reach the required BMI. The value of the calorie that one must consume daily is computed by taking weight, age, height, gender and daily activity level into account. Moreover, the users can also watch their progress to keep themselves motivated.

## Cloning and Usgage
This app requires you to use Firebase Console. Hence, in order to use the app post cloning onto your PC follow the mentioned steps.<br/>
a). Generate SHA1 and SHA256 key for your PC.<br/>
b). If you want to change the application ID, go to android->app->build.gradle and change the application id.<br/>
c). Set up Firebase console. Make sure to add the SHA1 and SHA256 keys.<br/>
d). Download the google-services.json file which has not been provided in this repository. Place it innside android->app.<br/>
e). Enable google authentication from your firebase console and set up your support email.<br/>
f). Do not forget to fill the Gooogle OAuth consent form.<br/>
g). That's it. Your App is Ready to use.<br/>

## Packages Used
 - Firebase Authentication
 - Google Sign In
 - Cloud Firestore


Note - This app has only been developed for android.
