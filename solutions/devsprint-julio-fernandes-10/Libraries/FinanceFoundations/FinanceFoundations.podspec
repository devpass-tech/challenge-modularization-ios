Pod::Spec.new do |spec|

  spec.name = 'FinanceFoundations'
  spec.version = '0.1.0'
  spec.summary = 'Foundations Framework.'
  spec.homepage = 'https://framework.com'
  spec.author = { 'Munizin' => "pmdm.sys@gmail.com" }
  spec.license = { :type => 'Private' }
  spec.source = { :git => 'https://framework-source-code.git',
                  :tag => spec.version.to_s }

  spec.ios.deployment_target = '13.0'
  spec.requires_arc = true

  spec.cocoapods_version = '>= 1.5'
  spec.swift_version = '5.4'

  spec.source_files = 'FinanceFoundations/**/*.{h,m,swift}'

  spec.resource_bundles = {
    'FinanceFoundations' => [
      'FinanceFoundations/**/*.xcassets',
      'FinanceFoundations/**/*.xib'
    ]
  }

  spec.resources = [
    'FinanceFoundations/**/*.strings'
  ]

end