Pod::Spec.new do |s|
  s.name             = 'Balloon'
  s.version          = '0.0.4'
  s.summary          = 'An easy way to create a popup in iOS'
 
  s.description      = <<-DESC
Provide a fast, easy and cusstomizable way to display a popup.
                       DESC
 
  s.homepage         = 'https://github.com/HienQTran/Balloon'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '<Hien Tran>' => '<hien.trquang@gmail.com>' }
  s.source           = { :git => 'https://github.com/HienQTran/Balloon.git', :tag => s.version.to_s }
 
  s.ios.deployment_target = '9.0'
  s.source_files = 'Source/*.swift'
end