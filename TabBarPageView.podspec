
Pod::Spec.new do |s|
  s.name = 'TabBarPageView'
  s.version = '0.0.1'
  s.license = 'MIT'
  s.summary = '顶部Tab栏容器试图'
  s.homepage = 'https://github.com/when50/TabBarView'
  s.authors = { 'When50' => 'when50@outlook.com' }
  s.source = { :git => 'https://github.com/when50/TabBarView.git', :tag => s.version }

  s.ios.deployment_target = '8.0'

  s.source_files = 'TabBarPageView/*.swift'
  s.resource = 'TabBarPageView/*.{xib,storyboard}'

  s.frameworks = 'UIKit'
end