import { HdClockIn, HdSearch } from '@luyao/basic'

@Component
export struct HomeComp {
  @StorageProp('topHeight')
  topHeight: number = 0

  build() {
    Column() {
      //头部
      Row({ space: 16 }) {
        //扫码
        Image($r('app.media.ic_home_scan'))
          .width(24)
          .aspectRatio(1)

        //搜索框 (实际是按钮) 封装组件
        HdSearch({
          // searchWidth:200,
          // searchHeight:30
          layoutValue: 1
        })
        //打卡
        HdClockIn({
          clockCount: 123
        })
      }
      .width('100%')
      .padding({
        left: 16,
        right: 16
      })
    }.height('100%')
    .width('100%')
    .backgroundColor($r('app.color.common_gray_bg'))
    .padding({ top: this.topHeight })
  }
}