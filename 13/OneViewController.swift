//
//  oneViewController.swift
//  13
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

/*
限免界面
*/
class OneViewController: NavViewController {

    //数据源数组
    var dataArray = [DataModel]()
    
    //表格
    var tbView : UITableView?
    
    //当前页数
    var curPage :Int = 1
    
    func createTbView(){
        
     tbView = UITableView(frame: CGRectMake(0,0,414, 736-64), style: .Plain)
        
        tbView!.delegate = self
        
        tbView!.dataSource = self
        
        view.addSubview(tbView!)
        
        //下拉刷新
        tbView?.headerView = XWRefreshNormalHeader(target: self, action: "loadFirstPage")
        
        //上拉加载
        tbView?.footerView = XWRefreshAutoNormalFooter(target: self, action: "loadlastPage")
    
        
    }
    func loadFirstPage(){
        
        curPage = 1
        
        downloader()
        
    }
    func loadlastPage(){
        
        curPage += 1
        
        downloader()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        createMyNav()
        
        downloader()
        
        createTbView()
        
    }
    func downloader(){
        
        let urlString = "http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=1"
        
        let down = MyDownloader()
        
        down.delegate = self
        
        down.downloadWithURL(urlString)
        
    }
    func createMyNav(){
        
        addTitleLabel("限免")
        
        addLeftBtn("分类", target: self, action: "backAction")
        
        addRightBtn("设置", target: self, action: "nextAction")
        
    }
    func backAction(){
    
       
    
    
    }
    
    func nextAction(){}
    
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
extension OneViewController:MyDownloaderDelegate{
    
    func downloader(downloader: MyDownloader, didFailWithError error: NSError) {
        
      print(error)
        
    }
    func downloader(downloader: MyDownloader, didFinishWithData data: NSData) {
        
//        let str = NSString(data: data, encoding: NSUTF8StringEncoding)
//        
//        print(str)
        
        //写在下载结束的地方
        if curPage == 1{
            
            dataArray.removeAll()
            
        }
        //JSON 解析
        let result = try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        
        if result.isKindOfClass(NSDictionary){
        
            let dict = result as! Dictionary<String,AnyObject>
            
            let array = dict["applications"] as! Array<Dictionary<String,AnyObject>>
            
            for appDict in array{
            
                let model = DataModel()
                
                model.setValuesForKeysWithDictionary(appDict)
                
                dataArray.append(model)
                
            }
           
        
    }
    
        //回到主线程刷新UI
        dispatch_async(dispatch_get_main_queue()) {
            
            self.tbView?.reloadData()
            
            self.tbView?.headerView?.endRefreshing()
            
            self.tbView?.footerView?.endRefreshing()
            
        }
        
   }
}
//MARK:UITableView的代理
extension OneViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellId = "cellId"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? limitCell
        
        if cell == nil{
            
            cell = NSBundle.mainBundle().loadNibNamed("limitCell", owner: nil, options: nil).last as? limitCell
            
        }
        
        cell?.selectionStyle = .None
        
        //显示数据
        let model = dataArray[indexPath.row]
        
        cell?.config(model, atIndex: indexPath.row+1)
        
        return cell!
        
    }
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 120
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let detailCtl = DetailViewController()
        
        hidesBottomBarWhenPushed = true
        
        navigationController?.pushViewController(detailCtl, animated: true)
        
        hidesBottomBarWhenPushed = false
        
    }
    
    
    
}