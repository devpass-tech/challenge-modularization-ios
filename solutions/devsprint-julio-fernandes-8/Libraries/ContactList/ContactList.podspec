Pod::Spec.new do |spec|

  spec.name = 'ContactList'
  spec.version = '0.1.0'
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

  spec.source_files = 'ContactList/**/*.{h,m,swift}'

  spec.resource_bundles = {
    'ContactList' => [
      'ContactList/**/*.xcassets',
      'ContactList/**/*.xib'
    ]
  }

  spec.resources = [
    'ContactList/**/*.strings'
  ]

  spec.dependency 'Components'

end