/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2022-06-22 16:22:35
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-10-12 22:53:40
 * @FilePath: /phoenix_radio/example/lib/checkbox_example.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:phoenix_radio/phoenix_radio.dart' as phoenix;

class CheckboxExample extends StatefulWidget {
  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('多选示例'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '正常案例：多选，控件在选择按钮左边',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "选项：",
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 130,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return phoenix.Checkbox(
                    radioIndex: index,
                    disable: index == 2,
                    childOnRight: false,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        "选项$index",
                      ),
                    ),
                    onValueChangedAtIndex: (index, value) {
                      if (value) {
                        // BrnToast.show("第$index项被选中", context);
                      } else {
                        // BrnToast.show("第$index项取消选中", context);
                      }
                    },
                  );
                },
              ),
            ),
            const Text(
              '正常案例：多选, 居于屏幕两侧',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            phoenix.Checkbox(
              radioIndex: 10,
              isSelected: true,
              childOnRight: true,
              mainAxisSize: MainAxisSize.max,
              child: Container(
                  width: 100,
                  height: 20,
                  color: Colors.lightBlue,
                  child: const Center(
                      child: Text('自定义视图',
                          style: TextStyle(color: Colors.white)))),
              onValueChangedAtIndex: (index, value) {
                if (value) {
                  // BrnToast.show("第$index项被选中", context);
                } else {
                  // BrnToast.show("第$index项取消选中", context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
