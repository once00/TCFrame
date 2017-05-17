#
#  Be sure to run `pod spec lint TCFrame.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|
# 项目名称
s.name         = 'TCFrame'
# 描述一下项目的作用
s.summary      = '一个简单的常用控件frame的封装.'
# 版本号
s.version      = '1.0.0'
# 开源许可证
s.license      = { :type => 'MIT', :file => 'LICENSE' }
# 作者信息
s.authors      = { 'once00' => 'love521943@hotmail.com' }
# 所支持的系统以及版本号
s.platform     = :ios, '9.0'
s.ios.deployment_target = '9.0'
#Github那个页面地址
s.homepage     = "https://github.com/once00/TCFrame"
# 资源地址链接
s.source       = { :git => 'https://github.com/once00/TCFrame.git', :tag => s.version.to_s }
#
s.requires_arc = true
# 文件
s.source_files = 'TCFrame'
# 头文件
#s.public_header_files = 'TCFrame/*.{h}'
# 所用到的系统类库
# s.frameworks = 'CoreFoundation', 'CoreGraphics', 'Foundation', 'MobileCoreServices', 'QuartCore', 'Security', 'SystemConfiguration', 'UIKit'
s.frameworks  = "UIKit","CommonCrypto","CGBase","CFDictionary","CFBase","CFAvailability","stdint" 
s.requires_arc = true
# 所用到 cocoapods 中的其他类库
# s.dependency 'AFNetworking', '~>3.1.0'
# s.dependency 'MJExtension', '~>3.0.13'
# s.dependency 'YYCache', '~>1.0.3'



  # s.name         = "TCFrame"
  # s.version      = "1.0.0"
  # s.summary      = "一个简单的常用控件frame的封装"
  # s.homepage     = "https://github.com/once00/TCFrame"
  # # s.license      = "MIT"
  # s.license= { :type => "MIT", :file => "LICENSE" }
  # s.authors             = { "once00" => "love521943@hotmail.com" }
  # #// 支持的最低版本，比如ios 8.0
  # s.platform     = :ios, "8.0"
  # #// 源代码地址，也就是你github上的地址
  # s.source       = { :git => "https://github.com/once00/TCFrame.git", :tag => s.version.to_s }
  # #// 源代码的文件路径
  # # s.source_files  = "TCFrame", "TCFrame/*.{h,m}"
  # s.source_files  = "TCFrame", "TCFrame/*"
  # #// 资源文件路径
  # #s.resources     = "WCL.png", "WCL/**/*.{bundle}" , "WCL/*.{bundle}"
  # #// 用到的框架
  # s.framework  = "UIKit","CommonCrypto","CGBase","CFDictionary","CFBase","CFAvailability","stdint"
  # #// 依赖的第三方库
  # #s.dependency "JSONKit", "~> 1.4"
  # s.requires_arc = true
  # s.ios.deployment_target = '8.0'

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  # s.name         = "TCFrame"
  # s.version      = "0.0.1"
  # s.summary      = "A short description of TCFrame."

  # # This description is used to generate tags and improve search results.
  # #   * Think: What does it do? Why did you write it? What is the focus?
  # #   * Try to keep it short, snappy and to the point.
  # #   * Write the description between the DESC delimiters below.
  # #   * Finally, don't worry about the indent, CocoaPods strips it!
  # s.description  = <<-DESC
  #                  DESC

  # s.homepage     = "http://EXAMPLE/TCFrame"
  # # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # #
  # #  Licensing your code is important. See http://choosealicense.com for more info.
  # #  CocoaPods will detect a license file if there is a named LICENSE*
  # #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  # #

  # s.license      = "MIT (example)"
  # # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # #
  # #  Specify the authors of the library, with email addresses. Email addresses
  # #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  # #  accepts just a name if you'd rather not provide an email address.
  # #
  # #  Specify a social_media_url where others can refer to, for example a twitter
  # #  profile URL.
  # #

  # s.author             = { "" => "" }
  # # Or just: s.author    = ""
  # # s.authors            = { "" => "" }
  # # s.social_media_url   = "http://twitter.com/"

  # # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # #
  # #  If this Pod runs only on iOS or OS X, then specify the platform and
  # #  the deployment target. You can optionally include the target after the platform.
  # #

  # # s.platform     = :ios
  # # s.platform     = :ios, "5.0"

  # #  When using multiple platforms
  # # s.ios.deployment_target = "5.0"
  # # s.osx.deployment_target = "10.7"
  # # s.watchos.deployment_target = "2.0"
  # # s.tvos.deployment_target = "9.0"


  # # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # #
  # #  Specify the location from where the source should be retrieved.
  # #  Supports git, hg, bzr, svn and HTTP.
  # #

  # s.source       = { :git => "http://EXAMPLE/TCFrame.git", :tag => "#{s.version}" }


  # # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  # #
  # #  CocoaPods is smart about how it includes source code. For source files
  # #  giving a folder will include any swift, h, m, mm, c & cpp files.
  # #  For header files it will include any header in the folder.
  # #  Not including the public_header_files will make all headers public.
  # #

  # s.source_files  = "Classes", "Classes/**/*.{h,m}"
  # s.exclude_files = "Classes/Exclude"

  # # s.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # s.resource  = "icon.png"
  # s.resources = "Resources/*.png"

  # s.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  # s.library   = "iconv"
  # s.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true

  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
