import { logger } from './Logger'
import { window } from '@kit.ArkUI'

/**
 * 沉浸式工具:
 * 目标：实现一个开启和关闭沉浸式的工具
 * 前置知识：
 * window.getLastWindow 获取当前窗口对象
 * getWindowAvoidArea 使用窗口对象获取某一个区域的尺寸
 * 将来很多地方需使用 context ，所以共享 context 对象
 *
 *   onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
 *      logger.info( 'Ability onCreate');
 *      AppStorage.setOrCreate('context', this.context)
 *   }
 *
 */
class FullScreen {
  async enable() {
    try {
      const context = AppStorage.get<Context>('context')
      if (context) {
        const win = await window.getLastWindow(context)
        await win.setWindowLayoutFullScreen(true)
        // 因为获取的安全区域的大小是px，所以需要用到vp的话 需要使用px2vp的方法来实现
        // 获取上方安全区高度 38.76923076923077
        // 获取下方安全区高度 28
        const topArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_SYSTEM)
        AppStorage.setOrCreate('topHeight', px2vp(topArea.topRect.height))
        const bottomArea = win.getWindowAvoidArea(window.AvoidAreaType.TYPE_NAVIGATION_INDICATOR)
        AppStorage.setOrCreate('bottomHeight', px2vp(bottomArea.bottomRect.height))
      }
    } catch (e) {
      logger.error('FullScreen enable', JSON.stringify(e))
    }
  }

  async disable() {
    try {
      const context = AppStorage.get<Context>('context')
      if (context) {
        const win = await window.getLastWindow(context)
        await win.setWindowLayoutFullScreen(false)
        AppStorage.setOrCreate('topHeight', 0)
        AppStorage.setOrCreate('bottomHeight', 0)
      }
    } catch (e) {
      logger.error('FullScreen disable', JSON.stringify(e))
    }
  }
}

export const fullScreen = new FullScreen()