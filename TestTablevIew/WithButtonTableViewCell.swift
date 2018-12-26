//
//  WithButtonTableViewCell.swift
//  TestTablevIew
//
//  Created by Bruce Chen on 2018/12/20.
//  Copyright © 2018 APP技術部-陳冠志. All rights reserved.
//

import UIKit

class WithButtonTableViewCell: UITableViewCell {

    var cellIsExpand: Bool = false
    
    let titleLabel: UILabel = { () -> UILabel in
        let ui = UILabel()
        ui.textColor = UIColor.black
        ui.numberOfLines = 2
        return ui
    }()
    
    let expandButton: UIButton = { () -> UIButton in
        let ui = UIButton()
        ui.setTitleColor(UIColor.blue, for: .normal)
        return ui
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        loadUI()
        loadLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    
    }

//    override func layoutIfNeeded() {
//        super.layoutIfNeeded()
//
//        if cellIsExpand == true {
//            titleLabel.numberOfLines = 0
//            expandButton.setTitle("Close.", for: .normal)
//        }else{
//            titleLabel.numberOfLines = 2
//            expandButton.setTitle("Show More.", for: .normal)
//        }
//    }
    
    func loadUI() {

        self.addSubview(titleLabel)
        self.addSubview(expandButton)
    }
    
    func loadLayout() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(15)
            make.right.equalTo(-15)
        }
        
        expandButton.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-15)
            make.bottom.equalTo(-15)            
        }
    }
}
