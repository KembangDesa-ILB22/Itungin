//
//  OverViewController.swift
//  Itungin
//
//  Created by Hastomi Riduan Munthe on 20/02/23.
//

import UIKit

class OverViewController: UIViewController {
    
    let tabBar = UITabBarController()
    
    let balanceTotal = UIView()
    let labelBalance = UILabel()
    let totalBalance = UILabel()
    var labelIdr = UILabel()
    var totalIdr = UILabel()
    var tableView = UITableView()
    var labelDate = UILabel()
    
    let buttonNext = UIButton()
    let buttonPrevious = UIButton()
    
    
    let mySegmentedControl = UISegmentedControl (items: ["IDR 4,000,000\nExpenses","IDR 10,000,000\nIncomes"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = "Overview"
        
        view.addSubview(balanceTotal)
        
        kolomBalance()
        segmentedControl()
        configureTableView()
        dateFormat()
        getNextMonth()
        getPreviousMonth()
//        tab()
    }
    
    func tab(){
        self.view.addSubview(tabBar.view)

        let firstVC = UIViewController()
        let secondVC = UIViewController()

        let item1 = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        let item2 = UITabBarItem(tabBarSystemItem: .downloads, tag: 1)

        firstVC.tabBarItem = item1
        secondVC.tabBarItem = item2

        tabBar.viewControllers = [firstVC,secondVC]
    }
    
    func segmentedControl() {
        view.addSubview(mySegmentedControl)
        
        //Untuk membuat multiline string in segmented
        UILabel.appearance(whenContainedInInstancesOf: [UISegmentedControl.self]).numberOfLines = 0
        
        // Make second segment selected
        mySegmentedControl.selectedSegmentIndex = 1
        //Change UISegmentedControl background colour
        mySegmentedControl.backgroundColor = UIColor.systemGray
        // Add function to handle Value Changed events
//        mySegmentedControl.addTarget(self, action: #selector(self.segmentedValueChanged(_:)), for: .valueChanged)
//
        mySegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mySegmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mySegmentedControl.topAnchor.constraint(equalTo: view.topAnchor, constant: 370),
            mySegmentedControl.widthAnchor.constraint(equalToConstant: 350),
            mySegmentedControl.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func dateFormat() {
        view.addSubview(labelDate)
        let date = Date()
        
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.locale = .current
        formatter.dateFormat = "MMMM yyyy"
        
        labelDate.text = formatter.string(from: date)
        labelDate.textColor = .black
        labelDate.translatesAutoresizingMaskIntoConstraints = false
        
        print("tanggalskrng")
        NSLayoutConstraint.activate([
            labelDate.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 50),
            labelDate.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            labelDate.widthAnchor.constraint(equalToConstant: 200),
            labelDate.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    
    func getNextMonth() {
        view.addSubview(buttonNext)
        let imageNext = UIImage(named: "turnright")
        buttonNext.setImage(imageNext, for: .normal)
        print("say")
        buttonNext.addTarget(self, action: #selector(buttonActionNext), for: .touchUpInside)

        buttonNext.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonNext.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant:  100),
            buttonNext.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            buttonNext.widthAnchor.constraint(equalToConstant: 20),
            buttonNext.heightAnchor.constraint(equalToConstant: 20),
        ])

        
        }
    
    @objc func buttonActionNext() {
        
    }
                
    func getPreviousMonth() {
        view.addSubview(buttonPrevious)
        let imageNext = UIImage(named: "turnright")
        buttonPrevious.setImage(imageNext, for: .normal)
        print("say1")
        buttonPrevious.addTarget(self, action: #selector(buttonActionPrevs), for: .touchUpInside)

        buttonPrevious.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonPrevious.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant:  -100),
            buttonPrevious.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            buttonPrevious.widthAnchor.constraint(equalToConstant: 20),
            buttonPrevious.heightAnchor.constraint(equalToConstant: 20),
        ])
        
            //        return Calendar.current.date(byAdding: .month, value: -1,  to: labelDate
        }
    
    @objc func buttonActionPrevs() {
        
    }

                             
    func kolomBalance() {
            balanceTotal.addSubview(labelBalance)
            balanceTotal.addSubview(labelIdr)
            balanceTotal.addSubview(totalBalance)
            balanceTotal.addSubview(totalIdr)
            
            balanceTotal.backgroundColor = .cyan

            balanceTotal.layer.cornerRadius = 10
            balanceTotal.layer.borderWidth = 1
            
            labelBalance.text = "This Month Balance"
            labelBalance.textColor = .black
            labelBalance.frame = CGRect(x: 10, y: 10, width: 200, height: 20)
            
            labelIdr.text = "IDR \("6,000,000")"
            labelIdr.textColor = .black
            labelIdr.textAlignment = .center
            labelIdr.font = .boldSystemFont(ofSize: 25)
            labelIdr.frame = CGRect(x: 0, y: 70, width: 350, height: 20)
            
            totalBalance.text = "Total Balance"
            totalBalance.textColor = .black
            totalBalance.font = .systemFont(ofSize: 14)
            totalBalance.frame = CGRect(x: 10, y: 130, width: 200, height: 20)
            
            totalIdr.text = "IDR \("36,000,000")"
            totalIdr.font = .italicSystemFont(ofSize: 14)
            totalIdr.textColor = .black
            totalIdr.frame = CGRect(x: 230, y: 130, width: 200, height: 20)
            
            balanceTotal.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                balanceTotal.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                balanceTotal.topAnchor.constraint(equalTo: view.topAnchor, constant: 190),
                balanceTotal.widthAnchor.constraint(equalToConstant: 350),
                balanceTotal.heightAnchor.constraint(equalToConstant: 160)
            ])
            
        }
                             
    func configureTableView() {
            view.addSubview(tableView)
            setTableViewDelegates()
            tableView.rowHeight = 100
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.layer.cornerRadius = 10
            
//        tableView.register(CategoryItemCollectionViewCell.self, forCellReuseIdentifier: "CategoryItemCollectionViewCell")
            
            NSLayoutConstraint.activate([
                tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 440),
                tableView.widthAnchor.constraint(equalToConstant: 350),
                tableView.heightAnchor.constraint(equalToConstant: 300)
            ])
            
            
        }
                             
    func setTableViewDelegates() {
            tableView.delegate = self
            tableView.dataSource = self
            
        }
                             }
                             
extension OverViewController: UITableViewDelegate, UITableViewDataSource {
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return 3
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                //        let cell = tableView.dequeueReusableCell(withIdentifier: "") as! cell
                
                //        return cell
                return UITableViewCell()
            }
        }
