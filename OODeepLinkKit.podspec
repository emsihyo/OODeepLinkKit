Pod::Spec.new do |spec|
    spec.name     = 'OODeepLinkKit'
    spec.version  = '1.0.1'
    spec.license  = 'MIT'
    spec.summary  = 'Category of DeepLinkRouter in DeepLinkKit'
    spec.homepage = 'https://github.com/emsihyo/OODeepLinkKit'
    spec.author   = { 'emsihyo' => 'emsihyo@gmail.com' }
    spec.source   = { :git => 'https://github.com/emsihyo/OODeepLinkKit.git',:tag => "#{spec.version}" }
    spec.description = 'Category of DeepLinkRouter in DeepLinkKit.Free parameters for route.'
    spec.requires_arc = true
    spec.source_files = 'OODeepLinkKit/*.{h,m}'
    spec.ios.deployment_target = '8.0'
    spec.tvos.deployment_target = '9.0'
    spec.dependency 'DeepLinkKit'
    spec.dependency 'JRSwizzle'
end
