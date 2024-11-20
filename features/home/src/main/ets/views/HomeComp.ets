import { BasicConstant, HdClockIn, HdSearch, HdTag } from '@luyao/basic'
import { HomeCategoryComp } from '../components/HomeCategoryComp'
import { HomeDayQuestionComp } from '../components/HomeDayQuestionComp'

@Component
export struct HomeComp {
  @StorageProp('topHeight')
  topHeight: number = 0

  @Builder
  SwiperItemBuilder(src: ResourceStr) {
    Flex() {
      Image(src)
        .objectFit(ImageFit.Fill)
    }
    .padding({ left: BasicConstant.SPACE_LG, right: BasicConstant.SPACE_LG })
    .aspectRatio(2.8)
  }

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

      //轮播图
      Row() {
        Swiper() {
          this.SwiperItemBuilder($r('app.media.banner_qa'))
          this.SwiperItemBuilder($r('app.media.banner_pj'))
          this.SwiperItemBuilder($r('app.media.banner_ai'))
        }
        .autoPlay(true)
        .indicator(DotIndicator.dot()
          .selectedColor(Color.White)
          .bottom(BasicConstant.SPACE_SM)
          .itemHeight(BasicConstant.SPACE_SM)
          .selectedItemHeight(BasicConstant.SPACE_SM)
          .itemWidth(BasicConstant.SPACE_MD)
          .selectedItemWidth(BasicConstant.SPACE_MD))
      }

      //每日一题
      HomeDayQuestionComp()

      //试题分类
      Column() {
        HomeCategoryComp()
      }
      .layoutWeight(1)
      .backgroundColor($r('app.color.white'))
      .width('100%')

      Column({ space: 5 }) {
        HdTag({ difficulty: 1 })
        HdTag({ difficulty: 3 })
        HdTag({ text: 'HarmonyOS'})
      }

    }.height('100%')
    .width('100%')
    .backgroundColor($r('app.color.common_gray_bg'))
    .padding({ top: this.topHeight })
  }
}