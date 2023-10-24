
import 'package:get_it/get_it.dart';
import '../services/loader_notifier_service.dart';
import '../services/user_details_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
 // locator.registerSingleton<UserService>(UserService());
  
  locator.registerSingleton<LoaderNotifierService>(LoaderNotifierService());
}
