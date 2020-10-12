import 'package:firebase_auth/firebase_auth.dart';
import 'package:shapecoach/constants/route_names.dart';
import 'package:shapecoach/services/authentication_service.dart';
import 'package:shapecoach/services/navigation_service.dart';

import '../locator.dart';
import 'base_model.dart';

class StartUpViewModel extends BaseModel {

  final AuthenticationService _authenticationService = locator<AuthenticationService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.navigateTo(HomeViewRoute);
    } else {
      _navigationService.navigateTo(LoginViewRoute);
    }
  }

}