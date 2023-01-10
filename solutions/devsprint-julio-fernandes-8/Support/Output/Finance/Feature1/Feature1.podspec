Pod::Spec.new do |spec|

  spec.name = 'Feature1'
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

  spec.source_files = 'Feature1/**/*.{h,m,swift}'

  spec.resource_bundles = {
    'Feature1' => [
      'Feature1/**/*.xcassets',
      'Feature1/**/*.xib'
    ]
  }

  spec.resources = [
    'Feature1/**/*.strings'
  ]

  spec.dependency 'Feature1Interface'

end