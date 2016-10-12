//
//  DetailViewController.swift
//  13
//
//  Created by qianfeng on 16/9/29.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit
/*
详情界面
*/
class DetailViewController: NavViewController {

    //数据源数组
    lazy var dataArray = [DetailModel]()
    
    //表格
    var tbView : UITableView?
    
    //详情的数据
    private var detailModel:DetailModel?
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    @IBOutlet weak var freeLabel: UILabel!
    
    @IBOutlet weak var dataLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var starLabel: UILabel!
    
    @IBOutlet weak var shareButton: UIButton!
    
    @IBOutlet weak var iconImageView: UIImageView!
    
    @IBOutlet weak var getButton: UIButton!
    
    @IBOutlet weak var downButton: UIButton!
    
    @IBOutlet weak var imageScrollView: UIScrollView!
    
    @IBOutlet weak var descLabel: UILabel!
    
    @IBOutlet weak var appScrollView: UIScrollView!
    
    @IBAction func shareButtonAction() {
    }
    
    
    @IBAction func getButtonAction() {
    }
    
    
    @IBAction func downButtonAction() {
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createNav()
        
        downloadData()


    }
    //下载数据
    func downloadData(){
        
        let urlString = "http://iappfree.candou.com:8080/free/applications/561692374?currency=rmb"
        let down = MyDownloader()
        
        down.delegate = self
        
        down.downloadWithURL(urlString)
        
        
    }
    //创建导航
    func createNav(){
        
        addTitleLabel("应用详情")
        
        addBackBtn("返回", target: self, action: "backAction")
        
    }
    func backAction(){
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //显示详情数据
    func showDetail(){
        
        //图片
        let url = NSURL(string: (detailModel?.iconUrl)!)

        iconImageView.kf_setImageWithURL(url!)
        
        //名字
        nameLabel.text = detailModel?.name
        
        //价格
        priceLabel.text = "原价:￥" + (detailModel?.lastPrice)!
        
        //状态
        if detailModel?.priceTrend == "limited"{
         
            freeLabel.text = "限免中"
            
        }
        //流量
        dataLabel.text = (detailModel?.fileSize)! + "MB"
        
        //类型
        typeLabel.text = detailModel?.categoryName
        
        //评分
        starLabel.text = "评分:"+((detailModel?.starCurrent)!)
        
        //app截图
        let cnt = detailModel?.photos?.count
        let imageH: CGFloat = 80   //图片的高度
        let imageW: CGFloat = 80   //图片的宽度
        let marginX: CGFloat = 10  //图片的横向间距
        for i in 0..<cnt!{
            
            //循环创建图片，显示到滚动视图上面
            let frame = CGRectMake((imageW+marginX)*CGFloat(i), 0, imageW, imageH)
            let tmpImageView = UIImageView(frame: frame)
            //图片
            let pModel = detailModel?.photos![i]
            let url = NSURL(string: (pModel?.smallUrl)!)
            tmpImageView.kf_setImageWithURL(url!)
            
            //添加手势
            let g = UITapGestureRecognizer(target: self, action:"tapImage:")
            tmpImageView.userInteractionEnabled = true
            tmpImageView.addGestureRecognizer(g)
            //设置tag值
            tmpImageView.tag = 100+i
            imageScrollView.addSubview(tmpImageView)
        }
        
        //设置滚动范围
        imageScrollView.contentSize = CGSizeMake((imageW+marginX)*CGFloat(cnt!), 0)
        
        //9.描述文字
        descLabel.text = detailModel!.desc
    
    }
    func tapImage(g:UIGestureRecognizer){
        
        
    }
    

   }
//MARK:MyDownloader的代理
extension DetailViewController:MyDownloaderDelegate{
    
    func downloader(downloader: MyDownloader, didFailWithError error: NSError) {
        
        print(error)
        
    }
    func downloader(downloader: MyDownloader, didFinishWithData data: NSData) {
        
        let str = NSString(data: data, encoding: NSUTF8StringEncoding)
        
        print(str)
        
        //JSON解析
        let result = try!NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        
        if result.isKindOfClass(NSDictionary){


            let dict = result as! Dictionary<String,AnyObject>
            
            detailModel = DetailModel()
            
            detailModel?.setValuesForKeysWithDictionary(dict)
            //将photo里面的字典转换成对象
            var pArray = Array<Photos>()
            
            for pDict in (dict["photos"] as! NSArray){
                
                let model = Photos()
                
                model.setValuesForKeysWithDictionary(pDict as! [String:AnyObject])
                
                pArray.append(model)
                
                
            }
            detailModel?.photos = pArray
            
            //回到主线程刷新UI
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                
                self.tbView?.reloadData()
                
            })

       }
        
    }
    
}
