/**
 *状态栏工具
 * 目标：实现一个控制状态栏的工具，可以快捷设置黑色和白色状态文字
 * 前置知识：
 * setWindowSystemBarProperties 设置状态颜色
 */
import { window } from '@kit.ArkUI'
import { logger } from './Logger'

class StatusBar {
  async setDarkBar() {
    await this.setBar({ statusBarContentColor: '#000000' })
  }

  async setLightBar() {
    await this.setBar({ statusBarContentColor: '#FFFFFF' })
  }

  async setBar(config: window.SystemBarProperties) {
    try {
      const context = AppStorage.get<Context>('context')
      if (context) {
        const win = await window.getLastWindow(context)
        await win.setWindowSystemBarProperties(config)
      }
    } catch (e) {
      logger.error('StatusBar setBar', JSON.stringify(e))
    }
  }
}

export const statusBar = new StatusBar()