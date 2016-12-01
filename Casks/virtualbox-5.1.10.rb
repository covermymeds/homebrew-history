cask 'virtualbox-5.1.10' do
  version '5.1.10-112026'
  sha256 '3500f07be9f5e27a08c00cc626981230bdaf639f6fad0b82ecf731a0580cccef'

  url "http://download.virtualbox.org/virtualbox/#{version.sub(%r{-.*}, '')}/VirtualBox-#{version}-OSX.dmg"
  appcast 'http://download.virtualbox.org/virtualbox/LATEST.TXT',
          checkpoint: '779e6d24cb291ff605d93a3ec585cfa5589c1d4584ab7d9ee04a231d41ff5df3'
  name 'Oracle VirtualBox'
  homepage 'https://www.virtualbox.org'

  pkg 'VirtualBox.pkg'

  uninstall script:  { executable: 'VirtualBox_Uninstall.tool', args: %w[--unattended] },
            pkgutil: 'org.virtualbox.pkg.*'

  zap delete: [
                '/Library/Application Support/VirtualBox',
                '~/Library/VirtualBox',
                '~/Library/Preferences/org.virtualbox.app.VirtualBox.plist',
                '~/Library/Preferences/org.virtualbox.app.VirtualBoxVM.plist',
                '~/Library/Saved Application State/org.virtualbox.app.VirtualBox.savedState',
                '~/Library/Saved Application State/org.virtualbox.app.VirtualBoxVM.savedState',
              ],
      rmdir:  '~/VirtualBox VMs'
end
