import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_buddy/models/articles_model.dart';
import 'package:news_buddy/views/detailsscreen.dart';

class NewsCard extends StatelessWidget {
  final Articles articles;
  double? size;
  NewsCard({super.key, required this.articles, required this.size});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsScreen(articles: articles),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 224, 224, 224)),
                height: 250,
                width: MediaQuery.of(context).size.width,
              ),
              articles.urlToImage != null
                  ? Image.network(
                      articles.urlToImage!,
                      fit: BoxFit.cover,
                      height: 180,
                      width: MediaQuery.of(context).size.width,
                    )
                  : Image.asset('assets/images/error.jpg'),
              Positioned(
                  top: 10,
                  left: 20,
                  child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 67, 99, 238),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          articles.source!.name!,
                          style: GoogleFonts.oswald(color: Colors.white),
                        ),
                      ))),
              Positioned(
                  bottom: size,
                  left: 20,
                  right: 20,
                  child: Text(
                    articles.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.nunito(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  )),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
