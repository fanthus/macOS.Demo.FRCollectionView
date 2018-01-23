# NSCollectionView 

[Collection Views in OS X Tutorial](https://www.raywenderlich.com/120494/collection-views-os-x-tutorial) 的 demo 实现

## CollectionView 元素

**布局类**

1. `NSCollectionViewLayout` 是布局类的抽象基类，让你通过设置 `collectionView` 的 `collectionViewLayout` 属性来布局。
2. `NSCollectionViewFlowLayout` 提供了一个灵活的类似 grid 的布局。

3. `NSCollectionViewGridLayout` 不支持 sections，和新 API。所以一般没人选这个吧..
    ![Jietu20180123-134632](http://p2ap0u22n.bkt.clouddn.com/Jietu20180123-134632.png)  

    从图上看的话你还可以在系统提供的 layout 类上进行继承实现自己的自定制类。

`Sections and NSIndexPath` 将 items 组合放入 section 内。每个 item 都可以由 indexPath 的 section 和 item 这两个整数组成。默认有一个 section. 这部分的概念和 iOS 上的 UICollectionView 还是挺像的。

**CollectionViewItem 类**

`The Model and the View` 来自 Model 数据类对象，每个 Model 都是一个小 itemView 的数据实体，itemView 展示 Model 的内容。一般小的 itemView 都是定义在一个单独的 nib 文件中。（跟我们之前做 iOS 的时候还是很像）
使用 collectionView 的注意事项：

1. 通过指定 itemView 和 itemview 的排列来定义可视化。
> Define the visual appearance of your items by specifying what views they contain and how those views are arranged.

2. 使用 itemView 之前必须先注册. 
> When your interface is first loaded, register your items with the collection view. (You must register your items before the collection view tries to display any content.)

3. 在数据源对象里，创建配置 items, 在 collectionView 需要的时候返回。 
> In your data source object, create and configure items when the collection view asks for them; see NSCollectionViewDataSource.


`The Controller` 一般都是一个 ViewController 来负责协调 itemView 视图类和 model 实体类。


## CollectionView 方法
1. 必要的数据源方法需要实现

    ```
    //具体的 items 
    - (NSInteger)collectionView:(NSCollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
    //具体 collectionViewItem 的配置
    - (NSCollectionViewItem *)collectionView:(NSCollectionView *)collectionView itemForRepresentedObjectAtIndexPath:(NSIndexPath *)indexPath 
    ```
2. 在尝试获取 NSCollectionViewItem 的时候一定要先注册！

    ```
    [self.collectionView registerClass:[FRCollectionViewItem class] forItemWithIdentifier:@"fr_item"];
    ....
    FRCollectionViewItem *item = [collectionView makeItemWithIdentifier:@"fr_item" forIndexPath:indexPath];
    ```


## CollectionView 坑

1. demo 里面  NSCollectionView 是从 StoryBoard 里拖出来的。我之前手写的 NSCollectionView 总是不行，即使是放到 NSScrollView 也不行。不确定是哪出的问题这点的设计跟 NSTableView 是一样的。我最开始还以为是 NSCollectionViewItem 继承有问题，在这儿徘徊了半天，最后发现是 NSColletionView 配置的锅。
2. `[collectionView makeItemWithIdentifier:@"xxx" forIndexPath:indexPath];` 这个方法返回 nil 需要检查两点:
    1. 是不是最开始 registerClass 了
    2. 检查 collectionView 是否正确配置了
        


