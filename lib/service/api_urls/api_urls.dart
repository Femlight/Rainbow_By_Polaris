const String BASE_URL =
    'https://polaris-rainbow-core-api-dev.azurewebsites.net';

class ApiEndpoint {
  static String getUserDetails() {
    return '$BASE_URL/api/v1/account/get-customer-details';
  }
  static String createTask() {
    return '$BASE_URL/api/v1/tasks/create';
  }
}
