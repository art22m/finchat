//
//  CustomConversationTableViewCell.swift
//  FinChat
//
//  Created by Артём Мурашко on 03.03.2021.
//

import UIKit

class CustomIncomeMessageTableViewCell: UITableViewCell {
    let labelDate = UILabel()
    let labelName = UILabel()
    let labelIncomeMessage = UILabel()
    let viewIncomeMessageBackground = UIView()
    
    static let identifier = "CustomConversationIncomeTableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            
            addSubview(viewIncomeMessageBackground)
            viewIncomeMessageBackground.layer.cornerRadius = 14
            viewIncomeMessageBackground.translatesAutoresizingMaskIntoConstraints = false
            
            addSubview(labelIncomeMessage)
            labelIncomeMessage.numberOfLines = 0
            labelIncomeMessage.translatesAutoresizingMaskIntoConstraints = false
            
        
            addSubview(labelName)
            labelName.numberOfLines = 1
            labelName.translatesAutoresizingMaskIntoConstraints = false
        
            addSubview(labelDate)
            labelDate.translatesAutoresizingMaskIntoConstraints = false
        
            // Constraints for Income message and background view
        let messageConstraints = [labelName.topAnchor.constraint(equalTo: topAnchor, constant: 32),
                                  labelName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
                                  labelName.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.75, constant: -64),
                                  
                                  labelIncomeMessage.topAnchor.constraint(equalTo: labelName.bottomAnchor, constant: 10),
                                  labelIncomeMessage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
                                  labelIncomeMessage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32),
                                  labelIncomeMessage.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.75, constant: -64),
                                  
                                  labelDate.topAnchor.constraint(equalTo: labelIncomeMessage.bottomAnchor, constant: 10),
                                  labelDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
                                  labelDate.widthAnchor.constraint(lessThanOrEqualTo: widthAnchor, multiplier: 0.75, constant: -64),
                                  
                                  viewIncomeMessageBackground.topAnchor.constraint(equalTo: labelName.topAnchor, constant: -16),
                                  viewIncomeMessageBackground.leadingAnchor.constraint(equalTo: labelName.leadingAnchor, constant: -16),
                                  viewIncomeMessageBackground.bottomAnchor.constraint(equalTo: labelDate.bottomAnchor, constant: 16),
                                  viewIncomeMessageBackground.trailingAnchor.constraint(equalTo: labelIncomeMessage.trailingAnchor, constant: 16),
                                  viewIncomeMessageBackground.trailingAnchor.constraint(equalTo: labelName.trailingAnchor, constant: 16),
                                  viewIncomeMessageBackground.trailingAnchor.constraint(equalTo: labelDate.trailingAnchor, constant: 16),
                                  ]
        
            sendSubviewToBack(contentView)
            NSLayoutConstraint.activate(messageConstraints)
        }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with pattern: MessageCellPattern) {
        if let text = pattern.text {
            labelIncomeMessage.text = text
        } else {
            self.labelIncomeMessage.text = ""
        }
        
        let calendar = NSCalendar.autoupdatingCurrent
        let formatter = DateFormatter()
        formatter.dateFormat = calendar.isDateInToday(pattern.date) ? "HH:mm" : "dd MMM"
        
        // Change the appearence of the cells
        backgroundColor = pattern.theme.getCurrentBackgroundColor()
        labelIncomeMessage.textColor = pattern.theme.getCurrentFontColor()
        viewIncomeMessageBackground.backgroundColor = pattern.theme.getCurrentIncomeColor()
        labelName.textColor = pattern.theme.getCurrentFontColor()
        labelDate.textColor = pattern.theme.getCurrentFontColor()
        
        labelName.text = pattern.name
        labelName.font = UIFont.boldSystemFont(ofSize:UIFont.labelFontSize)
        
        labelDate.text = formatter.string(from: pattern.date)
        labelDate.font = UIFont.italicSystemFont(ofSize:UIFont.labelFontSize)
    }
}
