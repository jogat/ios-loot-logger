//
//  ItemStore.swift
//  LootLogger
//
//  Created by Josue Garza Tapia on 11/4/21.
//

import UIKit

class ItemStore {
    var allItems = [Item]()
    
    func removeItem(_ item: Item) {
        if let index = allItems.firstIndex(of: item) {
            allItems.remove(at: index)
        }
    }
    
    func moveItem(from fromIndex: Int, to toIndex: Int) {
        
        if fromIndex == toIndex {
            return
        }
        
        let movedItem = allItems[fromIndex]
        
        allItems.remove(at: fromIndex)        
        allItems.insert(movedItem, at: toIndex)
        
    }
    
    @discardableResult func createItem() ->Item {

        let newItem = Item(random: true)
        allItems.append(newItem)
        
        return newItem
    }
}
