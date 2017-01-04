Pod::Spec.new do |s|

  s.name         = "SwiftyGraph"
  s.version      = "0.1"
  s.summary      = "A graph data structure implemented for swift"
  s.description  = "SwiftyGraph"
  s.homepage     = "https://github.com/Jranco/SwiftyGraph.git"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Thomas Segkoulis' => 'segkoulis@gmail.com' }
  s.source = { :git => 'https://github.com/Jranco/SwiftyGraph.git', :tag =>   s.version.to_s }
    s.platform     = :ios, "9.0"
 s.ios.deployment_target = '9.0'
  s.source_files = "SwiftyGraph", "SwiftyGraph/**/*.{h,m,swift}"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3.0.2' }

end
