cask 'basler-pylon' do
  version '5.1.1.13069'
  sha256 'f98e6c0b3410374155d7a572e55a99d82681c29328cd1f46e9224f245598dd33'

  url "https://www.baslerweb.com/media/downloads/software/pylon_software/pylon-#{version}.dmg"
  appcast 'https://www.baslerweb.com/en/sales-support/downloads/software-downloads/#type=pylonsoftware;version=all;os=macos'
  name 'Basler Pylon Camera Software Suite'
  homepage 'https://www.baslerweb.com/en/products/software/basler-pylon-camera-software-suite/'

  depends_on macos: '>= :sierra'

  pkg "pylon-#{version}.pkg"

  uninstall quit:    [
                       'com.baslerweb.pylon.*',
                       'org.qt-project.*',
                     ],
            signal:  [
                       ['TERM', 'com.baslerweb.pylon.util.ipconf'],
                       ['TERM', 'com.baslerweb.pylon.viewer'],
                     ],
            pkgutil: 'com.baslerweb.pylon.*',
            delete:  [
                       '/Applications/Basler Product Documentation.app',
                       '/Applications/pylon IP Configurator.app',
                       '/Applications/pylon Programmer\'s Guide and API Reference.app',
                       '/Applications/pylon Viewer.app',
                       '/Library/Frameworks/pylon.framework',
                     ]

  zap trash: [
               '~/Library/Preferences/com.baslerweb.pylon Viewer.plist',
               '~/Library/Saved Application State/com.baslerweb.pylon.util.ipconf.savedState',
               '~/Library/Saved Application State/com.baslerweb.pylon.viewer.savedState',
             ]

  caveats do
    license 'https://www.baslerweb.com/en/service/pylon-eula/'
  end
end
