/**
 * 日志工具 hilog
 * hilog和console区别？
 * console 基于 hilog 封装，默认的 domain/tag 是 A03D00/JSAPP
 */
// 不推荐这种导包
// import hilog from '@ohos.hilog'

//可以配置实时模板 Settings-Editor-Live Templates-ArkTs
//console.log('8888','$FileName$','$Param$')
//logger.debug('$FileName$','$Param$')
//logger.error('$FileName$','$LineNumber$行','$Param$')
//=> 按tab补全
//($Param$) => {
//
// }

// 推荐这种导包
import { hilog } from '@kit.PerformanceAnalysisKit';

//写什么都会换算成16进制
const DOMAIN = 0xFF09
const PREFIX = 'tag8888'

class Logger {
  private domain: number
  private tag: string

  constructor(tag: string = PREFIX, domain: number = DOMAIN) {
    this.tag = tag
    this.domain = domain
  }

  format(args: string[]) {
    let str = ''
    for (let i = 0; i < args.length; i++) {
      str += '%{public}s, '
    }
    return str
  }

  //alt+shift 多选光标
  debug(...args: string[]) {
    hilog.debug(this.domain, this.tag, this.format(args), args)
  }

  info(...args: string[]) {
    hilog.info(this.domain, this.tag, this.format(args), args)
  }

  warn(...args: string[]) {
    hilog.warn(this.domain, this.tag, this.format(args), args)
  }

  error(...args: string[]) {
    hilog.error(this.domain, this.tag, this.format(args), args)
  }

  fatal(...args: string[]) {
    hilog.fatal(this.domain, this.tag, this.format(args), args)
  }

  isLoggable(level: hilog.LogLevel) {
    hilog.isLoggable(this.domain, this.tag, level)
  }
}

//好处：不用写静态方法
export const logger = new Logger(PREFIX)