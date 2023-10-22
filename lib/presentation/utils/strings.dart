import '../../main.dart';

const String stagingDomain =
    'https://jvec-backend-solution.onrender.com'; //'https://fastlink-pr-2.onrender.com';
const String liveDomain =
    'https://jvec-backend-solution.onrender.com'; //'http://0.0.0.0:4455';

const String stagingURL = "$stagingDomain";
const String liveURL = '$liveDomain';

class AppStrings {
  // static const String noRouteFound = "No Route Found";
  static String get baseUrl => appDebugMode.value ? stagingURL : liveURL;
  static String get baseDomain =>
      appDebugMode.value ? stagingDomain : liveDomain;
}

const String kUrl = 'https://picsum.photos/200/200';

const String kPoppins = 'Poppins';
const String kRoboto = 'Poppins';


const int kCripsExpiryTime = 1; // In hours

const String cripsID = '8f23541e-0518-4659-ba4f-7cda9aa5ac68';

const String googleMapsAPIKey = "AIzaSyB-_DDU0TQKu5wWEKybt1VkM-1VbXVIDl8";
