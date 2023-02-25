import 'package:pic_viewer/app/di/modules/blocs_module.dart';
import 'package:pic_viewer/app/di/modules/repositories_module.dart';
import 'package:pic_viewer/app/di/modules/use_cases_module.dart';
import 'package:get_it/get_it.dart';

final GetIt _getIt = GetIt.instance;

Future<void> configureDependencies() async {
  RepositoriesModule.register(_getIt);
  UseCasesModule.register(_getIt);
  BlocsModule.register(_getIt);
}

/// Inject the dependency from get_it.
T inject<T extends Object>({String? instanceName, dynamic param1, dynamic param2}) =>
    _getIt.get<T>(instanceName: instanceName, param1: param1, param2: param2);

/// Checks if [T] can be injected.
bool canInject<T extends Object>() => _getIt.isRegistered<T>();
