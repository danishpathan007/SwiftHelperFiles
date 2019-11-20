
import UIKit


final class WebViewController: UIViewController,UIWebViewDelegate {
    
    //MARK:- Properties
    var page: WebPageFactory.WebPage!
    
    //MARK:- IBOutlets
    @IBOutlet private weak var webView: UIWebView!
    
    //MARK:- AppLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
       var urlToLoad = WebPageFactory.urlFor(page: page)
        let url = URL.init(string: urlToLoad[0])
        let request = URLRequest.init(url: url!)
            self.webView.loadRequest(request)
            self.webView.scalesPageToFit = true
            self.webView.delegate = self
        navigationItem.title = urlToLoad[1]
    }
    
    //MARK: Web View Delegate
    func webViewDidStartLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
    
    func canPerformBackButtonAction() -> Bool {
        if webView.canGoBack {
            webView.goBack()
            return false
        }
        return true
    }
}
