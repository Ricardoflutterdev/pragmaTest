import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test_pragma/src/environment/environment.dart';
import 'package:test_pragma/src/helpers/localstorage.dart';
import 'package:test_pragma/src/models/cats_model.dart';

class CatServices {
  Future<List<CatsModel>> catsData() async {
    final url = Uri.parse("$urlBase/v1/breeds");

    String tokenFinal = LocalStorage.prefs.getString("token").toString();
    var decodedData;

    await http.get(url, headers: {
      "Content-Type": "application/json",
      "x-api-key": "bda53789-d59e-46cd-9bc4-2936630fde39"
    }).then((value) {
      decodedData = json.decode(value.body);
    });

    List<CatsModel> list = [];

    List<CatsModel> catsListGeneral = list;

    if (decodedData != []) {
      decodedData.forEach((message) {
        final catsListTemp = CatsModel.fromJson(message);
        final catsList = CatsModel(
            weight: catsListTemp.weight,
            id: catsListTemp.id ?? "",
            name: catsListTemp.name ?? "",
            cfaUrl: catsListTemp.cfaUrl ?? "",
            vetstreetUrl: catsListTemp.vetstreetUrl ?? "",
            vcahospitalsUrl: catsListTemp.vcahospitalsUrl ?? "",
            temperament: catsListTemp.temperament ?? "",
            origin: catsListTemp.origin ?? "",
            countryCodes: catsListTemp.countryCodes ?? "",
            countryCode: catsListTemp.countryCode ?? "",
            description: catsListTemp.description ?? "",
            lifeSpan: catsListTemp.lifeSpan ?? "",
            indoor: catsListTemp.indoor ?? 0,
            lap: catsListTemp.lap ?? 0,
            altNames: catsListTemp.altNames ?? "",
            adaptability: catsListTemp.adaptability ?? 0,
            affectionLevel: catsListTemp.affectionLevel ?? 0,
            childFriendly: catsListTemp.childFriendly ?? 0,
            dogFriendly: catsListTemp.dogFriendly ?? 0,
            energyLevel: catsListTemp.energyLevel ?? 0,
            grooming: catsListTemp.grooming ?? 0,
            healthIssues: catsListTemp.healthIssues ?? 0,
            intelligence: catsListTemp.intelligence ?? 0,
            sheddingLevel: catsListTemp.sheddingLevel ?? 0,
            socialNeeds: catsListTemp.socialNeeds ?? 0,
            strangerFriendly: catsListTemp.strangerFriendly ?? 0,
            vocalisation: catsListTemp.vocalisation ?? 0,
            experimental: catsListTemp.experimental ?? 0,
            hairless: catsListTemp.hairless ?? 0,
            natural: catsListTemp.natural ?? 0,
            rare: catsListTemp.rare ?? 0,
            rex: catsListTemp.rex ?? 0,
            suppressedTail: catsListTemp.suppressedTail ?? 0,
            shortLegs: catsListTemp.shortLegs ?? 0,
            wikipediaUrl: catsListTemp.wikipediaUrl ?? "",
            hypoallergenic: catsListTemp.hypoallergenic ?? 0,
            referenceImageId: catsListTemp.referenceImageId ?? "",
            catFriendly: catsListTemp.catFriendly ?? 0,
            bidability: catsListTemp.bidability ?? 0);

        catsListGeneral.add(catsList);
      });
    } else {
      catsListGeneral = [];
    }

    return catsListGeneral;
  }
}
