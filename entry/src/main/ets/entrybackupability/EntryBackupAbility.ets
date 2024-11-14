import { BackupExtensionAbility, BundleVersion } from '@kit.CoreFileKit';
import { logger } from '@luyao/basic';

export default class EntryBackupAbility extends BackupExtensionAbility {
  async onBackup() {
    logger.info('testTag', 'onBackup ok');
  }

  async onRestore(bundleVersion: BundleVersion) {
    logger.info('testTag', 'onRestore ok %{public}s', JSON.stringify(bundleVersion));
  }
}