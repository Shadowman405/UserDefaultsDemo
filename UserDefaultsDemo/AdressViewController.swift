//
//  AdressViewController.swift
//  UserDefaultsDemo
//
//  Created by Maxim Mitin on 25.10.21.
//

import UIKit

class AdressViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }

}

extension AdressViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Base.shared.adresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        if let dCell = tableView.dequeueReusableCell(withIdentifier: "dCell"){
            cell = dCell
        } else {
            cell = UITableViewCell()
        }
        
        cell.textLabel?.text = Base.shared.adresses[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
