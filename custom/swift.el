(add-to-list 'company-backends 'company-sourcekit)

(add-to-list 'company-backends 'company-sourcekit)

(setq flycheck-swift-sdk-path "/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS12.1.sdk")
;; ↑ Select the appropriate SDK version you use
(setq flycheck-swift-target "arm7s-apple-ios12")
