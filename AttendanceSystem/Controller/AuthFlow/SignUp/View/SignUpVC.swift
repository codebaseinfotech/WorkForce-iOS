//
//  SignUpVC.swift
//  AttendanceSystem
//
//  Created by Kenil on 09/02/26.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var lblAgreeTerms: AppLabel! {
        didSet {
            let text = "I agree with Terms & Conditions and Privacy policy"
            let attributedString = NSMutableAttributedString(string: text)
            let normalFont = UIFont.AppFont.medium(12)
            lblAgreeTerms.isUserInteractionEnabled = true
            
            
            attributedString.addAttributes([
                .foregroundColor: UIColor.black,
                .font: normalFont
            ], range: NSRange(location: 0, length: text.count))
            
            // Terms & Conditions
            let termsRange = (text as NSString).range(of: "Terms & Conditions")
            attributedString.addAttributes([
                .foregroundColor: #colorLiteral(red: 0.6745098039, green: 0.4156862745, blue: 0.9490196078, alpha: 1),
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .font: normalFont
            ], range: termsRange)
            
            // Privacy policy
            let privacyRange = (text as NSString).range(of: "Privacy policy")
            attributedString.addAttributes([
                .foregroundColor: #colorLiteral(red: 0.6745098039, green: 0.4156862745, blue: 0.9490196078, alpha: 1),
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .font: normalFont
            ], range: privacyRange)
            
            lblAgreeTerms.attributedText = attributedString
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLabelTap(_:)))
            lblAgreeTerms.addGestureRecognizer(tapGesture)
            
        }
    }
    
    @IBOutlet weak var imgCheckBox: UIImageView!
    
    var isRemember: Bool = false
    
    // MARK: - view Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Action Method
    @IBAction func tappedSignUp(_ sender: Any) {
        let vc = EmailVerificationVC()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false)
    }
    
    @IBAction func tappedCheckBox(_ sender: Any) {
        isRemember.toggle()
        let changeRemember = isRemember ? "ic_check_remineder".image : "ic_un_check_reminder".image
        imgCheckBox.image = changeRemember
    }
    
    @IBAction func tappedSignIn(_ sender: Any) {
        let vc = EmailLoginVC()
        navigationController?.pushViewController(vc, animated: false)
    }
    
    @objc func handleLabelTap(_ gesture: UITapGestureRecognizer) {
        let text = lblAgreeTerms.text ?? ""
        
        if gesture.didTapAttributedText(in: lblAgreeTerms, inRange: (text as NSString).range(of: "Terms & Conditions")) {
            debugPrint("Terms tapped")
        }
        
        if gesture.didTapAttributedText(in: lblAgreeTerms, inRange: (text as NSString).range(of: "Privacy policy")) {
            debugPrint("Privacy tapped")
        }
    }

}
