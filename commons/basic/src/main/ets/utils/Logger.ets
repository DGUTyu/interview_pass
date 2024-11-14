/**
 * 日志工具 hilog
 * hilog和console区别？
 * console 基于 hilog 封装，默认的 domain/tag 是 A03D00/JSAPP
 */
// import hilog from '@ohos.hilog'
import { hilog } from '@kit.PerformanceAnalysisKit';

const DOMAIN = 0xFF09
const PREFIX = 'PASS_INTERVIEW_LOGGER'
const FORMAT = '%{public}s, %{public}s'

class Logger {
  debug(...args: string[]) {
    hilog.debug(DOMAIN, PREFIX, FORMAT, args)
  }

  info(...args: string[]) {
    hilog.info(DOMAIN, PREFIX, FORMAT, args)
  }

  warn(...args: string[]) {
    hilog.warn(DOMAIN, PREFIX, FORMAT, args)
  }

  error(...args: string[]) {
    hilog.error(DOMAIN, PREFIX, FORMAT, args)
  }

  fatal(...args: string[]) {
    hilog.fatal(DOMAIN, PREFIX, FORMAT, args)
  }

  isLoggable(level: hilog.LogLevel) {
    hilog.isLoggable(DOMAIN, PREFIX, level)
  }
}

export const logger = new Logger()