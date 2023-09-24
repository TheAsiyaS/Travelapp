import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'Injection.config.dart';

final getIt = GetIt.instance;
@InjectableInit()
Future<void> configInjection() async {
  await $initGetIt(getIt, environment: Environment.prod);
}
