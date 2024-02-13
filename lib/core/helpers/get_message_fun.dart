  import 'package:e_commerce/core/errors/failure.dart';
import 'package:e_commerce/core/string/failures.dart';

String getMessage(Failure failure) {
    switch (failure.runtimeType) {
      case OfflineFailure:
        return OFFLINE_FAILURE_MSG;
      case ServerFailure:
        return SERVER_FAILURE_MSG;
      case ErrorNameOrPasswordFailure:
        return UNCORRECT_FAILURE_MSG;
      default:
        return UNEXCEPTION_FAILURE_MSG;
    }
  }
