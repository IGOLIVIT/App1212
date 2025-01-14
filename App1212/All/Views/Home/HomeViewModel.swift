//
//  HomeViewModel.swift
//  App1212
//
//  Created by IGOR on 13/01/2025.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @AppStorage("balance") var balance: Int = 0
    @AppStorage("goal") var goal: Int = 0

    @Published var pics: [String] = ["s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8"]
    @Published var curPic = ""

    @Published var isAddAcc: Bool = false
    @Published var isAddGoal: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDetailGoal: Bool = false
    @Published var isDeleteAcc: Bool = false
    @Published var isDeleteGoal: Bool = false

    @Published var acName: String = ""
    @Published var acPrice: String = ""
    @Published var acDescr: String = ""
    
    @Published var accums: [AccumModel] = []
    @Published var selectedAccum: AccumModel?
    
    func addAccum() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "AccumModel", into: context) as! AccumModel
        
        loan.acName = acName
        loan.acPrice = acPrice
        loan.acDescr = acDescr
        
        CoreDataStack.shared.saveContext()
    }
    
    func fetchAccums() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<AccumModel>(entityName: "AccumModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.accums = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.accums = []
        }
    }
    
    @Published var gName: String = ""
    @Published var gPrice: String = ""
    @Published var gDescr: String = ""
    @Published var gPhoto: String = ""

    @Published var goals: [GoalModel] = []
    @Published var selectedGoal: GoalModel?
    
    func addGoal() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "GoalModel", into: context) as! GoalModel
        
        loan.gName = gName
        loan.gPrice = gPrice
        loan.gDescr = gDescr
        loan.gPhoto = gPhoto

        CoreDataStack.shared.saveContext()
    }
    
    func fetchGoals() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<GoalModel>(entityName: "GoalModel")
        
        do {
            
            let result = try context.fetch(fetchRequest)
            
            self.goals = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.goals = []
        }
    }
}
