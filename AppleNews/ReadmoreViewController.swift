
import WebKit
import UIKit

class ReadmoreViewController: UIViewController,WKNavigationDelegate {

    @IBOutlet weak var webview: WKWebView!
    
    var webUrl: URL?

      
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let webU = webUrl{
            webview.load(URLRequest(url: webU))
            
        }
        
    }
    


}
