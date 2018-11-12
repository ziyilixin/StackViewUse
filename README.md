# StackViewUse
StackView使用

屏幕截图
![]()
![]()
![]()
![]()

## axis
```objc
/**
typedef NS_ENUM(NSInteger, UILayoutConstraintAxis) {
     UILayoutConstraintAxisHorizontal = 0,//水平
     UILayoutConstraintAxisVertical = 1//垂直
};
*/
//子控件的布局方向
self.stackView.axis = UILayoutConstraintAxisHorizontal;
```

## distribution
```objc
/**
typedef NS_ENUM(NSInteger, UIStackViewDistribution) {
     UIStackViewDistributionFill = 0,
     UIStackViewDistributionFillEqually,
     UIStackViewDistributionFillProportionally,
     UIStackViewDistributionEqualSpacing,
     UIStackViewDistributionEqualCentering,
};
*/
self.stackView.distribution = UIStackViewDistributionFillEqually;
```

## spacing
```objc
//子控件之间的最小间距
self.stackView.spacing = 3;
```

## alignment
```objc
/**
typedef NS_ENUM(NSInteger, UIStackViewAlignment) {
     UIStackViewAlignmentFill,
     UIStackViewAlignmentLeading,
     UIStackViewAlignmentTop = UIStackViewAlignmentLeading,
     UIStackViewAlignmentFirstBaseline, // Valid for horizontal axis only
     UIStackViewAlignmentCenter,
     UIStackViewAlignmentTrailing,
     UIStackViewAlignmentBottom = UIStackViewAlignmentTrailing,
     UIStackViewAlignmentLastBaseline, // Valid for horizontal axis only
};
*/
self.stackView.alignment = UIStackViewAlignmentFill;
```

## subView
```objc
/**
 addArrangedSubview 添加子视图
 removeArrangedSubview 删除子视图
 insertArrangedSubview: atIndex: 根据下标插入子视图
 */
```
