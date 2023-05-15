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
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight((referencia*2)+10),
          child: AppBarHome(referencia: referencia),
        ),
        body: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: referencia/2),
                height: referencia*8,
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
                    SizedBox(height: referencia/2),
                    Container(
                      height: referencia*4 + 10,
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: referencia*4,
                        child: ListView.builder(
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(5.0),
                              margin: EdgeInsets.only(right: referencia/2),
                              width: referencia*4,
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
                          }
                          )
                        ),
                    )
                  ],
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
    required this.referencia,
  });

  final double referencia;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: referencia/2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(
            height: (referencia*2) + 5,
            child: Text(
              "TODO",
              style: TextStyle(
                color: Colors.black,
                fontSize: referencia*2,
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
                  height: referencia*2,
                  width: 150,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:  [
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
