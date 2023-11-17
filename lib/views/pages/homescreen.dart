import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_buddy/models/articles_model.dart';
import 'package:news_buddy/services/api_services.dart';
import 'package:news_buddy/views/pages/detailsscreen.dart';

import 'package:news_buddy/views/widgets/newscard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ApiService service = ApiService();
  BbcApi bbc = BbcApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Center(
          child: Text(
            "NEWS BUDDY",
            style: GoogleFonts.anton(
                color: Colors.black, fontSize: 25, letterSpacing: 2),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'BBC Top',
              style:
                  GoogleFonts.arimo(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .25,
            child: FutureBuilder<List<Articles>>(
              future: bbc.getBbcArticles(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const SpinKitFadingCube(
                    color: Colors.blue,
                  );
                } else {
                  List<Articles>? bbcarticles = snapshot.data;
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: bbcarticles!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                DetailsScreen(articles: bbcarticles[index]),
                          ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * .2,
                                width: MediaQuery.of(context).size.width * .8,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    image: DecorationImage(
                                        image: bbcarticles[index].urlToImage !=
                                                null
                                            ? NetworkImage(
                                                bbcarticles[index].urlToImage!)
                                            : const AssetImage(
                                                    'assets/images/error.jpg')
                                                as ImageProvider,
                                        fit: BoxFit.fill)),
                                child: Stack(
                                  children: [
                                    Positioned(
                                      left: 15,
                                      bottom: 10,
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                .1,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .7,
                                        decoration: const BoxDecoration(
                                            color: Color.fromARGB(
                                                255, 185, 185, 185),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20))),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, left: 10),
                                          child: Text(bbcarticles[index].title!,
                                              style: GoogleFonts.nunito(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child:
                                        Text(bbcarticles[index].source!.name!),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Top Headlines',
              style:
                  GoogleFonts.arimo(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: FutureBuilder<List<Articles>>(
              future: service.getArticle(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: SpinKitFadingCube(
                      color: Colors.blue,
                    ),
                  );
                } else {
                  List<Articles>? articles = snapshot.data;

                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: articles!.length,
                    itemBuilder: (context, index) {
                      return NewsCard(
                        size: 20,
                        articles: articles[index],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
