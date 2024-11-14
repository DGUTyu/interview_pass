import { logger } from '../utils/Logger';

@Component
export struct MainPage {
  @State message: string = 'Hello World';

  aboutToAppear(): void {
    logger.info('IndexPage', '这是首页的日志')
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}
