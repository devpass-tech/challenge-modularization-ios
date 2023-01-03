Pod::Spec.new do |spec|

  spec.name = 'FinanceService'
  spec.version = '0.2.0'
  spec.summary = 'Framework description.'
  spec.homepage = 'https://framework.com'
  spec.author = { 'Framework Author' => "author@email.com" }
  spec.license = { :type => 'Private' }
  spec.source = { :git => 'https://framework-source-code.git',
                  :tag => spec.version.to_s }

  spec.ios.deployment_target = '13.0'
  spec.requires_arc = true

  spec.cocoapods_version = '>= 1.5'
  spec.swift_version = '5.4'

  spec.source_files = 'FinanceService/**/*.{h,m,swift}'

  spec.resource_bundles = {
    'FinanceService' => [
      'FinanceService/**/*.xcassets',
      'FinanceService/**/*.xib'
    ]
  }

  spec.resources = [
    'FinanceService/**/*.strings'
  ]

  #spec.dependency 'Dependency', '~> 1.0.0'

end