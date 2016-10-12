//
//  3ViewController.swift
//  13
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit
/*
免费界面
*/
class ThreeViewController: NavViewController {

    //数据源数组
    lazy var dataArray = [DataModel]()
    
    //表格
    var tbView: UITableView?
    
    func createTbView(){
        
        tbView = UITableView()
        
        tbView?.delegate = self
        
        tbView?.dataSource = self
        
        view.addSubview(tbView!)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createNav()
        
        downloadData()
        
        createTbView()
        
    }
    //下载数据
    func downloadData(){
        
        let urlString = "http://iappfree.candou.com:8080/free/applications/free?currency=rmb&page=1"
        
        let down = MyDownloader()
        
        down.delegate = self
        
        down.downloadWithURL(urlString)
        
    }
    //导航
    func createNav(){
        
        addTitleLabel("免费")
        
        addLeftBtn("分类", target: self, action: "gotoCategory")
        
        addRightBtn("设置", target: self, action: "gotoSetPage")
        
    }
    func gotoCategory(){}
    
    func gotoSetPage(){}

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
//MARK:MyDownloader的代理
extension ThreeViewController:MyDownloaderDelegate{
    
    func downloader(downloader: MyDownloader, didFailWithError error: NSError) {
        
        print(error)
    }
    func downloader(downloader: MyDownloader, didFinishWithData data: NSData) {
        
//        let str = NSString(data: data, encoding: NSUTF8StringEncoding)
//        
//        print(str)

        //JSON解析
        let result = try!NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        
        if result.isKindOfClass(NSDictionary){
            
            let dict = result as! Dictionary<String,AnyObject>
            
            let array = dict["applications"] as! Array<Dictionary<String,AnyObject>>
            
            for appDict in array{
                
                let model = DataModel()
                
                model.setValuesForKeysWithDictionary(appDict)
                
                dataArray.append(model)
                
//                print(model.name)
                
           }
            //回到主线程刷新UI
            dispatch_async(dispatch_get_main_queue(), {
                
                self.tbView?.reloadData()
                
            })
            
        }
        
    }
    
}
//MARK:UITableView的代理
extension ThreeViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 120
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
        let cellId = "freeCellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? FreeCell
        
        if cell == nil{
            
           cell = NSBundle.mainBundle().loadNibNamed("FreeCell", owner: nil, options: nil).last as? FreeCell
            
        }
        
        //显示数据
        let model = dataArray[indexPath.row] 
        
        cell?.config(model, atIndex: indexPath.row)
        
        return cell!
        
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailCtl = DetailViewController()
        
        hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(detailCtl, animated: true)
        
        hidesBottomBarWhenPushed = false
        
    }


}