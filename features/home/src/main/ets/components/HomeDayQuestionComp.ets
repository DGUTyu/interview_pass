import { logger } from '@luyao/basic';

@Component
export struct HomeDayQuestionComp {
  @State
  offSetDay:number=0
  monthWords: string[] = [
    "JAN",
    "FEB",
    "MAR",
    "APR",
    "MAY",
    "JUN",
    "JUL",
    "AUG",
    "SEP",
    "OCT",
    "NOV",
    "DEC"
  ]
  monthText: string = this.monthWords[new Date().getMonth()]
  today: string = new Date().getDate().toString().padStart(2, '0')

  aboutToAppear(): void {
    let temp = new Date().getFullYear() + '-' + (new Date().getMonth() + 1)
    this.offSetDay = new Date(temp).getDay()
    logger.debug('HomeDayQuestionComp', 'offSetDay' + this.offSetDay)
  }

  getMonthDays() {
    let currentDate = new Date();
    let currentYear = currentDate.getFullYear();
    // 注意：getMonth() 返回的月份是从0开始的
    let currentMonth = currentDate.getMonth();

    // 创建一个日期对象，设置为当前月份的下一个月，日期设置为0（这会自动设置为上一个月的最后一天）
    // 当你创建一个Date对象并尝试将日期（日）部分设置为0或负数时，Date对象会将其解释为上一个月的最后一天。
    let lastDayOfCurrentMonth = new Date(currentYear, currentMonth + 1, 0);

    // 获取当前月份的天数
    const daysInCurrentMonth = lastDayOfCurrentMonth.getDate();

    logger.debug('HomeDayQuestionComp', `当前月份一共有 ${daysInCurrentMonth} 天`)

    return daysInCurrentMonth
  }

  build() {
    Row() {
      Row() {
        Column() {
          Text(this.monthText)
            .fontColor('#fc3c30')
            .fontSize(12)
            .fontWeight(500)
            .margin(4)
          Text(this.today)
            .fontSize(22)
        }
        .height(60)
        .width(44)
        .translate({ y: -10 })
        .backgroundColor($r('app.color.white'))
        .borderRadius(8)
        .margin({ left: 12 })
        .shadow(ShadowStyle.OUTER_DEFAULT_LG)
        .justifyContent(FlexAlign.Center)

        Column() {
          Text('每日 1 题')
            .fontColor(14)
            .fontSize(10)
            .margin({ bottom: 8 })
          Text('JS 闭包你是怎么理解的?')
            .fontSize(12)
            .fontWeight(FontWeight.Bold)
            .textOverflow({
              overflow: TextOverflow.Ellipsis
            })
            .maxLines(1)
        }
        .layoutWeight(1)
        .alignItems(HorizontalAlign.Start)
        .padding({ left: 20 })

        //日历图表
        Column() {
          GridRow({ columns: 7, gutter: 6 }) {
            ForEach(Array(this.getMonthDays()).fill(() => 1), (item: number, index: number) => {
              //一周第一天是：周日
              GridCol(index === 0 ? { offset: this.offSetDay } : {}) {
                Row() {

                }
                .width(6)
                .aspectRatio(1)
                .borderRadius(3)
                .backgroundColor(this.today === (index + 1).toString() ? Color.Green : '#ccc')
              }
            })
          }
        }
        .width(120)
        .height(60)
        // .backgroundColor(Color.Pink)
        .justifyContent(FlexAlign.Center)

      }
      .width('100%')
      .height(60)
      .backgroundColor($r('app.color.home_gray'))
      .borderRadius(8)
    }
    .padding(16)
  }
}