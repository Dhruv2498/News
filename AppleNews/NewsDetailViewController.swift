import Alamofire
import SwiftyJSON
import UIKit
import AlamofireImage
import WebKit

class NewsDetailViewController: UIViewController {
    
    

    @IBOutlet weak var lblPublished: UILabel!
    @IBOutlet weak var lblContent: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblAuther: UILabel!
    @IBOutlet weak var lbldescription: UILabel!
    @IBOutlet weak var DetailsImageView: UIImageView!
    
    var author:String = ""
    var publishedAt:String = ""
    var content:String = ""
    var imageview = ""
    var head:String = ""
    var desc:String = ""
    var webview = " "
    
    @IBOutlet weak var lblurl: UILabel!
    @IBAction func btnReadmore(_ sender: Any) {
        
        if let web = lblurl.text,
           let url = URL(string: web){
            print("URL: \(url)")
            let D = storyboard?.instantiateViewController(withIdentifier: "readmore") as! ReadmoreViewController
            D.webUrl = url
                self.navigationController?.pushViewController(D, animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        lblAuther.text = author
        lblPublished.text = publishedAt
        lblContent.text = content
        lblTitle.text = head
        lbldescription.text = desc
        lblurl.text = webview
        lblurl.isHidden = true
        
        let url = URL(string: imageview)
        self.DetailsImageView.af.setImage(withURL: url!)
    }
  
}
