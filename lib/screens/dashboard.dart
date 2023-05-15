import "package:flutter/material.dart";
import "package:todo_app_2/palette/palette.dart";

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  static double referencia = 30;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight((referencia * 2) + 10),
          child: AppBarHome(referencia: referencia),
        ),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
                child: TopSliver(referencia: referencia)),
            
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: MySliverHorizontalDates()
              ),
        
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                
                return Container(
                  height: 150,
                  color: Colors.red,
                  child: const FittedBox(
                    child: Text("data"),
                  ),
                );
                
        
              } ,
              childCount: 50000000,
              )
              )
          ],
        ),
      ),
    );
  }
}

class MySliverHorizontalDates extends SliverPersistentHeaderDelegate{
  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: PALETTE.white,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Container(
            width: 100,
            color: PALETTE.white,
            child: Text("data"),
          );
        },
      ),
    );
  }


  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

class TopSliver extends StatelessWidget {
  const TopSliver({
    super.key,
    required this.referencia,
  });

  final double referencia;

  @override
  Widget build(BuildContext context) {
    return Container(
              padding: EdgeInsets.symmetric(horizontal: referencia / 2),
              height: referencia * 8,
              child: Column(
    children: [
      SizedBox(
        height: referencia,
      ),
      Container(
        alignment: Alignment.centerLeft,
        height: referencia + 10,
        child: Text(
          "Projects",
          style: TextStyle(
            color: Colors.black,
            fontSize: referencia,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      SizedBox(height: referencia / 2),
      Container(
        height: referencia * 4 + 10,
        alignment: Alignment.center,
        child: SizedBox(
            height: referencia * 4,
            child: ListView.builder(
                itemCount: items.length * 2 - 1,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final actualIndex = index ~/ 2;

                  // Check if the current index is even or odd to determine if it's an item or a separator
                  if (index.isEven) {
                    final item = items[actualIndex];
                    return Container(
                    padding: const EdgeInsets.all(5.0),
                    width: referencia * 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: PALETTE.lightSkin,
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(15),
                        splashColor: PALETTE.white.withOpacity(0.4),
                        child: Column(
                            //Falta codigo de proyecto
                            ),
                      ),
                    ),
                  );
                  } else {
                    // Render the separator widget
                    return SizedBox(width: referencia/2);
                  }
                  
                })),
      )
    ],
              ),
            );
  }
}

List<String> items = [
  'Item 1',
  'Item 2',
  'Item 3',
  'Item 4',
  'Item 5',
];
class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
    required this.referencia,
  });

  final double referencia;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: referencia / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: (referencia * 2) + 5,
            child: Text(
              "TODO",
              style: TextStyle(
                color: Colors.black,
                fontSize: referencia * 2,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: PALETTE.primaryPurple,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(15),
                splashColor: PALETTE.white.withOpacity(0.4),
                child: SizedBox(
                  height: referencia * 2,
                  width: 150,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 5.0),
                        child: Icon(
                          Icons.add,
                          color: PALETTE.white,
                          size: 40,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          "Task",
                          style: TextStyle(
                              color: PALETTE.white,
                              fontSize: referencia,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
