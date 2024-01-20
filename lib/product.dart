import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'API/api.dart';

class product extends StatefulWidget {
  @override
  _product createState() => _product();
}

class _product extends State<product> {
  late Future<List<ApiCall>> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = Api().getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
        top: 0,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/background2.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      Center(
        child: FutureBuilder<List<ApiCall>>(
          future: _dataFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final apiCall = data[index];
                  return Card(
                    elevation: 2, // เพิ่มเงาให้กับการ์ด
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          8), // ปรับรูปร่างของการ์ดให้มีมุมโค้ง
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8), // ปรับขอบเขตของเนื้อหาในการ์ด
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            8), // ปรับรูปร่างของรูปภาพให้มีมุมโค้ง
                        child: Image.network(
                          apiCall.img,
                          width: 60,
                          height: 60,
                          fit: BoxFit.cover, // ปรับขนาดรูปภาพให้พอดีกับกล่อง
                        ),
                      ),
                      title: Text(
                        apiCall.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        apiCall.price,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      trailing: Icon(
                        Icons.arrow_forward,
                        color: Colors.blue,
                      ),
                      onTap: () {
                        // ตัวอย่างการจัดการการคลิกที่รายการสินค้า
                        // สามารถปรับแต่งตามความต้องการ
                        print('You tapped on ${apiCall.name}');
                      },
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    ]));
  }
}
