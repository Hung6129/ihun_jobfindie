import 'package:fpdart/fpdart.dart';
import 'package:ihun_jobfindie/features/jobs/search/apis/fetch_jobs.dart';
import 'package:ihun_jobfindie/shared/models/job/job_model.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_job_provider.g.dart';

@riverpod
class SearchJobProviderState extends _$SearchJobProviderState {
  @override
  FutureOr<List<JobModel>> build() async => fetchRandomJob
      .getOrElse(
        (l) => throw Exception(l),
      )
      .run();

  /// User request, try to convert user input to [int] and then
  /// request the pokemon if successful.
  Future<Unit> fetch(String userInput) async => _pokemonRequest(
        () => fetchJobFromUserInput(userInput),
      );

  /// Generic private method to perform request and update the state.
  Future<Unit> _pokemonRequest(
    TaskEither<String, List<JobModel>> Function() request,
  ) async {
    state = const AsyncLoading();
    final pokemon = request();
    state = (await pokemon.run()).match(
      (error) => AsyncError(error, StackTrace.current),
      (pokemon) => AsyncData(pokemon),
    );
    return unit;
  }
}
