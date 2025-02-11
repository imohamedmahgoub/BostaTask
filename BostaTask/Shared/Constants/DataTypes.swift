//
//  DataTypes.swift
//  BostaTask
//
//  Created by Mohamed Mahgoub on 06/02/2025.
//

import UIKit
import Combine
import Moya

typealias TableViewConfig = UITableViewDelegate & UITableViewDataSource
typealias CollectionViewConfig = UICollectionViewDelegate & UICollectionViewDataSource

typealias Cancellable = Set<AnyCancellable>
typealias Provider = MoyaProvider<APINetwork>
