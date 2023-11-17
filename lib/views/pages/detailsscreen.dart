import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_buddy/models/articles_model.dart';

class DetailsScreen extends StatelessWidget {
  DetailsScreen({super.key, required this.articles});
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 233, 233, 233),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: height * .5,
                  width: width,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        )
                      ],
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50)),
                      image: DecorationImage(
                          image: articles.urlToImage != null
                              ? NetworkImage(articles.urlToImage!)
                              : const AssetImage('assets/images/error.jpg')
                                  as ImageProvider,
                          fit: BoxFit.fill)),
                ),
                Positioned(
                  top: 60,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: width * .1,
                      height: width * .1,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 210, 210, 210),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                articles.title!,
                style: GoogleFonts.poppins(
                    fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                '- ${articles.author}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Description',
                  style: GoogleFonts.merriweather(
                      fontSize: 23, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 15),
              child: articles.description != null
                  ? Text(articles.description!,
                      style: GoogleFonts.nunitoSans(
                          fontSize: 22, fontWeight: FontWeight.w400))
                  : Text('404 Error Content Not Found',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 22, fontWeight: FontWeight.w400)),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Content',
                  style: GoogleFonts.merriweather(
                      fontSize: 23, fontWeight: FontWeight.w600)),
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 15),
              child: articles.content != null
                  ? Text(articles.content!,
                      style: GoogleFonts.nunitoSans(
                          fontSize: 22, fontWeight: FontWeight.w400))
                  : Text('Content Not Found',
                      style: GoogleFonts.nunitoSans(
                          fontSize: 22, fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      ),
    );
  }
}
