//
//  SpeechViewController.swift
//  Itungin
//
//  Created by Ditha Nurcahya Avianty on 05/03/23.
//

import UIKit

class SpeechViewController: UIViewController {

    private lazy var addTransactionLabel: UILabel = {
        let label = UILabel()
        label.text = "Add Transaction"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var instructionLabel: UILabel = {
        let label = UILabel()
        label.text = "Say \"Add expense or income ... on category ... for ...\""
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var exampleLabel: UILabel = {
        let label = UILabel()
        label.text = "Example: \n\"Add expense 25000 on category Food/Drink for Steak\""
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var recordButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: self.isRecording ? "stop.fill" : "mic.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), for: .normal)
        button.backgroundColor = self.isRecording ? .systemRed : .systemBlue
        button.tintColor = .systemBackground
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 40
        button.clipsToBounds = true

        return button
    }()

    private var isRecording = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        view.addSubview(addTransactionLabel)
        view.addSubview(instructionLabel)
        view.addSubview(exampleLabel)
        view.addSubview(recordButton)

        configureConstraints()
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
    }

    @objc func recordTapped() {
        isRecording.toggle()
        recordButton.setImage(UIImage(systemName: self.isRecording ? "stop.fill" : "mic.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), for: .normal)
        recordButton.backgroundColor = self.isRecording ? .systemRed : .systemBlue
    }
}

extension SpeechViewController {
    private func configureConstraints() {
        let addTransactionLabelConstraints = [
            addTransactionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            addTransactionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            addTransactionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 120)
        ]

        let instructionLabelConstraints = [
            instructionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            instructionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            instructionLabel.topAnchor.constraint(equalTo: addTransactionLabel.bottomAnchor, constant: 20)
        ]

        let exampleLabelConstraints = [
            exampleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            exampleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            exampleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ]

        let recordButtonConstraints = [
            recordButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recordButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            recordButton.heightAnchor.constraint(equalToConstant: 80),
            recordButton.widthAnchor.constraint(equalToConstant: 80)
        ]

        NSLayoutConstraint.activate(addTransactionLabelConstraints)
        NSLayoutConstraint.activate(instructionLabelConstraints)
        NSLayoutConstraint.activate(exampleLabelConstraints)
        NSLayoutConstraint.activate(recordButtonConstraints)
    }
}
