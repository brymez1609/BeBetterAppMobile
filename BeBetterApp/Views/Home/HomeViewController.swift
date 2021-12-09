//
//  ViewController.swift
//  BeBetterApp
//
//  Created by Bryan Andres Gomez Hernandez on 12/9/21.
//

import UIKit
import NotificationBannerSwift
import SVProgressHUD

class HomeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    weak var viewModel = HomeViewModel.shared
    // MARK: - Properties
    private let cellId = "PersonTableViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        SVProgressHUD.show()
        viewModel?.getPeople(handler: { (result) in
            switch result {
                case .success(_):
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        SVProgressHUD.dismiss()
                    }
                case .failure(_):
                    print("error")
                    SVProgressHUD.dismiss()
                }
            })
    }
    
    @objc func onTapCreatePersonButton(sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "showPersonDetail", sender: nil)
    }
    
    @IBAction func registerCells() {
        tableView.register(UINib(nibName: "PersonCell", bundle: nil), forCellReuseIdentifier: "PersonTableViewCell")
    }
    
    func setupUI(){
        tableView.delegate = self
        tableView.dataSource = self
        registerCells()
        self.title = "People"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem (
            barButtonSystemItem: .add,
            target: self,
            action: #selector(onTapCreatePersonButton)
        )

    }
    
    
    private func deletePostAt(indexPath: IndexPath) {
        SVProgressHUD.show()
        guard let cedula = viewModel?.people[indexPath.row].cedula else {return}
        viewModel?.deletePersonAt(cedula: cedula, handler: { (result) in
            SVProgressHUD.dismiss()
            switch result {
            case .success( _):
                
                self.viewModel?.people.remove(at: indexPath.row)
                self.tableView.deleteRows(at: [indexPath], with: .left)
                return
            case .failure(let error):
                NotificationBanner(subtitle: error.localizedDescription, style: .danger).show()
                
                return
            }
        })
    }

    
    
}

extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
       let contextItem = UIContextualAction(style: .destructive, title: "Borrar") {  (contextualAction, view, boolValue) in
           self.deletePostAt(indexPath: indexPath)
       }
       let swipeActions = UISwipeActionsConfiguration(actions: [contextItem])

       return swipeActions
   }

}

extension HomeViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.people.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PersonTableViewCell") as? PersonTableViewCell else {
            return UITableViewCell()
        }
        guard let person = viewModel?.people[indexPath.row] else {
            return UITableViewCell()
        }
        cell.personFullName?.text = "\(person.firstName) \(person.lastName)"
        cell.profession.text = person.profession.name.capitalized
        // let number = pokemon.url.components(separatedBy: "-species/")[1].replacingOccurrences(of: "/", with: "")
        // cell.number.text = number
        // cell.pokeImageView.downloaded(from: API.getPokemonsImagesUrl(game: "platinum", id: number))
        return cell
    }
    
    
}

extension HomeViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPersonDetail", let personViewController = segue.destination as? PersonViewController {
           // mapViewController.posts = dataSource.filter { $0.hasLocation }
        }
    }
}
