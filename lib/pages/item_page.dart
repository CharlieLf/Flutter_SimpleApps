import 'package:flutter/material.dart';
import 'package:flutterqualif/model/item_model.dart';
import 'package:flutterqualif/pages/detail_page.dart';

class ItemPage extends StatefulWidget {
  final String username;
  const ItemPage({Key? key, required this.username});

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  List<ItemModel> itemList = [
    ItemModel(
        image:
            "https://i2.wp.com/blog.tripcetera.com/id/wp-content/uploads/2020/10/pulau-padar.jpg",
        name: "Tranquil Beauty by the Lake",
        description:
            "Welcome to a serene realm where nature's charm meets tranquility. The picturesque Lake view mesmerizes with its reflective waters mirroring the azure sky, creating a soothing landscape. Amidst gentle ripples, the symphony of water and soft breezes whispers a calming melody. Whether at sunrise or sunset, the ever-changing hues paint a magical canvas. This lakeside haven offers solace, inviting us to pause, reconnect, and savor the serene allure of nature's masterpiece."),
    ItemModel(
        image:
            "https://asset.kompas.com/crops/nR39tfcICTpK9_0YEmnPWNY9JUM=/0x0:0x0/750x500/data/photo/2021/04/20/607e831ea0af3.jpg",
        name: "Shores of Serenity: Embrace the Beach",
        description:
            "Step into a world of endless horizons and soothing waves. The beach beckons with its golden sands and crystal-clear waters, a canvas of tranquility. Bask in the warmth of the sun as gentle tides kiss the shore. Seashells and treasures await discovery, while seabirds dance in the sky. Whether you seek adventure in the waves or solace in the sunset's embrace, the beach offers a haven of rejuvenation. Embrace the symphony of sea and sand, where every moment is a tide of serenity."),
    ItemModel(
        image:
            "https://cdn.idntimes.com/content-images/post/20221017/img-20221017-wa0005-bdd60d272a4f8cc7233a87e2822ee6ca.jpg",
        name: "Coastal Bliss: Embracing the Beachscape",
        description:
            "Indulge in the allure of the shoreline, where land and sea unite in perfect harmony. The beach unveils its treasures: soft sands underfoot, a tapestry of seashells, and the endless melody of waves. Dive into refreshing waters or simply relish the gentle lullaby of the ocean. As the sun dips below the horizon, the beach transforms into a canvas of vibrant hues. Here, time stands still, offering a sanctuary to unwind, connect, and find solace in the symphony of nature's beauty."),
    ItemModel(
        image:
            "https://asset-a.grid.id/crop/0x0:0x0/x/photo/2022/11/11/0e051d5e-7b2f-4f0a-a70f-d8b7da06-20221111120109.jpeg",
        name: "Seaside Serenity: Captivated by the Coastline",
        description:
            "Welcome to the captivating world of the coast, where the meeting of land and sea paints a breathtaking panorama. The beach invites you to sink your toes into warm sands, while the rhythmic waves compose a soothing melody. Seagulls glide through the salty breeze, as the sun's embrace creates a canvas of brilliant colors during sunset. With every crashing wave, a sense of tranquility washes over, inviting you to savor life's simplest pleasures amidst the coastal charm."),
    ItemModel(
        image:
            "https://upload.wikimedia.org/wikipedia/commons/e/e1/Pemandangan_Gunung_Bromo.jpg",
        name: "Majestic Heights: Embracing the Mountains",
        description:
            "Embark on a journey to the realm of mountains, where towering peaks touch the sky. The rugged beauty of these giants, cloaked in mist and mystery, beckons adventurers and dreamers alike. As you ascend, the air grows crisper, and panoramic vistas unfold before you. Each step unveils a tapestry of flora and fauna, while the quietude of altitude offers respite from the bustling world below. Whether you seek challenge or serenity, the mountains' embrace offers an escape to nature's grandeur."),
    ItemModel(
        image:
            "https://www.pegipegi.com/travel/wp-content/uploads/2020/08/rinjani.jpg",
        name: "Summit Tranquility: Embracing the Mountain Majesty",
        description:
            "Enter a world where mountains reach for the heavens, offering a sanctuary of awe and wonder. The grandeur of these peaks, cloaked in ancient tales, invites explorers and seekers to ascend their heights. As you ascend, the landscape transforms, revealing hidden valleys and jagged ridges. The crisp air carries a sense of stillness, inviting reflection amidst breathtaking vistas. Whether you're a thrill-seeker or a soul in search of solitude, the mountains' embrace grants solace and perspective amid their majestic beauty."),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(item: itemList[index], username: widget.username),
                  ),
                );
              },
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(
                      itemList[index].image,
                      fit: BoxFit.cover,
                      height: 120,
                      width: double.infinity,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        itemList[index].name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
