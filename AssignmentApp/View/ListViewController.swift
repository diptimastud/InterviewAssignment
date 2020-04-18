//
//  ViewController.swift
//  AssignmentApp
//
//  Created by Dipti Mastud on 4/15/20.
//  Copyright © 2020 Dipti Mastud. All rights reserved.
//

import UIKit
import MBProgressHUD

class ListViewController: UITableViewController, AppDisplayable {
    
    // MARK: - Variable declaration and initialization -
    
    let cellId = "cellId"
    var countryDetails : [CountryDetail]  = [CountryDetail]()
    var refresher = UIRefreshControl()
    var listViewModel = ListViewModel()
    
    // MARK: - View Lifecycle Methods -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeView()
        self.getCountryDetails()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Methods -
    
    func initializeView() {
        self.tableView.register(CustomCell.self, forCellReuseIdentifier: cellId)
        self.tableView.estimatedRowHeight = UITableView.automaticDimension
        self.tableView.rowHeight = UITableView.automaticDimension
        
        // setup refresh control
        self.refresher.tintColor = UIColor.red
        self.refresher.addTarget(self, action: #selector(getCountryDetails), for: .valueChanged)
        self.tableView.addSubview(self.refresher)
    }
    
    @objc func getCountryDetails() {
        self.countryDetails.removeAll()
        self.tableView.reloadData()
        self.showHUD(progressLabel: "Loading...")
        listViewModel.getCountryDetails { (countyDetails, error) in
            DispatchQueue.main.async {
                self.refresher.endRefreshing()
                self.dismissHUD(isAnimated: true)
                if error != nil {
                    self.showMessage(title: "Error", message: error?.localizedDescription ?? error.debugDescription)
                    return
                }
                if countyDetails != nil {
                    self.countryDetails = countyDetails?.rows ?? []
                    
                    //Filter null values
                    self.countryDetails = self.countryDetails.filter({ (countryDetail) -> Bool in
                        return countryDetail.title != nil
                    })
                    
                    self.title = countyDetails?.title
                    self.tableView.reloadData()
                }
            }
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource Methods -
extension ListViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! CustomCell
        let countryDetail = self.countryDetails[indexPath.row]
        cell.setUpCellForCountryDetail(countryDetail: countryDetail)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countryDetails.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 1))
    }
}
