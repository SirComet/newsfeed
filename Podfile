# Global platform
platform :ios, '9.0'

# Use frameworks instead of static libraries
use_frameworks!

# Ignore Xcode warning to libraries
inhibit_all_warnings!

# Libraries
def available_pods
  pod 'Alamofire'
  pod 'SwiftyJSON'
  pod 'SVProgressHUD'
end 

target 'newsfeed' do
  available_pods

  target 'newsfeedTests' do
    inherit! :search_paths
    # Pods for testing
  end

end
