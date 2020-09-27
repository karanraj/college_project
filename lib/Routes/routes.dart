
import 'package:DockerApp/FullApp/CreateVolume.dart';
import 'package:DockerApp/FullApp/Create_Network.dart';
import 'package:DockerApp/FullApp/ExposeContainer.dart';
import 'package:DockerApp/FullApp/LaunchContainer.dart';
import 'package:DockerApp/FullApp/Start_Stop.dart';
import 'package:DockerApp/FullApp/dashboard.dart';
import 'package:DockerApp/FullApp/Images.dart';
import 'package:DockerApp/FullApp/removeAllContainer.dart';
import 'package:DockerApp/FullApp/removeContainer.dart';
import 'package:DockerApp/FullApp/terminal.dart';
import 'package:DockerApp/Welcome_SignIn_SignUp/SignIn.dart';
import 'package:DockerApp/FullApp/ViewAll.dart';
import 'package:DockerApp/Welcome_SignIn_SignUp/forgotpass.dart';
import 'package:DockerApp/Welcome_SignIn_SignUp/signUp.dart';
import 'package:DockerApp/Welcome_SignIn_SignUp/welcomeScreen.dart';

var approutes = {
  // "/" route, build the WelcomeScreen.
  'welcomescreen': (context) => WelcomeScreen(),

  //"/second" route, build the LogInScreen.
  'signin': (context) => SignInScreen(),

  // "/signup" route build the SignInScreen
  'signup': (context) => SignUp(),

  //"/forgotpass" route build the ForgotPassScreen
  'forgotpass': (context) => ForgotPassScreen(),

  //"/viewall" go to All function page
  'viewall': (context) => ViewAll(),

  //"dashboard" go to Dashboard Page
  'dashboard': (context) => DashBoard(),

  //"launchContainer" go to Launch a container page
  'launchContainer': (context) => LaunchContainer(),

  //"createImage"
  'createImage': (context) => CreateImage(),

  //"createNetwork"
  'createNetwork': (context) => CreateNetwork(),

  //"createVolume"
  'createVolume': (context) => CreateVolume(),

  //"downloadImage"
  'downloadImage': (context) => DownloadImage(),

  //"removeImage"
  'removeImage': (context) => RemoveImage(),

  //"terminal"
  'terminal': (context) => Terminal(),

  //"exposeContainer"
  'exposeContainer': (context) => ExposeContainer(),

  //"pushImage"
  'pushImage': (context) => PushImage(),

  //"startContainer"
  'startContainer': (context) => StartContainer(),

  //"stopContainer"
  'stopContainer': (context) => StopContainer(),

  //"removeContainer"
  'removeContainer': (context) => RemoveContainer(),

  //"removeAllContainer"
  'removeAllContainer': (context) => RemoveAllContainer(),

  //"imageList"
  'imageList': (context) => ImageList(),
};
