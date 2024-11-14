import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { window } from '@kit.ArkUI';
import { fullScreen, logger } from '@luyao/basic';

export default class EntryAbility extends UIAbility {
  onCreate(want: Want, launchParam: AbilityConstant.LaunchParam): void {
    logger.info('testTag', 'Ability onCreate');
    AppStorage.setOrCreate('context', this.context)
  }

  onDestroy(): void {
    logger.info('testTag', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    logger.info('testTag', 'Ability onWindowStageCreate');
    fullScreen.enable()
    windowStage.loadContent('pages/Index', (err) => {
      if (err.code) {
        logger.error('testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      logger.info('testTag', 'Succeeded in loading the content.');
    });
  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    logger.info('testTag', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    logger.info('testTag', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    logger.info('testTag', 'Ability onBackground');
  }
}
