//
//  MainViewController.swift
//  DemoXibViewController
//
//  Created by PSL on 4/24/17.
//  Copyright © 2017 PSL. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - View
    weak var tableView: UITableView?
    
    // MARK: - Constants
    struct Constants {
        static let selfNib = "MainViewController"
        static let newsFeedCellID = "NewsFeedTableViewCell"
        static let newsFeedCellHeight: CGFloat = 200
        static let sectionNum = 1
        static let rowNum = 10
    }
    
    // MARK: - Init
    init() {
        super.init(nibName: Constants.selfNib, bundle: nil)
        self.title = Constants.selfNib
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("initCoder is not implemented")
    }
    convenience init(title: String) {
        self.init()
        self.title = title
    }
}

// MARK: - LifeCycle
extension MainViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //tableView = initTableViewWithAutoResizing(to: self.view)
        tableView = initTableViewWithAutoLayout(to: self.view)
    }
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.sectionNum
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.rowNum
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.newsFeedCellID, for: indexPath)
        if let validCell = cell as? NewsFeedTableViewCell {
            return validCell
        }
        return UITableViewCell()
    }
}

// MARK: - Mehtods
extension MainViewController {
    func initTableViewWithAutoResizing(to superView: UIView?) -> UITableView? {
        guard let superView = superView else {
            assert(false, "MainVC: tableView cannot be inited wihtout SuperView")
            return nil
        }
        let tableView = UITableView(frame: superView.bounds, style: .plain)
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // registering xib cells
        tableView.register(UINib(nibName: Constants.newsFeedCellID, bundle: nil), forCellReuseIdentifier: Constants.newsFeedCellID)
        // setting auto height
        tableView.estimatedRowHeight = Constants.newsFeedCellHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        // setting colors
        tableView.backgroundColor = UIColor.white
        // setting delegate/datasource
        tableView.delegate = self
        tableView.dataSource = self
        // adding to superView
        superView.addSubview(tableView)
        return tableView
    }
    func initTableViewWithAutoLayout(to superView: UIView?) -> UITableView? {
        guard let superView = superView else {
            assert(false, "MainVC: tableView cannot be inited wihtout SuperView")
            return nil
        }
        let initFrame = CGRect(x: 0, y: 0, width: 0, height: 0)
        let tableView = UITableView(frame: initFrame, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        // registering xib cells
        tableView.register(UINib(nibName: Constants.newsFeedCellID, bundle: nil), forCellReuseIdentifier: Constants.newsFeedCellID)
        // setting auto height
        tableView.estimatedRowHeight = Constants.newsFeedCellHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        // setting colors
        tableView.backgroundColor = UIColor.white
        // setting delegate/datasource
        tableView.delegate = self
        tableView.dataSource = self
        // adding to superView
        superView.addSubview(tableView)
        // adding autolayout
        addConstraints(for: tableView, to: superView)
        return tableView
    }
    private func addConstraints(for subview: UITableView, to superView: UIView) {
        let top = NSLayoutConstraint(item: subview, attribute: .top, relatedBy: .equal, toItem: superView, attribute: .top, multiplier: 1.0, constant: 0)
        let bottom = NSLayoutConstraint(item: subview, attribute: .bottom, relatedBy: .equal, toItem: superView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let leading = NSLayoutConstraint(item: subview, attribute: .leading, relatedBy: .equal, toItem: superView, attribute: .leading, multiplier: 1.0, constant: 0)
        let trailing = NSLayoutConstraint(item: subview, attribute: .trailing, relatedBy: .equal, toItem: superView, attribute: .trailing, multiplier: 1.0, constant: 0)
        superView.addConstraints([top, bottom, leading, trailing])
    }
}
