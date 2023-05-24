abstract class NetworkResponse {
  NetworkResponse();
}

class NetworkHttpErrorResponse extends NetworkResponse {
  final String error;
  NetworkHttpErrorResponse(this.error);
}

class NetworkExceptionResponse extends NetworkResponse {
  final String exception;
  NetworkExceptionResponse(this.exception);
}

class NetworkSucceedResponse<T> extends NetworkResponse {
  T data;
  NetworkSucceedResponse(this.data);
}
