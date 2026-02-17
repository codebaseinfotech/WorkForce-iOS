//
//  HelpAndFAQs.swift
//  AttendanceSystem
//
//  Created by Ankit on 17/02/26.
//

import UIKit

struct FAQItem {
    let question: String
    let answer: String
    var isExpanded: Bool
}

class HelpAndFAQs: UIViewController {
    
    @IBOutlet weak var tblViewFAQs: UITableView! {
        didSet {
            tblViewFAQs.register(FAQsTVCell.nib, forCellReuseIdentifier: FAQsTVCell.identifier)
            tblViewFAQs.delegate = self
            tblViewFAQs.dataSource = self
            
            tblViewFAQs.rowHeight = UITableView.automaticDimension
            tblViewFAQs.estimatedRowHeight = 40
        }
    }
    
    var faqList: [FAQItem] = []
    
    var arrFAQ: [[String: String]] = [
        [
            "question": "How do I Check Out?",
            "answer": "Tap the Check Out button at the end of your shift. This will calculate your total working hours."
        ],
        [
            "question": "How does Break In / Break Out work?",
            "answer": "Tap Break In when you start a break and Break Out when you return. Break duration will be auto-calculated."
        ],
        [
            "question": "Can I edit my attendance?",
            "answer": "No, once attendance is recorded it cannot be edited. Please contact admin for corrections."
        ],
        [
            "question": "Will I get reminders for Check In / Check Out?",
            "answer": "Yes, the app sends notifications for shift start, break reminders, and shift end."
        ],
        [
            "question": "How is my attendance used?",
            "answer": "Attendance data is used for monthly reports, salary calculation, and performance tracking."
        ],
        [
            "question": "Why is my working hour showing less?",
            "answer": "Working hours exclude break time and late Check In or early Check Out."
        ],
        [
            "question": "What if I forget to mark Break Out?",
            "answer": "Your break will continue running and total working hours will decrease until Break Out is marked."
        ],
        [
            "question": "How can I see my monthly attendance?",
            "answer": "You can view monthly attendance report from the Attendance or Reports section (if enabled)."
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareFAQData()
        // Do any additional setup after loading the view.
    }
    
    private func prepareFAQData() {
        faqList = arrFAQ.compactMap { dict in
            guard let q = dict["question"], let a = dict["answer"] else { return nil }
            return FAQItem(question: q, answer: a, isExpanded: false)
        }
        tblViewFAQs.reloadData()
    }

    @IBAction func tappedBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    

}

extension HelpAndFAQs: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return faqList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tblViewFAQs.dequeueReusableCell(withIdentifier: "FAQsTVCell") as! FAQsTVCell
        
        let item = faqList[indexPath.row]
        
        cell.lblQuation.text = item.question
        cell.lblAnswer.text = item.answer
        
        cell.lblAnswer.isHidden = !item.isExpanded
        cell.viewMiddelLine.isHidden = !item.isExpanded
        cell.imgPlus.image = UIImage(named: item.isExpanded ? "ic_minus" : "ic_plus")
        cell.viewMain.backgroundColor = item.isExpanded ? .bg1 : .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // Store old state of tapped cell
        let wasExpanded = faqList[indexPath.row].isExpanded

        // Close all
        for i in 0..<faqList.count {
            faqList[i].isExpanded = false
        }

        // If it was NOT expanded before, then open it
        if !wasExpanded {
            faqList[indexPath.row].isExpanded = true
        }

        tableView.reloadData()
    }
    
}
