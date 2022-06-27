//
//  ListingsViewController.swift
//  TechnicalTest
//
//  Created by Gisselle Sanchez on 26/06/22.
//

import UIKit

class ListingsViewController: UIViewController {
    
    //MARK: - Variables
    
    @IBOutlet weak var listingsTableView: UITableView!
    let viewModel = ListingsViewModel()
    let listingCellIdentifier = "ListingCell"
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupNavigationBar()

    }
    
    //MARK: - Setup
    func setup() {
        listingsTableView.register(UINib(nibName: listingCellIdentifier, bundle: Bundle.main), forCellReuseIdentifier: listingCellIdentifier)

        viewModel.getListings { [weak self] success in
            if success {
                self?.listingsTableView.reloadData()
            }
        }
    }
    
    func setupNavigationBar() {
        let searchButton =  UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(searchTapped))
        let cartButton = UIBarButtonItem(image: UIImage(named: "cart"), style: .plain, target: self, action: #selector(cartTapped))
        navigationController?.navigationBar.tintColor = UIColor(named: "tintColor")
        navigationItem.rightBarButtonItems = [cartButton, searchButton]
    }
    
    //MARK: - Events
    @objc func searchTapped() {
        let alert = UIAlertController(title: "Search", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion:nil)
    }
    
    @objc func cartTapped() {
        let alert = UIAlertController(title: "Cart", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion:nil)
    }
}

//MARK: - UITableViewDataSource
extension ListingsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listings.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListingCell = tableView.dequeueReusableCell(withIdentifier: listingCellIdentifier) as! ListingCell
        cell.setup(item: viewModel.listings[indexPath.row])
        return cell
    }
}

//MARK: - UITableViewDelegate
extension ListingsViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.listings[indexPath.row]
        let alert = UIAlertController(title: "Item", message: item.title, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion:nil)
    }

}
