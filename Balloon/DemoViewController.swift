//
//  DemoViewController.swift
//  Balloon
//
//  Created by Hien Quang Tran on 16/12/17.
//  Copyright © 2017 com.hienquangtran.balloon. All rights reserved.
//

import Foundation
import UIKit

class DemoViewController: UITableViewController {
    
    let viewModel = DemoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView() {
        self.tableView.separatorStyle = .singleLine
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 50
        
        if #available(iOS 11, *) {
            self.tableView.contentInsetAdjustmentBehavior = .never
        }
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "BLCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.styles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BLCell", for: indexPath)
        cell.textLabel?.text = viewModel.styles[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            tableView.deselectRow(at: indexPath, animated: true)
            let popupView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
            popupView.backgroundColor = .green
            
            
            BLPopupViewController(popupView: popupView).pop()
            
        default:
            break
        }
    }
    
}
