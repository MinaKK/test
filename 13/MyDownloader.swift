//
//  MyDownloader.swift
//  13
//
//  Created by qianfeng on 16/9/26.
//  Copyright © 2016年 SunPiaoLiang. All rights reserved.
//

import UIKit

protocol MyDownloaderDelegate:NSObjectProtocol{
    
    //下载成功
    func downloader(downloader:MyDownloader,didFailWithError error:NSError)
    
    //下载失败
    func downloader(downloader:MyDownloader,didFinishWithData data:NSData)
    
}

class MyDownloader: NSObject {

    weak var delegate : MyDownloaderDelegate?
    
    func downloadWithURL(urlString:String){
    
        let url = NSURL(string:urlString)
        
        let request = NSURLRequest(URL: url!)
        
        let session = NSURLSession.sharedSession()
        
        let task = session.dataTaskWithRequest(request) { (data, response, error)  in
            
            if let tmpError = error{
                
                self.delegate?.downloader(self, didFailWithError: tmpError)
                
            }else{
                
                let httpResponse = response as! NSHTTPURLResponse
                
                if httpResponse.statusCode == 200{
                    
                    self.delegate?.downloader(self, didFinishWithData: data!)
                }else{
                    
                    let err = NSError(domain: urlString, code: httpResponse.statusCode, userInfo: ["msg":"下载失败"])
                    
                    self.delegate?.downloader(self, didFailWithError: err)
                    
                }
            }
        }
        
        task.resume()
    }
    
}
