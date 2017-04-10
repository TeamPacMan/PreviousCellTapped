//
//  ViewController.swift
//  PreviousCell
//
//  Created by André Vellori on 10/04/2017.
//  Copyright © 2017 André Vellori. All rights reserved.
//

import UIKit

class SomeDataSourceAndDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {
    var lastSelectedCells = [IndexPath]()
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NiceCell") as? MyBeautifulCell else {
            fatalError("Table Configuration Error!")
        }
        if let index = lastSelectedCells.index(of: indexPath) {
            cell.centeredLabel?.text = "Cell tapped \(index) times ago!"
        } else {
            cell.centeredLabel?.text = "Uhmpf, this cell was never tapped!"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        lastSelectedCells.insert(indexPath, at: 0)
        tableView.reloadRows(at: lastSelectedCells, with: .automatic)
    }
}


class MyBeautifulCell: UITableViewCell {
    @IBOutlet weak var centeredLabel: UILabel?
    
    override func prepareForReuse() {
        super.prepareForReuse()
        centeredLabel?.text = ""
    }
}
