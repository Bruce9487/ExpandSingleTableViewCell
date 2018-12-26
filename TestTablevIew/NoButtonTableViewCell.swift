//
//  NoButtonTableViewCell.swift
//  TestTablevIew
//
//  Created by Bruce Chen on 2018/12/20.
//  Copyright © 2018 APP技術部-陳冠志. All rights reserved.
//

import UIKit

class NoButtonTableViewCell: UITableViewCell {

    let titleLabel: UILabel = { () -> UILabel in
        let ui = UILabel()
        ui.numberOfLines = 0
        ui.textColor = UIColor.black
        return ui
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        loadUI()
        loadLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadUI() {
        self.addSubview(titleLabel)
    }
    
    func loadLayout() {
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.left.equalTo(15)
            make.right.bottom.equalTo(-15)
        }
        
    }

}
