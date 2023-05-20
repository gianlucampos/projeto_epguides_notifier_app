import 'package:dartz/dartz.dart';
import 'package:epguides_notifier_app/features/consultApi/data/data_sources/api_datasource.dart';
import 'package:epguides_notifier_app/features/consultApi/domain/entities/episode_info.dart';
import 'package:epguides_notifier_app/features/consultApi/domain/errors/errors.dart';
import 'package:epguides_notifier_app/features/consultApi/domain/repositories/episode_repository.dart';

class EpisodeRepositoryImpl implements EpisodeRepository {
  final ApiDatasource datasource;

  EpisodeRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureSearch, List<EpisodeInfo>?>> getLastSeasonEpisodes(
      String showName) async {
    try {
      final result = await datasource.getLastSeasonEpisodes(showName);
      return Right(result);
    } on DatasourceError catch (e) {
      return Left(e);
    } catch (e) {
      return Left(DatasourceError());
    }
  }
}
