import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:fl_chart/fl_chart.dart';
import 'package:myapp/utils.dart';
import 'package:myapp/page-1/TrangChuNew.dart';

class ThongKeDoanhThu extends StatefulWidget {
  const ThongKeDoanhThu({Key? key}) : super(key: key);

  @override
  State<ThongKeDoanhThu> createState() => _ThongKeDoanhThuState();
}

class _ThongKeDoanhThuState extends State<ThongKeDoanhThu> {
  List<String> fieldValues = [];
  double fieldSum = 0;
  int cartCount = 0;

  @override
  void initState() {
    super.initState();
    loadFieldValues();
  }

  Future<int> loadCategoryValues() async {
    var collectionRef = FirebaseFirestore.instance.collection('Bill');
    var querySnapshot = await collectionRef.get();
    cartCount = querySnapshot.size;
    return cartCount;
  }

  void loadFieldValues() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Bill').get();

    List<String> values = querySnapshot.docs
        .map((doc) => (doc.data() as Map<String, dynamic>)['tongHoaDon']?.toString() ?? '')
        .toList();

    setState(() {
      fieldValues = values;
      fieldSum = calculateFieldSum();
    });
  }

  double calculateFieldSum() {
    double sum = fieldValues
        .map((value) => double.tryParse(value) ?? 0)
        .fold(0, (total, value) => total + value);
    return sum;
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Container(
              padding: EdgeInsets.fromLTRB(6 * fem, 16 * fem, 6 * fem, 52 * fem),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/page-1/images/hinhnen1-bg.png'),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10 * fem, 0 * fem, 13 * fem, 53 * fem),
                    width: double.infinity,
                    height: 143 * fem,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 114 * fem,
                          top: 16 * fem,
                          child: Align(
                            child: SizedBox(
                              height: 100 * fem,
                              child: Image.asset(
                                'assets/page-1/images/logomau.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 3 * fem,
                          top: 114 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 322 * fem,
                              height: 29 * fem,
                              child: Text(
                                'Thưởng thức vị ngon trọn vẹn',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Dancing Script',
                                  fontSize: 13 * ffem,
                                  fontWeight: FontWeight.bold,
                                  height: 1.2 * ffem / fem,
                                  letterSpacing: 1 * fem,
                                  color: Color(0xff993300),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 0 * fem,
                          top: 0 * fem,
                          child: Align(
                            child: SizedBox(
                              width: 32 * fem,
                              height: 32 * fem,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const TrangChuNew()));
                                },
                                child: Image.asset(
                                  'assets/page-1/images/vector.png',
                                  width: 32 * fem,
                                  height: 32 * fem,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(14 * fem, 0 * fem, 0 * fem, 1 * fem),
                    child: Text(
                      'Tổng hóa đơn đã xuất:',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * ffem / fem,
                        letterSpacing: 1 * fem,
                        color: Color(0xff007373),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(14 * fem, 0 * fem, 30 * fem, 24 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 110 * fem, 0 * fem),
                          child: FutureBuilder<int>(
                            future: loadCategoryValues(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  '${snapshot.data}',
                                  style: TextStyle(
                                    fontFamily: 'Quicksand',
                                    fontSize: 14 * ffem,
                                    fontWeight: FontWeight.w700,
                                    height: 1.25 * ffem / fem,
                                    letterSpacing: 1 * fem,
                                    color: Color(0xff993300),
                                  ),
                                );
                              } else {
                                return CircularProgressIndicator();
                              }
                            },
                          ),
                        ),
                        Text(
                          'hóa đơn',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.25 * ffem / fem,
                            letterSpacing: 1 * fem,
                            color: Color(0xff007373),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(14 * fem, 0 * fem, 0 * fem, 4 * fem),
                    child: Text(
                      'Doanh thu đạt được:',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * ffem / fem,
                        letterSpacing: 1 * fem,
                        color: Color(0xff007373),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(14 * fem, 0 * fem, 57 * fem, 21 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 58 * fem, 0 * fem),
                          child: Text(
                            '${fieldSum}',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.25 * ffem / fem,
                              letterSpacing: 1 * fem,
                              color: Color(0xff993300),
                            ),
                          ),
                        ),
                        Text(
                          'VND',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.25 * ffem / fem,
                            letterSpacing: 1 * fem,
                            color: Color(0xff007373),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(14 * fem, 0 * fem, 0 * fem, 7 * fem),
                    child: Text(
                      'Thuế phải trả:',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * ffem / fem,
                        letterSpacing: 1 * fem,
                        color: Color(0xff007373),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(14 * fem, 0 * fem, 57 * fem, 18 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 79 * fem, 0 * fem),
                          child: Text(
                            '${fieldSum * 0.1}',
                            style: TextStyle(
                              fontFamily: 'Quicksand',
                              fontSize: 12 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.25 * ffem / fem,
                              letterSpacing: 1 * fem,
                              color: Color(0xffff0000),
                            ),
                          ),
                        ),
                        Text(
                          'VND',
                          style: TextStyle(
                            fontFamily: 'Quicksand',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w400,
                            height: 1.25 * ffem / fem,
                            letterSpacing: 1 * fem,
                            color: Color(0xff007373),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(14 * fem, 0 * fem, 0 * fem, 7 * fem),
                    constraints: BoxConstraints(
                      maxWidth: 223 * fem,
                    ),
                    child: Text(
                      'Biểu đồ doanh thu theo loại:',
                      style: TextStyle(
                        fontFamily: 'Quicksand',
                        fontSize: 14 * ffem,
                        fontWeight: FontWeight.w700,
                        height: 1.25 * ffem / fem,
                        letterSpacing: 1 * fem,
                        color: Color(0xff007373),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 9 * fem, 0 * fem),
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: PieChart2(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PieChart2 extends StatefulWidget {
  const PieChart2({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State<PieChart2> {
  int touchedIndex = -1;
  var color;

  Future<List<Map<String, dynamic>>> getCombinedData() async {
    try {
      Map<String, Map<String, dynamic>> combinedDataMap = {};
      Set<String> uniqueIdCates = Set<String>();

      QuerySnapshot billSnapshot =
          await FirebaseFirestore.instance.collection('Bill').get();
      List<DocumentSnapshot> billDocs = billSnapshot.docs;

      for (int index = 0; index < billDocs.length; index++) {
        Map<String, dynamic> billData =
            billDocs[index].data() as Map<String, dynamic>;

        QuerySnapshot productsSnapshot =
            await billDocs[index].reference.collection('products').get();
        List<DocumentSnapshot> productDocs = productsSnapshot.docs;

        for (int i = 0; i < productDocs.length; i++) {
          String idCate = productDocs[i]['idCate'];

          if (!uniqueIdCates.contains(idCate)) {
            uniqueIdCates.add(idCate);
            combinedDataMap[idCate] = {};
            combinedDataMap[idCate]?['thanhTien'] = 0;
          }

          double thanhTien = double.tryParse(productDocs[i]['thanhTien']?.toString() ?? '') ?? 0;
          combinedDataMap[idCate]?['thanhTien'] += thanhTien;
        }
      }

      await Future.forEach(combinedDataMap.keys, (idCate) async {
        DocumentSnapshot categorySnapshot = await FirebaseFirestore.instance
            .collection('Category')
            .doc(idCate)
            .get();
        Map<String, dynamic> categoryData =
            categorySnapshot.data() as Map<String, dynamic>;
        combinedDataMap[idCate]?['importantFieldValue'] = categoryData['Name'];
      });

      List<Map<String, dynamic>> combinedDataList =
          combinedDataMap.values.toList();

      return combinedDataList;
    } catch (e) {
      print('Error: $e');
      return [];
    }
  }

  List<Color> getColors() {
    return [
      Colors.black,
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: FutureBuilder(
                      future: getCombinedData(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Map<String, dynamic>>>
                          combinedDataSnapshot) {
                        if (combinedDataSnapshot.connectionState ==
                            ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }

                        if (combinedDataSnapshot.hasError) {
                          return Text('Error: ${combinedDataSnapshot.error}');
                        }

                        List<Map<String, dynamic>> combinedDataList =
                            combinedDataSnapshot.data ?? [];

                        return PieChart(
                          PieChartData(
                            pieTouchData: PieTouchData(
                              touchCallback:
                                  (FlTouchEvent event, pieTouchResponse) {
                                setState(() {
                                  if (!event.isInterestedForInteractions ||
                                      pieTouchResponse == null ||
                                      pieTouchResponse.touchedSection == null) {
                                    touchedIndex = -1;
                                    return;
                                  }
                                  touchedIndex = pieTouchResponse
                                      .touchedSection!.touchedSectionIndex;
                                });
                              },
                            ),
                            borderData: FlBorderData(
                              show: false,
                            ),
                            sectionsSpace: 0,
                            centerSpaceRadius: 40,
                            sections: showingSections(combinedDataList),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  // width: 28,
                ),
                Container(
                  width: 166,
                  child: FutureBuilder(
                    future: getCombinedData(),
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Map<String, dynamic>>>
                        combinedDataSnapshot) {
                      if (combinedDataSnapshot.connectionState ==
                          ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      }

                      if (combinedDataSnapshot.hasError) {
                        return Text('Error: ${combinedDataSnapshot.error}');
                      }

                      List<Map<String, dynamic>> combinedDataList =
                          combinedDataSnapshot.data ?? [];

                      return ListView.builder(
                        itemCount: combinedDataList.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> combinedData =
                          combinedDataList[index];

                          var importantFieldValue =
                          combinedData['importantFieldValue'];

                          color = getColors()[index % getColors().length];

                          return ListTile(
                            title: Row(
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: color,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  '$importantFieldValue',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontFamily: 'Quicksand',
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections(
      List<Map<String, dynamic>> combinedDataList) {
    int totalValues = combinedDataList.length;

    double sum = 0;

    for (int i = 0; i < combinedDataList.length; i++) {
      sum += combinedDataList[i]['thanhTien'] as double;
    }

    return List.generate(totalValues, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];

      double thanhTien = combinedDataList[i]['thanhTien'] as double;

      double sectionValue = (thanhTien / sum) * 100;

      return PieChartSectionData(
        color: getColors()[i % getColors().length],
        value: sectionValue,
        title: '${sectionValue.toStringAsFixed(2)}%',
        radius: radius,
        titleStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: shadows,
          decoration: TextDecoration.none,
          fontFamily: 'Quicksand',
        ),
      );
    });
  }
}

void main() {
  runApp(MaterialApp(
    home: ThongKeDoanhThu(),
  ));
}
