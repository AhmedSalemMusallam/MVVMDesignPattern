//
//  ViewController.swift
//  MVVMDesignPattern
//
//  Created by Ahmed Salem on 06/04/2023.
//

import UIKit


class ViewController: UIViewController {

    
    //Mark:- Variables
    private var persons = [Person]()
    //Mark:- tableView
    private let tableView : UITableView = {
       let table = UITableView()
        table.register(
            PersonFollowingTableViewCell.self,
            forCellReuseIdentifier: PersonFollowingTableViewCell.identifier
        )
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "MVVM HOME"
        
        //configure model function call
        configureModels()
        //adding table to the view
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        //defining the table view layout
        tableView.frame = view.bounds
    }


}

//Mark:- extension for ui table view delegation and data source
extension ViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PersonFollowingTableViewCell.identifier,
            for: indexPath) as? PersonFollowingTableViewCell else{
           return UITableViewCell()
       }
        
        cell.configure(with: PersonFollowingTableViewCellViewModel(with: persons[indexPath.row]))
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        persons.count
    }
    
}

//Mark:- for configure models
extension ViewController
{
    private func configureModels()
    {
        let names = [
            "Ahmed","Mohamed", "Ali", "Mansour", "Waleed"
        ]
        
        for name in names{
            persons.append(Person(name: name))
        }
    }
}

//Mark:- for PersonFollowingTableViewCellDelegate
extension ViewController : PersonFollowingTableViewCellDelegate
{
    func personFollowingTableViewCell(_ cell: PersonFollowingTableViewCell, didTapWith viewModel: PersonFollowingTableViewCellViewModel) {
        
        var newViewModel = viewModel
        newViewModel.currentlyFollowing = !viewModel.currentlyFollowing
     
        cell.prepareForReuse()
        cell.configure(with: newViewModel)
    }
    
    
}

