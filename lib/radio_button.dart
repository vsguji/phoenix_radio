/*
 * @Author: lipeng 1162423147@qq.com
 * @Date: 2023-02-01 17:46:29
 * @LastEditors: lipeng 1162423147@qq.com
 * @LastEditTime: 2023-09-22 12:59:52
 * @FilePath: /phoenix_radio/lib/brn_radio_button.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';
import 'package:phoenix_base/phoenix.dart';

import 'radio_core.dart';

///单选按钮
class RadioButton extends StatelessWidget {
  /// 标识当前Radio的Index
  final int radioIndex;

  /// value 选项发生变化产生的回调
  /// int 选项的index
  /// bool 选项的选中状态，true表示选中，false未选中
  final void Function(int, bool) onValueChangedAtIndex;

  /// 初始值，是否被选择
  /// 默认false
  final bool isSelected;

  /// 是否禁用当前选项
  /// 默认false
  final bool disable;

  /// 选择按钮的padding
  /// 默认EdgeInsets.all(5)
  final EdgeInsets? iconPadding;

  /// 配合使用的控件，比如卡片或者text
  final Widget? child;

  /// 控件是否在选择按钮的右边，
  /// true时 控件在选择按钮右边
  /// false时 控件在选择按钮的左边
  /// 默认true
  final bool childOnRight;

  /// 控件和选择按钮在row布局里面的alignment
  /// 默认值MainAxisAlignment.start
  final MainAxisAlignment mainAxisAlignment;

  /// 控件和选择按钮在row布局里面的crossAxisAlignment
  /// 默认值CrossAxisAlignment.center
  final CrossAxisAlignment crossAxisAlignment;

  /// 控件和选择按钮在row布局里面的mainAxisSize
  /// 默认值MainAxisSize.min
  final MainAxisSize mainAxisSize;

  /// 默认值HitTestBehavior.translucent控制widget.onRadioItemClick触发的点击范围
  final HitTestBehavior behavior;

  const RadioButton(
      {Key? key,
      required this.radioIndex,
      required this.onValueChangedAtIndex,
      this.disable = false,
      this.isSelected = false,
      this.iconPadding,
      this.child,
      this.childOnRight = true,
      this.mainAxisAlignment = MainAxisAlignment.start,
      this.crossAxisAlignment = CrossAxisAlignment.center,
      this.mainAxisSize = MainAxisSize.min,
      this.behavior = HitTestBehavior.translucent});

  @override
  Widget build(BuildContext context) {
    return RadioCore(
      radioIndex: radioIndex,
      disable: disable,
      isSelected: isSelected,
      iconPadding: iconPadding,
      childOnRight: childOnRight,
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: mainAxisSize,
      selectedImage: BrunoTools.getAssetImageWithBandColor(
          BaseAsset.iconRadioSingleSelected),
      unselectedImage: BrunoTools.getAssetImage(BaseAsset.iconRadioUnSelected),
      disSelectedImage:
          BrunoTools.getAssetImage(BaseAsset.iconRadioDisableMultiSelected),
      disUnselectedImage:
          BrunoTools.getAssetImage(BaseAsset.iconRadioDisableUnselected),
      onRadioItemClick: () {
        onValueChangedAtIndex(radioIndex, true);
      },
      behavior: behavior,
      child: child,
    );
  }
}
