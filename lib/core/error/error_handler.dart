
import 'package:senior_project/core/error/exceptions.dart';
import 'package:senior_project/core/util/constants.dart';
import 'package:dio/dio.dart';

///
///
/// [ErrorHandler] class is responsible of handling all the remote, local and user's input error
///
class ErrorHandler {
  /// [handleRemoteError] decides if the remote request has succeeded or not
  ///
  /// Returns:
  ///   true if there were no errors
  ///
  /// Throws:
  ///  [ServerException] in the following cases
  ///   a- With [ErrorCode.UNAUTHENTICATED]
  ///   b- With [ErrorCode.WRONG_INPUT]
  ///   c- With [ErrorCode.FORBIDDEN]
  ///   d- With [ErrorCode.SERVER_ERROR]
  ///
  static bool handleRemoteError(Response response) {
    int statusCode = response.statusCode!;
    print(response.statusCode);
    // print('412222');

    String msg ;
    try {
       msg = response.data['message'].toString();
    }catch(e){
      msg = 'Something Went Wrong';
    }

    if (statusCode >= 200 && statusCode < 300)
      return true;
    else if (statusCode == 400)
      throw ServerException(ErrorCode.BAD_REQUEST,msg:msg);
    else if (statusCode == 401)
      throw ServerException(ErrorCode.UNAUTHORIZED,msg:msg);
    else if (statusCode == 403)
      throw ServerException(ErrorCode.FORBIDDEN,msg:msg);
    else if (statusCode == 404)
      throw ServerException(ErrorCode.NOT_FOUND,msg:msg);
    else if (statusCode == 412){
      throw ServerException(ErrorCode.DUPLICATED_ENTRY,msg:msg);}
    else if (statusCode == 418)
      throw ServerException(ErrorCode.VALIDATION_ERROR,msg:msg);
    else if (statusCode == 419)
      throw ServerException(ErrorCode.INVALID_OPERATION, msg:msg);
     else if (statusCode == 477)
      throw ServerException(ErrorCode.ITEM_NOT_FOUND, msg:msg);
     else if (statusCode == 500)
      throw ServerException(ErrorCode.INTERNAL_SERVER_ERROR, msg:msg);
     else if (statusCode == 503)
      throw ServerException(ErrorCode.SERVICE_UNAVAILABLE, msg:msg);
     else       throw ServerException(ErrorCode.SERVER_ERROR, msg:msg);


  }


}
