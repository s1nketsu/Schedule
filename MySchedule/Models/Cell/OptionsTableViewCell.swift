//
//  OptionsScheduleTableViewCell.swift
//  MySchedule
//
//  Created by Полищук Александр on 29.08.2022.
//

import UIKit

class OptionsTableViewCell: UITableViewCell {

    let backgroundViewCell: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .white
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let nameCellLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let repeatSwitch: UISwitch = {
        let repeatSwitch = UISwitch()
        repeatSwitch.isOn = true
        repeatSwitch.isHidden = true
        repeatSwitch.translatesAutoresizingMaskIntoConstraints = false
        return repeatSwitch
    }()
    
    weak var switchRepeatDelegate: SwitchRepeatProtocol?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setConstraints()
        self.selectionStyle = .none
        self.backgroundColor = .clear
        
        repeatSwitch.addTarget(self, action: #selector(switchChange(paramTarget:)), for: .valueChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func cellScheduleConfigure(nameArray: [[String]], indexPath: IndexPath, hexColor: String) {
        nameCellLabel.text = nameArray[indexPath.section][indexPath.row]
        
        let color = UIColor().colorFromHex(hexColor)
        backgroundViewCell.backgroundColor = (indexPath.section == 3 ? color : .white)
        
        repeatSwitch.isHidden = (indexPath.section == 4 ? false : true)
        repeatSwitch.onTintColor = color

    }
    
    func cellTaskConfigure(nameArray: [String], indexPath: IndexPath) {
        nameCellLabel.text = nameArray[indexPath.section]
        backgroundViewCell.backgroundColor = (indexPath.section == 3 ? #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1) : .white)
    }
    
    func cellContactConfigure(nameArray: [String], indexPath: IndexPath) {
        nameCellLabel.text = nameArray[indexPath.section]
        
        indexPath.section == 4 ? backgroundViewCell.image = UIImage(systemName: "person.fill.badge.plus") : nil
    }
    
    @objc func switchChange(paramTarget: UISwitch) {
        switchRepeatDelegate?.switchRepeat(value: paramTarget.isOn)
    }
    
    func setConstraints() {
        self.addSubview(backgroundViewCell)
        NSLayoutConstraint.activate([
            backgroundViewCell.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            backgroundViewCell.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            backgroundViewCell.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            backgroundViewCell.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1)
        ])
        
        self.addSubview(nameCellLabel)
        NSLayoutConstraint.activate([
            nameCellLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            nameCellLabel.leadingAnchor.constraint(equalTo: backgroundViewCell.leadingAnchor, constant: 15),
        ])
        
        self.contentView.addSubview(repeatSwitch)
        NSLayoutConstraint.activate([
            repeatSwitch.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            repeatSwitch.trailingAnchor.constraint(equalTo: backgroundViewCell.trailingAnchor, constant: -20),
        ])
    }
}
