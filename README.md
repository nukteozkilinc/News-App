# NewsPulse


<img width="472" alt="Screen Shot 2023-09-21 at 19 16 22" src="https://github.com/nukteozkilinc/News-App/assets/63263623/54e9f30a-e1d0-4b34-aa86-d50cd8e16a17">

NewsPulse is a news application. The technologies used here are: 
- UserDefaults,
- Core Data,
- Alamofire,
- Firebase Authentication,
- MVVM architecture,
- Storyboard

The application presents an onboarding screen upon its initial launch, providing information about the app to the user. Here, the application stores a true/false value in UserDefaults to track whether the user has seen this page. Based on this, the user is directed to the login screen. When the user reopens the application, they won't see the onboarding screen if they have already viewed it before.
Onboarding Page : 

![Simulator Screen Shot - iPhone 14 Pro - 2023-09-21 at 21 05 46](https://github.com/nukteozkilinc/News-App/assets/63263623/eb1a62a2-b244-4770-a7a3-ced39075a816)

Login Page : 

![Simulator Screen Shot - iPhone 14 Pro - 2023-09-21 at 21 05 59](https://github.com/nukteozkilinc/News-App/assets/63263623/8201e766-1628-4bfd-a02d-73dfd0765c66)

![test](https://github.com/favicon.ico)
<img src="https://github.com/favicon.ico" width="48">


In the application, news data is fetched using Alamofire and saved using Core Data with a 'save' button. The application consists of three screens in total. On the main screen, news can be searched using a search bar, and news can be filtered using a side menu. The saved news is displayed on a separate screen

![Simulator Screen Shot - iPhone 14 Pro - 2023-09-21 at 21 06 27](https://github.com/nukteozkilinc/News-App/assets/63263623/d8b1bcf3-1698-4bf7-8126-3dc738b4869e)

Lastly, on the profile screen, the user can log out and change their password using a separate screen that appears. Additionally, the application includes different alerts for each specific error encountered.

![Simulator Screen Shot - iPhone 14 Pro - 2023-09-21 at 21 07 36](https://github.com/nukteozkilinc/News-App/assets/63263623/7fa32c71-fb91-402e-982d-db17d240f408)
