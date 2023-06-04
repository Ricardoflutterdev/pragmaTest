import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_pragma/src/environment/environment.dart';
import 'package:test_pragma/src/provider/cat_provider.dart';
import 'package:test_pragma/src/widgets/widgets.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final catProvider = Provider.of<CatProvider>(context, listen: true);

    String referenceImage = catProvider.referenceImageId;
    String urlImage = "https://cdn2.thecatapi.com/images/$referenceImage.jpg";

    String titleCat = catProvider.name;
    return Scaffold(
        backgroundColor: fondoColor,
        body: SafeArea(
          bottom: true,
          top: true,
          child: SizedBox(
              width: media.width,
              height: media.height,
              child: Column(
                children: [
                  NoReturn(),
                  title(media, titleCat),
                  const SpaceVer(heightSpace: 2),
                  catImage(media, urlImage, referenceImage),
                  const SpaceVer(heightSpace: 2),
                  description(media)
                ],
              )),
        ));
  }

  Widget title(media, titleCat) {
    return Container(
      alignment: Alignment.centerLeft,
      width: media.width,
      height: media.height * 0.06,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: media.width * 0.1,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("landing");
                },
                icon: const Icon(Icons.arrow_back_ios)),
          ),
          TextWidget(
              text: titleCat,
              font: "PoppinsBold",
              size: 20,
              color: negroColor,
              textalign: TextAlign.center,
              textDecoration: TextDecoration.none),
          const SpaceHor(widthSpace: 10)
        ],
      ),
    );
  }

  Widget catImage(media, String urlImage, String tag) {
    return Hero(
      tag: tag,
      child: FadeInImage(
        width: media.width * 0.7,
        height: media.width * 0.7,
        image: NetworkImage(
          urlImage,
        ),
        placeholder: const AssetImage("assets/images/placeholder.jpg"),
        imageErrorBuilder: (context, error, stackTrace) {
          return Image.asset(
            "assets/images/noImage.jpg",
            width: media.width * 0.7,
            height: media.width * 0.7,
          );
        },
        fit: BoxFit.cover,
      ),
    );
  }

  Widget description(media) {
    final catProvider = Provider.of<CatProvider>(context, listen: true);
    return Flexible(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Wrap(children: [
                TextWidget(
                    text: "imperial: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.imperial,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "metric: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.metric,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "id: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.id,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "name: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.name,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "cfaUrl: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.cfaUrl,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "vetstreetUrl: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.vetstreetUrl,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "vcahospitalsUrl: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.vcahospitalsUrl,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "temperament: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.temperament,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "origin: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.origin,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "countryCodes: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.countryCodes,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "countryCode: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.countryCode,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "description: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.description,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "lifeSpan: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.lifeSpan,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "indoor: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.indoor.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "lap: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.lap.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "altNames: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.altNames,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "adaptability: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.adaptability.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "affectionLevel: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.affectionLevel.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "childFriendly: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.childFriendly.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "dogFriendly: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.dogFriendly.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "energyLevel: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.energyLevel.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "grooming: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.grooming.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "healthIssues: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.healthIssues.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "intelligence: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.intelligence.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "sheddingLevel: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.sheddingLevel.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "socialNeeds: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.socialNeeds.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "strangerFriendly: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.strangerFriendly.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "vocalisation: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.vocalisation.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "experimental: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.experimental.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "hairless: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.hairless.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "natural: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.natural.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "rare: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.rare.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "rex: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.rex.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "suppressedTail: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.suppressedTail.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "shortLegs: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.shortLegs.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "wikipediaUrl: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.wikipediaUrl,
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "hypoallergenic: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.hypoallergenic.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "catFriendly: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.catFriendly.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
              Wrap(children: [
                TextWidget(
                    text: "bidability: ",
                    font: "PoppinsBold",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.left,
                    textDecoration: TextDecoration.none),
                TextWidget(
                    text: catProvider.bidability.toString(),
                    font: "Poppins",
                    size: 16,
                    color: negroColor,
                    textalign: TextAlign.justify,
                    textDecoration: TextDecoration.none)
              ]),
              const SpaceVer(heightSpace: 2),
            ],
          ),
        ),
      ),
    );
  }
}
