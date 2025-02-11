//
//  TableViewConfiguration.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import UIKit

extension UITableView {
    
    func register<T: UITableViewCell>(cellClass: T.Type) {
        let identifier = String(describing: T.self)
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(with: T.Type) {
        let identifier = String(describing: T.self)
        register(.init(nibName: identifier, bundle: .main), forHeaderFooterViewReuseIdentifier: identifier)
    }

    func dequeue<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
        let identifier = String(describing: T.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? T else {
            fatalError("Error in cell")
        }
        return cell
    }
    
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(with type: T.Type) -> T {
        let identifier = String(describing: T.self)
        guard let header = dequeueReusableHeaderFooterView(withIdentifier: identifier) as? T else {
            fatalError("Error in cell")
        }
        return header
    }
}
