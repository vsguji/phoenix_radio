import 'package:flutter/material.dart';
import 'package:phoenix_card/phoenix_card.dart';
import 'package:phoenix_radio/phoenix_radio.dart' as phoenix;

class RadioExample extends StatefulWidget {
  @override
  _RadioExampleState createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  /// 单选选中的index
  int _singleSelectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('单选示例'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              '规则',
              style: TextStyle(
                  color: Color(0xFF222222),
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const BubbleText(maxLines: 2, text: '具备选中、未选中、以及禁用状态,支持设置左右widget'),
            const Text(
              '正常案例：单选，控件在选择按钮右边',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                const SizedBox(
                  width: 5,
                ),
                const Text("选项："),
                phoenix.RadioButton(
                  radioIndex: 0,
                  isSelected: _singleSelectedIndex == 0,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "选项A",
                    ),
                  ),
                  onValueChangedAtIndex: (index, value) {
                    setState(() {
                      _singleSelectedIndex = index;
                      // BrnToast.show("单选，选中第$index个", context);
                    });
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                phoenix.RadioButton(
                  radioIndex: 1,
                  isSelected: _singleSelectedIndex == 1,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "选项B",
                    ),
                  ),
                  onValueChangedAtIndex: (index, value) {
                    setState(() {
                      _singleSelectedIndex = index;
                      // BrnToast.show("单选，选中第$index个", context);
                    });
                  },
                ),
                const SizedBox(
                  width: 20,
                ),
                phoenix.RadioButton(
                  radioIndex: 1,
                  disable: true,
                  isSelected: _singleSelectedIndex == 1,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Text(
                      "选项C",
                    ),
                  ),
                  onValueChangedAtIndex: (index, value) {
                    setState(() {
                      _singleSelectedIndex = index;
                      // BrnToast.show("单选，选中第$index个", context);
                    });
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              '单选，未选中，禁用',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            phoenix.RadioButton(
              disable: true,
              radioIndex: 0,
              onValueChangedAtIndex: (index, value) {},
            ),
            const Text(
              '单选,已选中，禁用',
              style: TextStyle(
                color: Color(0xFF222222),
                fontSize: 28,
              ),
            ),
            phoenix.RadioButton(
              disable: true,
              radioIndex: 0,
              isSelected: true,
              onValueChangedAtIndex: (index, value) {},
            ),
          ],
        ),
      ),
    );
  }
}
