//
//  ViewController.swift
//  TestTablevIew
//
//  Created by Bruce Chen on 2018/12/19.
//  Copyright © 2018 APP技術部-陳冠志. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let itemCount: Int = 10
    let tableView = UITableView()
    let cellWithButton = "cellWithButton"
    var isExpand: Bool = false
    var expandingStateArray: [Bool] = []
    
    let textArray: [String] = ["If you read and listen to two articles every day, your reading and listening skills can immm If you read and listen to two articles every day, your reading and listening skills can immm If you read and listen to two articles every day, your reading and listening skills can immm If you read and listen to two articles every day, your reading and listening skills can immm If you read and listen to two articles every day, your reading and listening skills can immm", "If you read and listen to two", "If you read and listen to two articles every day, your reading and listening skills can immm If you read and listen to two articles every day", "If you read and listen to two articles every day, your reading and listening skills can immm If you read and listen to two articles every day", "If you read and listen to two articles every day, your reading and listening skills can immm If you read and listen to two articles every day", "If you read and listen to two articles every day, your reading and listening skills can immm If you read and listen to two articles every day", "If you read and listen to two articles every day, your reading and listening skills can immm If you read and listen to two articles every day", "If you read and listen to two articles every day, your reading and listening skills can immm If you read and listen to two articles every day", "If you read and listen to two articles every day, your reading and listening skills", "If you read and listen to two articles every day, your reading and listening skills can immm If you read and listen to two articles every day, your reading and listening skills can immm If you read and listen to two articles every day, your reading and listening skills can immm If you read and listen to two articles every day, your reading and listening skills can immm If you read and listen to two articles every day, your reading and listening skills can immm"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0...itemCount-1 {
            let bool = false
            expandingStateArray.append(bool)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.separatorInset = .zero
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(WithButtonTableViewCell.self, forCellReuseIdentifier: cellWithButton)
        
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    @objc func btnPressed(sender: UIButton) {
        
        let indexPath = IndexPath(row: sender.tag, section: 0)
        
        if self.isExpand == false {
            
            self.isExpand = true
            
            expandingStateArray[sender.tag] = true
            
        } else {
            self.isExpand = false
            
            expandingStateArray[sender.tag] = false
        }
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.endUpdates()
        
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellWithButton, for: indexPath) as! WithButtonTableViewCell
        
        cell.titleLabel.text = textArray[indexPath.row]
        cell.expandButton.addTarget(self, action: #selector(btnPressed), for: .touchUpInside)
        cell.expandButton.tag = indexPath.row

        if expandingStateArray[indexPath.row] {
            cell.titleLabel.numberOfLines = 0
            cell.expandButton.setTitle("Close.", for: .normal)
        }else{
            cell.titleLabel.numberOfLines = 2
            cell.expandButton.setTitle("Show More.", for: .normal)
        }

//        print("===) \(indexPath.row) istrun: \(cell.titleLabel.isTruncated)")  //always get true at first time ,when I scroll and get false successfully.
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        if let btnCell = cell as? WithButtonTableViewCell  {
            
            let labelIsTruncated: Bool = btnCell.titleLabel.isTruncated()
            
            btnCell.expandButton.isHidden = !labelIsTruncated
        }
    }
}

extension UILabel {
    
    func countLabelLines() -> Int {
        self.layoutIfNeeded()
        let myText = self.text! as NSString
        let attributes = [NSAttributedStringKey.font : self.font!]
        
        let labelSize = myText.boundingRect(with: CGSize(width: self.bounds.width, height: CGFloat.greatestFiniteMagnitude), options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: attributes, context: nil)
        return Int(ceil(CGFloat(labelSize.height) / self.font.lineHeight))
    }
    
    func isTruncated() -> Bool {
        
        if (self.countLabelLines() > self.numberOfLines) {
            return true
        }
        return false
    }
}
