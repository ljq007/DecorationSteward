//
//  BudgetArchiver.swift
//  DecorationSteward
//
//  Created by ruby on 14-11-24.
//  Copyright (c) 2014年 ruby. All rights reserved.
//

import Foundation

class BudgetArchiver {
    var userDefault: NSUserDefaults = NSUserDefaults()
    var budgetKey: String = "budgets"
    
    // 序列化获取budgets
    func getBudgetsFromUserDefault() -> Array<BudgetItem> {
        
        var encodedBudgets: NSData? = userDefault.objectForKey(budgetKey) as? NSData
        if nil == encodedBudgets {
            return Array<BudgetItem>()
        }
        
        var budgets = NSKeyedUnarchiver.unarchiveObjectWithData(encodedBudgets!) as Array<BudgetItem>
        println("getBudgetsFromUserDefault() count = \(budgets.count)")
        
        return budgets
    }
    
    // 序列化存储budgets
    func saveBudgetsToUserDefault(budgets: Array<BudgetItem>) -> Void {
        var archivedBudgets = NSKeyedArchiver.archivedDataWithRootObject(budgets)
        userDefault.setObject(archivedBudgets, forKey: budgetKey)
        userDefault.synchronize()
        println("saveBudgetsToUserDefault() count = \(budgets.count)")
    }
}