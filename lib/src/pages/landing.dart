import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_pragma/src/environment/environment.dart';
import 'package:test_pragma/src/models/cats_model.dart';
import 'package:test_pragma/src/pages/detail.dart';
import 'package:test_pragma/src/provider/cat_provider.dart';
import 'package:test_pragma/src/services/cat_services.dart';
import 'package:test_pragma/src/widgets/widgets.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  late TextEditingController _search;
  CatServices catServices = CatServices();
  late var catsFinal;

  @override
  void initState() {
    super.initState();
    _search = TextEditingController();
  }

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: fondoColor,
        body: SafeArea(
          top: true,
          bottom: true,
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SizedBox(
              width: media.width,
              height: media.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    NoReturn(),
                    FadeInUp(
                        delay: const Duration(milliseconds: 100),
                        child: title()),
                    const SpaceVer(heightSpace: 1),
                    FadeInUp(
                        delay: const Duration(milliseconds: 300),
                        child: search(media)),
                    const SpaceVer(heightSpace: 1),
                    FadeInUp(
                        delay: const Duration(milliseconds: 500),
                        child: constructorCats(media)),
                    const SpaceVer(heightSpace: 1),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget title() {
    return TextWidget(
        text: "Catbreeds",
        font: "PoppinsBold",
        size: 30,
        color: negroColor,
        textalign: TextAlign.center,
        textDecoration: TextDecoration.none);
  }

  Widget search(media) {
    return TextForms(
        width: media.width * 0.95,
        controller: _search,
        hintText: "Busquemos tú gato",
        obscureText: false,
        passwordType: "False",
        iconData: Icons.search);
  }

  Widget constructorCats(media) {
    return SizedBox(
        width: media.width,
        height: media.height - media.height * 0.26,
        child: FutureBuilder(
          future: catServices.catsData(),
          builder:
              (BuildContext context, AsyncSnapshot<List<CatsModel>> snapshot) {
            if (snapshot.hasData) {
              catsFinal = snapshot.data;
              if (_search.text == "") {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: catsFinal!.length,
                    padding: const EdgeInsets.only(top: 10),
                    itemBuilder: (context, i) {
                      return cardCats(catsFinal[i], media, i);
                    });
              } else {
                final List<CatsModel> catsSearch = catsFinal;
                var query = _search.text;

                List<CatsModel> matchQuery = [];
                for (var catsBuscador in catsSearch) {
                  if (catsBuscador.name!
                      .toLowerCase()
                      .contains(query.toLowerCase())) {
                    matchQuery.add(catsBuscador);
                  }
                }
                return matchQuery.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: matchQuery.length,
                        padding: const EdgeInsets.only(top: 10),
                        itemBuilder: (context, i) {
                          var result = matchQuery[i];
                          return cardCats(result, media, i);
                        })
                    : SizedBox(
                        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: media.width * 0.5,
                            height: media.width * 0.5,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/placeholder.jpg"), fit: BoxFit.cover)),
                          ),
                          TextWidget(
                              text: "No Cats Found",
                              font: "PoppinsBold",
                              size: 20,
                              color: negroColor,
                              textalign: TextAlign.center,
                              textDecoration: TextDecoration.none)
                        ],
                      ));
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  Widget cardCats(CatsModel catsModel, media, i) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: media.width,
      height: media.height * 0.46,
      decoration: BoxDecoration(
        color: blancoColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 10.0,
            color: negroSombraColor,
            offset: const Offset(4.0, 4.0),
          )
        ],
        border: Border.all(color: negroSombraColor, width: 0.5),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
              width: media.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                      text: catsModel.name.toString(),
                      font: "PoppinsBold",
                      size: 20,
                      color: negroColor,
                      textalign: TextAlign.left,
                      textDecoration: TextDecoration.none),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed("detail");
                      catDetails(catsModel);
                    },
                    child: TextWidget(
                        text: "Más...",
                        font: "Poppins",
                        size: 16,
                        color: negroColor,
                        textalign: TextAlign.left,
                        textDecoration: TextDecoration.none),
                  ),
                ],
              )),
          const SpaceVer(heightSpace: 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: catsModel.referenceImageId.toString(),
                child: FadeInImage(
                  width: media.width * 0.7,
                  height: media.width * 0.7,
                  image: NetworkImage(
                    "https://cdn2.thecatapi.com/images/${catsModel.referenceImageId}.jpg",
                  ),
                  placeholder:
                      const AssetImage("assets/images/placeholder.jpg"),
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      "assets/images/noImage.jpg",
                      width: media.width * 0.7,
                      height: media.width * 0.7,
                    );
                  },
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
          Container(
              margin: const EdgeInsets.only(left: 20, right: 20, top: 15),
              width: media.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                      text: "Country: ${catsModel.countryCode}",
                      font: "Poppins",
                      size: 18,
                      color: negroColor,
                      textalign: TextAlign.left,
                      textDecoration: TextDecoration.none),
                  TextWidget(
                      text: "Inteligence: ${catsModel.intelligence}",
                      font: "Poppins",
                      size: 16,
                      color: negroColor,
                      textalign: TextAlign.left,
                      textDecoration: TextDecoration.none),
                ],
              )),
        ],
      ),
    );
  }

  void catDetails(CatsModel catsModel) {
    final catProvider = Provider.of<CatProvider>(context, listen: false);

    catProvider.imperial = catsModel.weight!.imperial!;
    catProvider.metric = catsModel.weight!.metric!;
    catProvider.id = catsModel.id!;
    catProvider.name = catsModel.name!;
    catProvider.cfaUrl = catsModel.cfaUrl!;
    catProvider.vetstreetUrl = catsModel.vetstreetUrl!;
    catProvider.vcahospitalsUrl = catsModel.vcahospitalsUrl!;
    catProvider.temperament = catsModel.temperament!;
    catProvider.origin = catsModel.origin!;
    catProvider.countryCodes = catsModel.countryCodes!;
    catProvider.countryCode = catsModel.countryCode!;
    catProvider.description = catsModel.description!;
    catProvider.lifeSpan = catsModel.lifeSpan!;
    catProvider.indoor = catsModel.indoor!;
    catProvider.lap = catsModel.lap!;
    catProvider.altNames = catsModel.altNames!;
    catProvider.adaptability = catsModel.adaptability!;
    catProvider.affectionLevel = catsModel.affectionLevel!;
    catProvider.childFriendly = catsModel.childFriendly!;
    catProvider.dogFriendly = catsModel.dogFriendly!;
    catProvider.energyLevel = catsModel.energyLevel!;
    catProvider.grooming = catsModel.grooming!;
    catProvider.healthIssues = catsModel.healthIssues!;
    catProvider.intelligence = catsModel.intelligence!;
    catProvider.sheddingLevel = catsModel.sheddingLevel!;
    catProvider.socialNeeds = catsModel.socialNeeds!;
    catProvider.strangerFriendly = catsModel.strangerFriendly!;
    catProvider.vocalisation = catsModel.vocalisation!;
    catProvider.experimental = catsModel.experimental!;
    catProvider.hairless = catsModel.hairless!;
    catProvider.natural = catsModel.natural!;
    catProvider.rare = catsModel.rare!;
    catProvider.rex = catsModel.rex!;
    catProvider.suppressedTail = catsModel.suppressedTail!;
    catProvider.shortLegs = catsModel.shortLegs!;
    catProvider.wikipediaUrl = catsModel.wikipediaUrl!;
    catProvider.hypoallergenic = catsModel.hypoallergenic!;
    catProvider.referenceImageId = catsModel.referenceImageId!;
    catProvider.catFriendly = catsModel.catFriendly!;
    catProvider.bidability = catsModel.bidability!;
  }
}
