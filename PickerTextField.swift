import UIKit

class PickerTextField: UITextField, UIPickerViewDelegate, UIPickerViewDataSource {
    var dataList: [String] = []

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    func setup(dataList: [String]) {
        self.dataList = dataList
        
        let picker = UIPickerView()
        picker?.delegate = self
        picker?.dataSource = self
        picker?.showsSelectionIndicator = true
        
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, 0, 35))
        let doneItem = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: Selector("onTapDone"))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: Selector("onTapCancel"))
        toolbar?.setItems([cancelItem, doneItem], animated: true)
        
        self.inputView = picker
        self.inputAccessoryView = toolbar
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataList[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.text = dataList[row]
    }
    
    func onTapCancel() {
        self.text = ""
        self.endEditing(true)
    }
    
    func onTapDone() {
        self.endEditing(true)
    }
}
