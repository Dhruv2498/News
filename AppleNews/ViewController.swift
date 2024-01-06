import Alamofire
import UIKit
import AlamofireImage
import SwiftyJSON
import WebKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    @IBOutlet weak var NewsListTableView: UITableView!
    
    var arr_Auther = [String]()
    var arr_Title = [String]()
    var arr_PublishdAt = [String]()
    var arr_Description = [String]()
    var arr_UrlToImage = [String]()
    var arr_Content = [String]()
    var arr_Url = [String]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_Auther.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsListCell") as! NewsListTableViewCell
        cell.lblAuther.text = arr_Auther[indexPath.row]
        cell.lblPublishedAt.text = arr_PublishdAt[indexPath.row]
        cell.lblContent.text = arr_Content[indexPath.row]
        cell.WebViewURL.text = arr_Url[indexPath.row]
        let url = URL(string: arr_UrlToImage[indexPath.row])
        cell.NewsListImageview.af.setImage(withURL: url!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let main = storyboard?.instantiateViewController(identifier: "NewsDetails") as! NewsDetailViewController
        main.author = arr_Auther[indexPath.row]
        main.content = arr_Content[indexPath.row]
        main.publishedAt = arr_PublishdAt[indexPath.row]
        main.imageview = arr_UrlToImage[indexPath.row]
        main.desc = arr_Description[indexPath.row]
        main.head = arr_Title[indexPath.row]
        main.webview = arr_Url[indexPath.row]

        //self.present(main, animated: true, completion: nil)
        self.navigationController?.pushViewController(main, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       NewsList()
        self.NewsListTableView.dataSource = self
        self.NewsListTableView.delegate = self
    }
    
    func NewsList () {
        let url = "https://newsapi.org/v2/everything?q=tesla&sortBy=publishedAt&apiKey=6216483ae260403d983c71f3efac312a"
        AF.request(url,method: .get).responseJSON{( D ) in
            switch D.result{
            case .success:
                print(D.result)
                
                let myresult = try? JSON(data: D.data!)
                let resultArray = myresult!["articles"]
                
                self.arr_Title.removeAll()
                self.arr_Auther.removeAll()
                self.arr_Content.removeAll()
                self.arr_Description.removeAll()
                self.arr_PublishdAt.removeAll()
                self.arr_UrlToImage.removeAll()
                self.arr_Url.removeAll()
                
                for i in resultArray.arrayValue{
                    
                    let auther = i["author"].stringValue
                    self.arr_Auther.append(auther)
                    
                    let title = i["title"].stringValue
                    self.arr_Title.append(title)
                    
                    let content = i["content"].stringValue
                    self.arr_Content.append(content)
                    
                    let description = i["description"].stringValue
                    self.arr_Description.append(description)
                    
                    let publishAt = i["publishedAt"].stringValue
                    self.arr_PublishdAt.append(publishAt)
                    
                    let urlToimage = i["urlToImage"].stringValue
                    self.arr_UrlToImage.append(urlToimage)
                    
                    let url = i["url"].stringValue
                    self.arr_Url.append(url)
                   
                }
                
                self.NewsListTableView.reloadData()
                break
                
            case .failure:
                break
            }
        }
        
    }
}
