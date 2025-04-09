import 'package:ahaar_project/common/color_extension.dart';
import 'package:ahaar_project/common_widget/category_cell.dart';
import 'package:ahaar_project/common_widget/most_popular_cell.dart';
import 'package:ahaar_project/common_widget/popular_resutaurant_row.dart';
import 'package:ahaar_project/common_widget/recent_item_row.dart';
import 'package:ahaar_project/common_widget/round_textfiled.dart';
import 'package:ahaar_project/common_widget/view_all_title_row.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  TextEditingController txrSearch = TextEditingController();

  List catArr = [
    {"image": "assets/image/cat_offer.png", "name": "Offers"},
    {"image": "assets/image/cat_sri.png", "name": "Sri Lankan"},
    {"image": "assets/image/cat_3.png", "name": "Italian"},
    {"image": "assets/image/cat_4.png", "name": "Indian"},
  ];

  List popArr = [
    {
      "image": "assets/image/res_1.png",
      "name": "Mingalar Restaurant",
      "rate": "4.5",
      "rating": "100+",
      "type": "Chinese",
      "food_type": "Chinese",
    },
    {
      "image": "assets/image/res_2.png",
      "name": "Cafe De Flore",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food",
    },
    {
      "image": "assets/image/res_3.png",
      "name": "Burger King",
      "rate": "4.8",
      "rating": "155",
      "type": "Restaurant",
      "food_type": "Fast Food",
    },
  ];

  List mostPopArr = [
    {
      "image": "assets/image/m_res_1.png",
      "name": "Mingalar Restaurant",
      "rate": "4.5",
      "rating": "100+",
      "type": "Chinese",
      "food_type": "Chinese",
    },
    {
      "image": "assets/image/m_res_2.png",
      "name": "Cafe De Flore",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food",
    },
  ];

  List recentArr = [
    {
      "image": "assets/image/item_1.png",
      "name": "Mingalar Restaurant",
      "rate": "4.5",
      "rating": "100+",
      "type": "Chinese",
      "food_type": "Chinese",
    },
    {
      "image": "assets/image/item_2.png",
      "name": "Cafe De Flore",
      "rate": "4.9",
      "rating": "124",
      "type": "Cafe",
      "food_type": "Western Food",
    },
    {
      "image": "assets/image/item_3.png",
      "name": "Burger King",
      "rate": "4.8",
      "rating": "155",
      "type": "Restaurant",
      "food_type": "Fast Food",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 46),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Good Morning User!",
                      style: TextStyle(
                        color: TColor.primaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/image/shopping_cart.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivering to",
                      style: TextStyle(
                        color: TColor.secondaryText,
                        fontSize: 11,
                      ),
                    ),
                    const SizedBox(height: 6),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Current Location",
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        const SizedBox(width: 25),

                        Image.asset(
                          "assets/image/dropdown.png",
                          width: 12,
                          height: 12,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfiled(
                  hintText: "Search Food",
                  controller: txrSearch,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: Image.asset(
                      "assets/image/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),

              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: catArr.length,
                  itemBuilder: (context, index) {
                    var cObj = catArr[index] as Map? ?? {};
                    return CategoryCell(cObj: cObj, onTap: () {});
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Popular Restaurants",
                  onView: () {},
                ),
              ),

              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: popArr.length,
                itemBuilder: (context, index) {
                  var pObj = popArr[index] as Map? ?? {};
                  return PopularResutaurantRow(
                    pObj: pObj, onTap: () {});
                },
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(title: "Most Popular", onView: () {}),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  itemCount: mostPopArr.length,
                  itemBuilder: (context, index) {
                    var mObj = mostPopArr[index] as Map? ?? {};
                    return MostPopularCell(mObj: mObj, onTap: () {});
                  },
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(title: "Recent Items", onView: () {}),
              ),

              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: recentArr.length,
                itemBuilder: (context, index) {
                  var rObj = recentArr[index] as Map? ?? {};
                  return RecentItemRow(rObj: rObj, onTap: () {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
