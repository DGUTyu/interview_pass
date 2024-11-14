import { statusBar } from '@luyao/basic'
import { TabBarComp } from '../view/index/TabBarComp'

@Entry
@Component
struct Index {
  //AppStorage 是应用全局的UI状态存储，是和应用的进程绑定的，
  //第一种用法-使用UI修饰符
  //● 单向 @StorageProp('user') 组件内可变
  //● 双向 @StorageLink('user') 全局均可变
  //第二种用法  使用API方法
  //● AppStorage.get<ValueType>(key) 获取数据
  //● AppStorage.set<ValueType>(key,value) 覆盖数据
  @StorageProp('topHeight') topHeight: number = 0
  @StorageProp('bottomHeight') bottomHeight: number = 0

  @State
  activeIndex: number = 0

  build() {
    //this.testUtils()
    Flex() {
      TabBarComp({ activeIndex: this.activeIndex })
    }
    .backgroundColor($r('app.color.white'))
  }

  @Builder
  testUtils() {
    Column() {
      Text('top')
      Blank()
      Row() {
        Button('Light')
          .onClick(() => {
            statusBar.setLightBar()
          })
        Button('Dark')
          .onClick(() => {
            statusBar.setDarkBar()
          })
      }
      Blank()
      Text('bottom')
    }
    .backgroundColor(Color.Gray)
    .height('100%')
    .width('100%')
    .padding({ top: this.topHeight, bottom: this.bottomHeight })
  }
}