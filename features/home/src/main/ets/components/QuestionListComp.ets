import { QuestionItemComp } from './QuestionItemComp'
import { promptAction } from '@kit.ArkUI'
import { QuestionItem } from '../models/QuestionItemModel'
import { logger } from '@luyao/basic'

@Component
export struct QuestionListComp {
  //下拉中
  @State
  isRefreshing: boolean = false
  //加载中
  @State
  isLoading: boolean = false
  //所有数据加载完成
  @State
  isFinished: boolean = false
  @State
  list: QuestionItem[] = []

  //下拉刷新加载
  onRefresh() {
    setTimeout(() => {
      this.isRefreshing = false
    }, 1000)
  }

  //上拉滚动加载
  onLoad() {
    setTimeout(() => {
      for (let i = 0; i < 5; i++) {
        this.list.unshift({} as QuestionItem)
        logger.debug('QuestionListComp', 'i' + i)
      }
      if (this.list.length > 30) {
        this.isFinished = true
      }
      this.isLoading = false
    }, 3000)
  }

  //loading展示的Builder
  @Builder
  LoadMoreBuilder() {
    if (this.isLoading) {
      Row({ space: 4 }) {
        LoadingProgress().width(20)
        Text('正在玩命的加载...').textAlign(TextAlign.Center)
      }
      .height(80)
      .width('100%')
      .justifyContent(FlexAlign.Center)

    } else if (this.isFinished) {
      Text('我是有底线的!').height(80).width('100%').textAlign(TextAlign.Center)
    }
  }

  build() {
    //1.下拉刷新：refresh
    //2.上拉加载：List的三个周期
    Refresh({ refreshing: $$this.isRefreshing }) {
      Column() {
        List() {
          ForEach(new Array(10).fill(0), () => {
            QuestionItemComp({
              item: questionItem,
              onClickItem: () => {
                promptAction.showToast({ message: '点击了' })
              }
            })
          })

          this.LoadMoreBuilder()
        }
        .width('100%')
        .height('100%')
        .scrollBar(BarState.Off)
        .divider({
          strokeWidth: 0.5,
          color: $r('app.color.common_gray_border'),
          startMargin: 16,
          endMargin: 16
        })
        //设置上拉阴影效果
        .edgeEffect(EdgeEffect.None)
        .onReachStart(() => {
          //开始滑动
        })
        .onReachEnd(() => {
          //到底部了（EdgeEffect.Spring弹簧效果会触发2次）
          if (this.isLoading || this.isFinished || this.isRefreshing) {
            return
          }
          this.isLoading = true
          this.onLoad()
        })
        .onScrollStop(() => {
          //停止滑动
        })
      }
      .width('100%')
      .height('100%')
    }
    .onRefreshing(() => {
      this.onRefresh()
    })
  }
}

const questionItem: QuestionItem = {
  id: '100',
  stem: '请说下ArkUI的容器组件有哪些？',
  difficulty: 3,
  likeCount: 23,
  views: 423,
  readFlag: 1
}