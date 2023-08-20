import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

var listImage = [
    Image.network(
      "https://i2.wp.com/blog.tripcetera.com/id/wp-content/uploads/2020/10/Danau-Toba-edited.jpg"
    ),
    Image.network(
      "https://i.pinimg.com/550x/d6/24/94/d62494ca8761cfc10ae0030c5b0c41b6.jpg"
    ),
    Image.network(
      "https://e1.pxfuel.com/desktop-wallpaper/149/169/desktop-wallpaper-lanskap-pantai-pantai-android.jpg"
    ),
    Image.network(
      "https://images.unsplash.com/photo-1596423735880-5f2a689b903e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGFudGFpfGVufDB8fDB8fHww&w=1000&q=80"
    ),
    Image.network(
      "https://qph.cf2.quoracdn.net/main-qimg-354a79b913b8c5f877ab52fc96efddbe-lq"
    )

  ];

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
  padding: const EdgeInsets.all(15.0),
  child: Column(
    children: [
      CarouselSlider(
        items: listImage,
        options: CarouselOptions(
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          enlargeCenterPage: true,
        ),
      ),
      const SizedBox(
        height: 30,
      ),
      const Text(
        "CLinterest: Your Creative Inspiration Hub\n\nWelcome to CLinterest, where creativity meets inspiration! We're more than just a business; we're a platform designed to spark your imagination and fuel your creative passions. Discover a world of ideas, trends, and artistic expressions tailored to your unique interests.\n\nAt CLinterest, we believe that everyone has a creative side waiting to be awakened. Whether you're an aspiring artist, a design enthusiast, or simply looking for fresh ideas, our curated collection of content will ignite your imagination. From captivating visuals to thought-provoking concepts, we're here to elevate your creative journey.\n\nJoin our vibrant community of like-minded individuals who share a passion for all things creative. Explore an ever-growing array of categories, from art and design to fashion and DIY. Our intuitive interface makes it easy to find, save, and share the ideas that resonate with you, turning inspiration into reality.\n\nUnleash your imagination with CLinterest – where creativity knows no bounds. Your next masterpiece, project, or design concept is just a click away. Elevate your inspiration, embrace your uniqueness, and let your creative journey thrive with CLinterest.",
        style: TextStyle(fontSize: 16),
      ),
    ],
  ),
);

  }
}