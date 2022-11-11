Pod::Spec.new do |spec|

  spec.name = 'FinanceServiceAssembly'
  spec.version = '0.1.0'
  spec.summary = 'Micro feature description.'
  spec.homepage = 'https://github.com/jjfernandes87/MicrofrontendGenerator'
  spec.author = { 'Framework Author' => "author@email.com" }
  spec.license = { :type => 'Private' }
  spec.source = { :git => 'https://github.com/jjfernandes87/MicrofrontendGenerator',
                  :tag => spec.version.to_s }

  spec.ios.deployment_target = '13.0'
  spec.requires_arc = true

  spec.cocoapods_version = '>= 1.5'
  spec.swift_version = '5.4'

  spec.source_files = 'FinanceServiceAssembly/**/*.{h,m,swift}'
  
  spec.dependency 'FinanceServiceInterface'
  spec.dependency 'FinanceService'
  spec.dependency 'Swinject', '~> 2.0'
  spec.dependency 'SwinjectAutoregistration', '~> 2.0'

end