@Component
export struct HdSearch {
  @Prop
  color: ResourceColor = '#ff8d8585'
  @Prop
  text: string = '搜索题目'
  @Prop
  layoutValue: number = 0
  @Prop
  searchHeight: number = 35
  @Prop
  searchWidth: number = 200
  @Prop
  searchBgColor: ResourceColor = '#ffececec'

  //需求：既可以指定大小，也可以自适应
  //1.传递宽高，就用宽高，默认不会自适应
  //2.不传递宽高，就用白适应，会覆盖宽高
  build() {
    Row({ space: 4 }) {
      Image($r('app.media.ic_common_search'))
        .width(14)
        .aspectRatio(1)
        .fillColor(this.color || $r('app.color.common_gray_02'))

      Text(this.text)
        .fontSize(14)
        .fontColor(this.color)
    }
    .width(this.searchWidth)
    .height(this.searchHeight)
    .layoutWeight(this.layoutValue)
    .justifyContent(FlexAlign.Center)
    .borderRadius(this.searchHeight/2)
    .backgroundColor(this.searchBgColor)
  }
}