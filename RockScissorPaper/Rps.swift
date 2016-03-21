//
//  Rps.swift
//  石头剪刀布
//
//  Created by 赵晓东 on 16/3/17.
//  Copyright © 2016年 ZXD. All rights reserved.
//

import Foundation

//结构体
struct Rps {
    private var stat:Stats!
    
    //枚举
    enum Stats {
        case Rock
        case Scissor
        case Paper
    }
    
    func getStats() -> Stats {
        return stat
    }
    
    mutating func setStats(stats:Stats!) {
        stat = stats
    }
    
    func radomRps() -> Stats {
        //生成一个随机的手势
        let randomNumber:Int = Int(arc4random_uniform(3))
        var randomStat:Stats!
        switch randomNumber {
        case 0:
            randomStat = .Rock
        case 1:
            randomStat = .Scissor
        case 2:
            randomStat = .Paper
        default:
            print("Error!")
        }
        return randomStat
    }
    
    func compare (aRpsStat:Stats,anotherRpsStat:Stats) -> Int {
        //返回三种状态,0为前者输；1为前者赢；2为平局
        var result:Int!
        switch aRpsStat {
        case .Rock:
            switch anotherRpsStat {
            case .Rock:
                result = 2
            case .Scissor:
                result = 1
            case .Paper:
                result = 0
            }
        case .Scissor:
            switch anotherRpsStat {
            case .Rock:
                result = 0
            case .Scissor:
                result = 2
            case .Paper:
                result = 1
            }
        case .Paper:
            switch anotherRpsStat {
            case .Rock:
                result = 1
            case .Scissor:
                result = 0
            case .Paper:
                result = 2
            }
        }
        return result
    }
    
}