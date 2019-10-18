//
//  TableViewExtension.swift
//  Test Application
//
//  Created by Vaibhav Mehta on 17/10/19.
//  Copyright © 2019 TDH. All rights reserved.
//
//
//import Foundation
//
//extension HomeVC: UITableViewDelegate, UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return arrData.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
//
//        let sell = arrData[indexPath.row]
//
//        cell.textLabel?.text = "NAME : \(sell.name)   PRICE: \(sell.price)"
//
//        return cell
//    }
//}
