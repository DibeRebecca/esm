import 'package:esm/core/data/datasources/vehicle_remote_datasource.dart';
import 'package:esm/core/data/models/vehicle_model.dart';
import 'package:get/get.dart';

class VehiculeController extends GetxController {
  final _source = VehicleRemoteDatasource();

  Future<List<Vehicule>?> getVehicules() async {
    return await _source.getVehicules();
  }

  void addVehicle(
      {required String matricule,
      required String couleur,
      required String type,
      required int nbreSieges,
      required int modelId,
      required String commentaire}) async {
    await _source.addVehicle(
        matricule: matricule,
        couleur: couleur,
        type: type,
        nbreSieges: nbreSieges,
        modelId: modelId,
        commentaire: commentaire);
  }

  void deleteVehicle({required String id}) async {
    await _source.deleteVehicle(id: id);
  }
}
