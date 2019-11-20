import Foundation

// Factory class for the static pages
class WebPageFactory{
    
    // static page name
    enum WebPage:String {
        case termsOfUse
        case privacyPolicy
        case cookiePolicy
        case legalDisclaimer
        case faq
        case aboutUs
        case howToGuide
    }
    
    struct webTitle {
        static let termsOfUse         = "Terms Of Use"
        static let privacyPolicy      = "Privacy Policy"
        static let cookiePolicy       = "Cookie Policy"
        static let legalDisclaimer    = "legal Disclaimer"
        static let faq                = "Frequent Asked Question"
        static let aboutUs            = "About Us"
        static let howToGuide         = "How To Guide"
    }
    
    static var url: String?
    
    private init(){}
    
    public class func urlFor(page:WebPage) -> [String] {
        switch page {
        case .termsOfUse:
            return [Constants.WebServicesApi.termsAndCondition,webTitle.termsOfUse] // return webapi url and webtitle
        case .privacyPolicy:
            return  [Constants.WebServicesApi.privacyPolicy,webTitle.privacyPolicy]
        case .cookiePolicy:
            return  [Constants.WebServicesApi.cookiePolicy,webTitle.cookiePolicy]
        case .legalDisclaimer:
            return  [Constants.WebServicesApi.legalDisclaimer,webTitle.legalDisclaimer]
        case .faq:
            return  [Constants.WebServicesApi.faq,webTitle.faq]
        case .aboutUs:
            return  [Constants.WebServicesApi.aboutUS,webTitle.aboutUs]
        case .howToGuide:
            return  [Constants.WebServicesApi.howToGuide,webTitle.howToGuide]
        }
    }
}
