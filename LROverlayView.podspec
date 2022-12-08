
Pod::Spec.new do |s|
  s.name             = 'LROverlayView'
  s.version          = '0.1.0'
  s.summary          = 'A short description of LROverlayView.'
  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/huawt/LROverlayView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'huawt' => 'ghost263sky@163.com' }
  s.source           = { :git => 'https://github.com/huawt/LROverlayView.git', :tag => s.version.to_s }
  s.ios.deployment_target = '10.0'
  s.source_files = 'LROverlayView/Classes/**/*'
end
