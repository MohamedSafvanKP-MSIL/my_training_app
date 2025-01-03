// injection_container.dart

import 'package:get_it/get_it.dart';
import '../../data/datasources/init_remote_data_source.dart';
import '../../data/repositories/init_repository_impl.dart';
import '../../domain/repositories/init_repository.dart';
import '../../domain/usecase/init_usecase.dart';
import '../../presentation/view_models/home_view_model.dart';
import '../../presentation/view_models/search_filter_view_model.dart';


final sl = GetIt.instance;

void init() {
  // Data layer
  sl.registerLazySingleton<InitRemoteDataSource>(() => InitRemoteDataSource());
  sl.registerLazySingleton<InitRepository>(
          () => InitRepositoryImpl(sl()));

  // Domain layer
  sl.registerLazySingleton<GetTrainings>(() => GetTrainings(sl()));

  // Presentation layer
  sl.registerFactory<HomeViewModel>(() => HomeViewModel(getTrainings: sl()));
  sl.registerFactory<SearchFilterViewModel>(
          () => SearchFilterViewModel());
}
