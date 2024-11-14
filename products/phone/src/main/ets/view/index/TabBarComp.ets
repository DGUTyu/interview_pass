import { BasicConstant } from '@luyao/basic'
import { HomeComp } from '@luyao/home'
import { InterviewComp } from '@luyao/interview'
import { MineComp } from '@luyao/mine'
import { ProjectComp } from '@luyao/project'
import { TabBarItems } from '../../contants'
import { TabBarModel } from '../../models/TabBarModel'

@Component
export struct TabBarComp {
  @StorageProp('bottomHeight')
  bottomHeight: number = 0
  @Link
  activeIndex: number

  @Builder
  TabBarBuilder(item: TabBarModel, index: number) {
    Column({ space: BasicConstant.SPACE_SM }) {
      Image(this.activeIndex === index ? item.activeIcon : item.defaultIcon)
        .width($r('app.float.tab_bar_item_icon_size'))
      Text(item.label)
        .fontSize($r('app.float.tab_bar_item_font_size'))
        .fontColor(this.activeIndex === index ? $r('app.color.black') : $r('app.color.common_gray_01'))
        .animation({ duration: 300 })
    }
  }

  build() {
    Column() {
      Tabs({ index: this.activeIndex }) {
        ForEach(TabBarItems, (item: TabBarModel, index) => {
          TabContent() {
            if (index === 0) {
              HomeComp()
            } else if (index === 1) {
              ProjectComp()
            } else if (index ===
              2) {
              InterviewComp()
            } else {
              MineComp()
            }
          }
          .tabBar(this.TabBarBuilder(item, index))
        })
      }
      .divider({ strokeWidth: 0.5, color: $r('app.color.common_gray_border') })
      .barPosition(BarPosition.End)
      .onTabBarClick((index) => {
        this.activeIndex = index
      })
      .scrollable(false)
      .margin({ bottom: this.bottomHeight })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.white'))
  }
}