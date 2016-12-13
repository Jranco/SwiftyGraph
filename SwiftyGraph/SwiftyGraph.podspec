Pod::Spec.new do |s|

  s.name         = "SwiftyGraph"
  s.version      = "0.1"
  s.summary      = "A graph data structure implemented for swift"
  s.description  = "SwiftyGraph"
  s.homepage     = "INSERT_HOMEPAGE"

  s.license      = "MIT"
  s.author       = "Thomas Segkoulis"
  s.platform     = :ios, "9.0"
  
  s.source       = { :path => '.' }
  s.source_files = "SwiftyGraph", "SwiftyGraph/**/*.{h,m,swift}"
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '3' }

end
