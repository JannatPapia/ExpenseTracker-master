//
//  ViewController.swift
//  ExpenseTracker
//
//  Created by Jannatun Nahar Papia  on 24/5/22.
//

//
//  ViewController.swift
//  fileParsingJson
//
//  Created by Jannatun Nahar Papia  on 23/5/22.
//

//import UIKit
//
//class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
//
//    var result: Transaction? // make it global property
//
//    private let tableView: UITableView = {
//        let table = UITableView(frame: .zero,
//                                style: .grouped)
//     table.register(UITableViewCell.self,
//                    forCellReuseIdentifier: "cell")
//    
//    return table
//}()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        parseJSON()
//        view.addSubview(tableView)
//        tableView.frame = view.bounds
//        tableView.delegate = self
//        tableView.dataSource = self
//        // Do any additional setup after loading the view.
//    }
//    
//    
//    //TableView
//    func numberOfSections(in tableView: UITableView) -> Int {
//        
//    //    return result?.data.count ?? 0
//        return date?.data.count ?? 0
//    }
//    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//   //     return result?.data[section].title
//        return date?.data[section].title
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let result = result {
//      //      return result.data[section].items.count
//            return date.data[section].items.count
//
//        }
//        return 0
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let text = result?.data[indexPath.section].items[indexPath.row]
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = text
//        return cell
//    }
//    //JSON
//
//    private func parseJSON() {
//        guard let path = Bundle.main.path(
//            forResource: "data",
//            ofType: "json"
//        ) else {
//            return
//        }
//        let url = URL(fileURLWithPath: path)
//        
//  //      var result: Result?
//        do {
//            let jsonData = try Data(contentsOf: url)
//            result = try JSONDecoder().decode(Result.self, from: jsonData)
//            
//
//        }
//        catch {
//            print("Error: \(error)")
//        }
//    }
//}
