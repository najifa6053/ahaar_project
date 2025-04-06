import 'package:ahaar_project/common/color_extension.dart';
import 'package:ahaar_project/common_widget/tab_button.dart';
import 'package:ahaar_project/view/home/home_view.dart';
import 'package:flutter/material.dart';

class MainTabview extends StatefulWidget {
  const MainTabview({super.key});

  @override
  State<MainTabview> createState() => _MainTabviewState();
}

class _MainTabviewState extends State<MainTabview> {
  int selectTab = 2;
  PageStorageBucket storageBucket = PageStorageBucket();
  Widget selectedPageView = const HomeView();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: storageBucket, child: selectedPageView
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: () {
            if (selectTab != 2) {
              setState(() {
                selectTab = 2;
                selectedPageView = const HomeView();
              });
            }
            if(mounted){
              setState(() {
                
              });
            }
          },
          shape: const CircleBorder(),
          backgroundColor: selectTab == 2 ? TColor.primary : TColor.placeholder,
          child: Image.asset(
            "assets/image/tab_home.png", 
            width: 30, 
            height: 30
            ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        
        surfaceTintColor: TColor.white,
        shadowColor: Colors.black,
        elevation: 1,
        notchMargin: 12,
        height: 64,
        shape: const CircularNotchedRectangle(),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                TabButton(title: "Menu", 
                icon: "assets/image/tab_menu.png", 
                onTap: (){
                  if (selectTab != 0) {
                      selectTab = 0;
                      selectedPageView = Container();
                    
                  }
                  if(mounted){
                    setState(() {
                      
                    });
                  }
                }, isSelected: selectTab == 0),
          
                TabButton(title: "Offer", 
                icon: "assets/image/tab_offer.png", 
                onTap: (){
                  if (selectTab != 1) {
                      selectTab = 1;
                      selectedPageView = Container();
                    
                  }
                  if(mounted){
                    setState(() {
                      
                    });
                  }
                }, isSelected: selectTab == 1),
          
                const SizedBox(width: 40, height: 40),
          
                TabButton(title: "Profile",
                icon: "assets/image/tab_profile.png",  
                onTap: (){
                  if (selectTab != 3) {
                      selectTab = 3;
                      selectedPageView = Container();
                    
                  }
                  if(mounted){
                    setState(() {
                      
                    });
                  }
                }, isSelected: selectTab == 3),
          
                TabButton(title: "More", 
                icon: "assets/image/tab_more.png", 
                onTap: (){
                  if (selectTab != 4) {
                      selectTab = 4;
                      selectedPageView = Container();
                    
                  }
                  if(mounted){
                    setState(() {
                      
                    });
                  }
                }, isSelected: selectTab == 4),
            ],
          ),
        ),
      ),
    );
  }
}
