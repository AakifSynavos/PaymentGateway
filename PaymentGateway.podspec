Pod::Spec.new do |s|

# 1
s.platform = :ios
s.ios.deployment_target = '12.0'
s.name = "PaymentGateway"
s.summary = "PaymentGateway lets a user to select payment methods"
s.requires_arc = true

# 2
s.version = "0.1.1"

# 3
s.license = { :type => "MIT", :file => "LICENSE" }

# 4 - Replace with your name and e-mail address
s.author = { "AakifSynavos" => "muhammad.akif@synavos.com" }

# 5 - Replace this URL with your own GitHub page's URL (from the address bar)
s.homepage = "https://github.com/AakifSynavos/PaymentGateway"

# 6 - Replace this URL with your own Git URL from "Quick Setup"
s.source = { :git => "https://github.com/AakifSynavos/PaymentGateway.git",
             :tag => "#{s.version}" }

# 7
s.framework = "UIKit"
s.dependency 'PayPalCheckout'

# 8
s.source_files = "PaymentGateway/**/*.{swift}"

# 9
# s.resources = "PaymentGateway/**/*.{png,jpeg,jpg,storyboard,xib,xcassets}"

# 10
s.swift_version = "4.2"

end
