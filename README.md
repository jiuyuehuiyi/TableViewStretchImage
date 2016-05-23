# TableViewStretchImage
 iOS UITableView拉伸图片,悬停控件和渐变导航栏效果

### 一、实现效果:
- 1.表单下拉放大顶部图片,弹簧效果
- 2.表单上拉逐渐显示导航栏
- 3.悬停视图停止在导航栏底部

---

### 二、效果图
![运行效果图](http://img.blog.csdn.net/20160520170614974)

---

### 三.建立工程实现
- **建立视图**
- 1.新建工程
- 2.移除原控制器,拖入一个`NavigationController` ,并勾上`Is Initial View Controller`
- 3.拖入一个`ViewController`,绑定class为`ViewController`,并从`NavigationController` 上拖线到`ViewController`选择`Show`
- 4.向`ViewController`中拖入一个`TableView`,约束四边距离`View`都为0
- 5.向`ViewController`中拖入一个`View`(注意父视图为控制器的`View`),命名为`HeaderView`,约束距离上,左,右为0,高度为200
- 6.向`ViewController`中拖入一个`View`(注意父视图为控制器的`View`),命名为,命名为`SuspensionView`, 约束上方距离`HeadView`为0, 左右距离父视图为0, 高度为44.
- 7.向`SuspensionView`中拖入2个按钮,命名为`SelectBtn1`和`SelectBtn2`,设置约束为2个按钮等宽等高并水平居中,按钮间距为20, 左边按钮距离父视图左边距为20,右边按钮距离父视图右边距为20
- 8.向`HeadView`中拖入一个`imageView`,命名为`backImage`,约束为四边距离父视图为0, 并设置image为资源文件中的图片,设置图片的填充Mode为`Aspect Fill`, 勾上`Clip Subviews`
- 9.再向`HeadView`中拖入一个`imageView`,命名为`userIcon`,约束为距离父视图下边距为64,高度和宽度为100,竖直居中.并设置`image`
- 10.最终`Main.storyboard`层级如下图:
![storyboard层级图](http://img.blog.csdn.net/20160520171411353)
