import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:rubium_test/core/network/client_service.dart';
import 'package:rubium_test/features/data/model/getrandom_model.dart';


part 'person_source.g.dart';

@RestApi(baseUrl: "https://randomuser.me/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
  @GET('')
  Future<GetRandomUserModel> getResults();
  @GET('')
  Future<GetRandomUserModel> getResultsCount(@Query('results') String count);
}

class PersonRemoteSource  {
  ClientService client;
  PersonRemoteSource(this.client);

  Future<GetRandomUserModel>  getResult()  async {
    return await RestClient(client.dio).getResults();
  }
  Future<GetRandomUserModel>  getResultCount(int count)  async {
    return await RestClient(client.dio).getResultsCount(count.toString());
  }
}
