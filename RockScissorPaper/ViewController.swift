//
//  ViewController.swift
//  RockScissorPaper
//
//  Created by 赵晓东 on 16/3/18.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let WIDTH = UIScreen .mainScreen().bounds.size.width //屏幕宽度
    
    let HEIGHT = UIScreen .mainScreen().bounds.size.height //屏幕高度
    
    var rps = Rps()
    
    var createControl = ZCControl()
    
    var LabelUp: UILabel!
    var LabelDown: UILabel!
    var RockButton: UIButton!//石头
    var ScissorButton: UIButton!//剪刀
    var PaperButton: UIButton!//布
    var AgainButton: UIButton!//重置
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        LabelUp = createControl.createLabel(CGRect(x:20, y:40 ,width:(WIDTH-40), height:40), Font: 20, Text: "准备好了吗？")
        LabelUp.textColor = UIColor.grayColor()
        LabelUp.textAlignment = NSTextAlignment.Center
        self.view.addSubview(LabelUp);
        
        
        LabelDown = createControl.createLabel(CGRect(x:20, y:100 ,width:(WIDTH-40), height:40), Font: 14, Text: "按下你的选择吧：")
        LabelDown.textColor = UIColor.grayColor()
        LabelDown.textAlignment = NSTextAlignment.Center
        self.view.addSubview(LabelDown);
        
        
        RockButton = createControl.createButton(CGRect(x:20, y:160 ,width:(WIDTH-40)/3, height:40), Text: "👊", ImageName: "", bgImageName: "", Target: self, Method: Selector("RockButtonClick"))
        self.view.addSubview(RockButton);
        
        ScissorButton = createControl.createButton(CGRect(x:20+(WIDTH-40)/3, y:160 ,width:(WIDTH-40)/3, height:40), Text: "✌️", ImageName: "", bgImageName: "", Target: self, Method: Selector("ScissorButtonClick"))
        self.view.addSubview(ScissorButton);
        
        PaperButton = createControl.createButton(CGRect(x:20+(WIDTH-40)/3*2, y:160 ,width:(WIDTH-40)/3, height:40), Text: "✋", ImageName: "", bgImageName: "", Target: self, Method: Selector("PaperButtonClick"))
        self.view.addSubview(PaperButton);
        
        
        AgainButton = createControl.createButton(CGRect(x:20, y:210 ,width:WIDTH-40, height:40), Text: "重新来过", ImageName: "", bgImageName: "", Target: self, Method: Selector("AgainButtonClick"))
        AgainButton.setTitleColor(UIColor.grayColor(), forState: UIControlState.Normal)
        self.view.addSubview(AgainButton);
        
        
        let imageView = createControl.createImageView(CGRect(x:20, y:280 ,width:WIDTH-40, height:100), ImageName:"")
        self.view.addSubview(imageView)
        imageView.backgroundColor = UIColor.blueColor()
        //imageView.userInteractionEnabled = false
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "imagePathClick"))
        
        
        let textFeild = createControl.createTextField(CGRect(x:20, y:380 ,width:WIDTH-40, height:30), placeholder: "请输入文字", passWord: false, Font: 14)
        self.view.addSubview(textFeild)
    }
    
    func imagePathClick () {
        print("1211211")
    }
    
    
    //点击石头
    func RockButtonClick () {
        rps.setStats(.Rock)
        judgement()
    }
    
    //点击剪刀
    func ScissorButtonClick () {
        rps.setStats(.Scissor)
        judgement()
    }
    
    //点击布
    func PaperButtonClick () {
        rps.setStats(.Paper)
        judgement()
    }
    
    //重置
    func AgainButtonClick () {
        resetAll()
    }
    
    
    
    
    //全局初始化
    func resetAll () {
        LabelUp.text = ""
        LabelDown.text = ""
        rps.setStats(nil)
    }
    
    //判断输赢
    func judgement () {
        let randomrps = rps.radomRps()
        let currentStat = rps.getStats()
        let result = rps.compare(currentStat, anotherRpsStat: randomrps)
        screen(result, stat: currentStat, anotherStat: randomrps)
    }
    
    //控制显示的方法
    func screen (result:Int,stat:Rps.Stats,anotherStat:Rps.Stats) {
        var resultString = ""
        var statString = ""
        var anotherString = ""
        
        switch result {
        case 0:
            resultString = "输"
        case 1:
            resultString = "赢"
        case 2:
            resultString = "竟然平局"
        default:
            resultString = "真是醉了"
        }
        
        switch stat {
        case.Rock:
            statString = "👊"
        case.Scissor:
            statString = "✌️"
        case.Paper:
            statString = "✋"
        }
        
        switch anotherStat {
        case.Rock:
            anotherString = "👊"
        case.Scissor:
            anotherString = "✌️"
        case.Paper:
            anotherString = "✋"
        }
        
        LabelUp.text = "你" + resultString + "了!"
        LabelDown.text = "你出了" + statString + "，但电脑出了" + anotherString + "！"
        
    }
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

