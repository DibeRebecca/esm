import 'package:dio/dio.dart';
import 'package:esm/core/data/models/vehicle_model.dart';
import 'auth_remote_datasource.dart';

class VehicleRemoteDatasource {
  Future<void> addVehicle(
      {required String matricule,
      required String couleur,
      required String type,
      required int nbreSieges,
      required int modelId,
      required String commentaire}) async {
    final data = {
      "matricule": matricule,
      "couleur": couleur,
      "type": type,
      "nb_sieges": 0,
      "modele_id": 1,
      "commentaire": commentaire
    };
    final response = await dio.post(
      'https://www.app.loryshare.com/api/vehicules/store',
      data: data,
      options: Options(
        headers: {
          'Accept': 'application/json',
          "Authorization": "Bearer 30|c4TgMamseIxxsnPgDDkMRo2FyV4PcoB12WSqCPAm"
        },
        contentType: 'application/x-www-form-urlencoded',
        followRedirects: true,
      ),
    );
    print(response.statusCode);
    print(response.data);
  }

  // Future<List<dynamic>>
  Future<List<Vehicule>?> getVehicules() async {
    final response = await dio.get(
        "https://www.app.loryshare.com/api/vehicules",
        options: Options(headers: {
          "Authorization": "Bearer 30|c4TgMamseIxxsnPgDDkMRo2FyV4PcoB12WSqCPAm"
        }));
    print(response.statusCode);
    print(response.data);
    if (response.statusCode == 200) {
      final listsVehicles = response.data['vehicules'] as List<dynamic>;
      print(listsVehicles[0]);
      List<Vehicule> vehicles =
          listsVehicles.map((e) => Vehicule.fromJson(e)).toList();
      print(vehicles.length);
      return listsVehicles.map((e) => Vehicule.fromJson(e)).toList();
    }
  }

  Future<List<Vehicule>?> deleteVehicle({required String id}) async {
    final response = await dio.delete(
        "https://www.app.loryshare.com/api/vehicules/$id/delete",
        options: Options(headers: {
          "Authorization": "Bearer 30|c4TgMamseIxxsnPgDDkMRo2FyV4PcoB12WSqCPAm"
        }));
    print(response.statusCode);
    print(response.data);
  }
}
