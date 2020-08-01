# Healthify

An application built on Flutter framework to cater one's health needs.<br/>
This app provides you with your current BMI(Body Mass Index), and if underweight/overweight, recommends you the appropriate and feasible number of calories to consume daily in order to normalize your BMI within the targetted number of weeks. 
Factors responsible for the computation of calorie count are: Gender, height, age, weight, user's daily activity level, and targetted number of weeks.<br/>
Moreover, the user can save his BMI to record and keep his daily personal progress in check to stay motivated throughout the journey of becoming healthy.


## Cloning and Usgage
This app requires you to use Firebase Console. Hence, in order to use the app post cloning onto your PC follow the mentioned steps.<br/>
a). Generate SHA1 and SHA256 key for your PC.<br/>
b). If you want to change the application ID, go to android->app->build.gradle and change the application id.<br/>
c). Set up Firebase console. Make sure to add the SHA1 and SHA256 keys.<br/>
d). Download the google-services.json file which has not been provided in this repository. Place it inside android->app.<br/>
e). Enable google authentication from your firebase console and set up your support email.<br/>
f). Do not forget to fill the Gooogle OAuth consent form.<br/>
g). That's it. Your App is Ready to use.<br/>

## Screenshots
<img src="https://user-images.githubusercontent.com/59926553/89010082-8cf2d380-d32b-11ea-845f-3a17e54ea59b.JPG" width="18%"></img> <img src="https://user-images.githubusercontent.com/59926553/89010087-8e240080-d32b-11ea-8aa3-48fb1d0b2242.JPG" width="18%"></img> <img src="https://user-images.githubusercontent.com/59926553/89010090-8ebc9700-d32b-11ea-8d57-17c25b31aa83.JPG" width="18%"></img> <img src="https://user-images.githubusercontent.com/59926553/89010094-90865a80-d32b-11ea-9e9d-0c580be9d7bb.JPG" width="18%"></img> <img src="https://user-images.githubusercontent.com/59926553/89010111-9845ff00-d32b-11ea-9393-27a676cfebd5.JPG" width="18%"></img> <img src="https://user-images.githubusercontent.com/59926553/89010116-9a0fc280-d32b-11ea-9fa5-7629baf702ec.JPG" width="18%"></img> <img src="https://user-images.githubusercontent.com/59926553/89010128-9e3be000-d32b-11ea-8c69-38881eb4a697.JPG" width="18%"></img> <img src="https://user-images.githubusercontent.com/59926553/89010139-a3992a80-d32b-11ea-85c6-42faee39327d.JPG" width="18%"></img> <img src="https://user-images.githubusercontent.com/59926553/89094832-cdaf2300-d3e5-11ea-8e4e-5cc3cba2d590.JPG" width="18%"></img> <img src="https://user-images.githubusercontent.com/59926553/89094834-d43d9a80-d3e5-11ea-8986-db179c0e708b.JPG" width="18%"></img> 

## Packages Used
 - Firebase Authentication
 - Google Sign In
 - Cloud Firestore


Note - This app has only been developed for android.
