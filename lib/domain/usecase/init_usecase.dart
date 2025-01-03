import 'package:my_training_app/core/usecases/usecase.dart';
import 'package:my_training_app/data/models/init_response.dart';
import 'package:my_training_app/domain/repositories/init_repository.dart';

class GetTrainings implements UseCase<InitResponse, NoParams> {
  final InitRepository repository;

  GetTrainings(this.repository);

  @override
  Future<InitResponse> call(NoParams params) async {
    return await repository.initRequest();
  }
}

class NoParams {}
