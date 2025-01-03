import 'package:my_training_app/domain/repositories/init_repository.dart';

import '../datasources/init_remote_data_source.dart';
import '../models/init_response.dart';

class InitRepositoryImpl implements InitRepository {
  final InitRemoteDataSource remoteDataSource;

  InitRepositoryImpl(this.remoteDataSource);

  @override
  Future<InitResponse> initRequest() async {
    return await remoteDataSource.initRequest();
  }
}
