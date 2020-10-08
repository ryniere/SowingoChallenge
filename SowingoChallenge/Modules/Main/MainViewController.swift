//
//  MainViewController.swift
//  SowingoChallenge
//
//  Created by Ryniere dos Santos Silva on 2020-10-07.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupConstraints()
        view.backgroundColor = .blue
        
    }
    
    // MARK: - Setting Views
    private func setupViews() {
        view.addSubview(tableView)
    }
    
    // MARK: - Setting Constraints
    private func setupConstraints() {
      let safeArea = view.safeAreaLayoutGuide

      NSLayoutConstraint.activate([
        tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
        tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
        tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
        tableView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor),
      ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
