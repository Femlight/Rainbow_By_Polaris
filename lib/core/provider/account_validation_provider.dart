import 'package:flutter/material.dart';
import 'package:rainbow_by_polaris/core/enums/query_state.dart';
import 'package:rainbow_by_polaris/core/enums/request_state.dart';
import 'package:rainbow_by_polaris/core/failure.dart';
import 'package:rainbow_by_polaris/data/dtos/validate_account_dto/validate_account_number_dto.dart';
import 'package:rainbow_by_polaris/service/datasource.dart';

class ValidateAccountProvider extends ChangeNotifier {
  final AuthDataSource _authDataSource;

  ValidateAccountProvider({
    required AuthDataSource authDataSource,
  }) : _authDataSource = authDataSource;
  bool isLoading = false;
  String? value;

  RequestState _validateRequestState = RequestState.idle;
  RequestState get validateRequestState => _validateRequestState;

  QueryState _validateQuery = QueryState.notQuerying;
  QueryState get validateQuery => _validateQuery;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void startLoading() {
    isLoading = true;
    notifyListeners();
  }

  void stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  void validateAccount(String accoutNumber) async {
    try {
      _validateRequestState = RequestState.idle;
      _validateQuery = QueryState.querying;
      notifyListeners();

      final validateParams = ValidateAccountNumberDto(
          customertypeid: '', accoutNumber: accoutNumber);
      final validate = await _authDataSource.validateAccount(validateParams);
      value = validate.value;


      _validateRequestState = RequestState.success;
      _validateQuery = QueryState.notQuerying;
    } on Failure catch (_) {
      _validateQuery = QueryState.notQuerying;
      updateErrorMessage(_.toString());
      _validateRequestState = RequestState.failure;

      notifyListeners();
    } finally {

    }
  }

  void updateErrorMessage(String? error) {
    _errorMessage = error;
    }
}
