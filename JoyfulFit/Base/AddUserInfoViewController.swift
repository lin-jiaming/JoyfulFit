//
//  RegisterViewController.swift
//  JoyfulFit
//
//  Created by Linjiaming on 2018/5/16.
//  Copyright © 2018年 Linjiaming. All rights reserved.
//

import UIKit
class AddUserInfoViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    //用户姓名
    @IBOutlet weak var UserNameTextField: UITextField!
    //用户性别分段选择器
    @IBOutlet weak var UserSexSegmented: UISegmentedControl!
    //日期文本框
    @IBOutlet weak var DateTextField: UITextField!
    //身高文本框
    @IBOutlet weak var HeightTextField: UITextField!
    //体重文本框
    @IBOutlet weak var PesoTextField: UITextField!
    //期待体重文本框
    @IBOutlet weak var ExpectPesoTextField: UITextField!
    
    //日期选择器
    var datePicker = UIDatePicker()
    
    //身高选择器
    var heightPickerView = UIPickerView()
    var heightData = ["厘米","英寸"]
    var heightAllData = [["50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178", "179", "180", "181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200", "201", "202", "203", "204", "205", "206", "207", "208", "209", "210", "211", "212", "213", "214", "215", "216", "217", "218", "219", "220", "221", "222", "223", "224", "225", "226", "227", "228", "229", "230", "231", "232", "233", "234", "235", "236", "237", "238", "239", "240", "241", "242", "243", "244", "245", "246", "247", "248", "249", "250", "251", "252", "253", "254", "255", "256", "257", "258", "259", "260"],["19.7", "20.1", "20.5", "20.9", "21.3", "21.7", "22.0", "22.4", "22.8", "23.2", "23.6", "24.0", "24.4", "24.8", "25.2", "25.6", "26.0", "26.4", "26.8", "27.2", "27.6", "28.0", "28.3", "28.7", "29.1", "29.5", "29.9", "30.3", "30.7", "31.1", "31.5", "31.9", "32.3", "32.7", "33.1", "33.5", "33.9", "34.3", "34.6", "35.0", "35.4", "35.8", "36.2", "36.6", "37.0", "37.4", "37.8", "38.2", "38.6", "39.0", "39.4", "39.8", "40.2", "40.6", "40.9", "41.3", "41.7", "42.1", "42.5", "42.9", "43.3", "43.7", "44.1", "44.5", "44.9", "45.3", "45.7", "46.1", "46.5", "46.9", "47.2", "47.6", "48.0", "48.4", "48.8", "49.2", "49.6", "50.0", "50.4", "50.8", "51.2", "51.6", "52.0", "52.4", "52.8", "53.1", "53.5", "53.9", "54.3", "54.7", "55.1", "55.5", "55.9", "56.3", "56.7", "57.1", "57.5", "57.9", "58.3", "58.7", "59.1", "59.4", "59.8", "60.2", "60.6", "61.0", "61.4", "61.8", "62.2", "62.6", "63.0", "63.4", "63.8", "64.2", "64.6", "65.0", "65.4", "65.7", "66.1", "66.5", "66.9", "67.3", "67.7", "68.1", "68.5", "68.9", "69.3", "69.7", "70.1", "70.5", "70.9", "71.3", "71.7", "72.0", "72.4", "72.8", "73.2", "73.6", "74.0", "74.4", "74.8", "75.2", "75.6", "76.0", "76.4", "76.8", "77.2", "77.6", "78.0", "78.3", "78.7", "79.1", "79.5", "79.9", "80.3", "80.7", "81.1", "81.5", "81.9", "82.3", "82.7", "83.1", "83.5", "83.9", "84.3", "84.6", "85.0", "85.4", "85.8", "86.2", "86.6", "87.0", "87.4", "87.8", "88.2", "88.6", "89.0", "89.4", "89.8", "90.2", "90.6", "90.9", "91.3", "91.7", "92.1", "92.5", "92.9", "93.3", "93.7", "94.1", "94.5", "94.9", "95.3", "95.7", "96.1", "96.5", "96.9", "97.2", "97.6", "98.0", "98.4", "98.8", "99.2", "99.6", "100.0", "100.4", "100.8", "101.2", "101.6", "102.0", "102.4"]]
    
    //选择身高单位索引
    var heightDataIndex = 0
    //选择身高数值的索引
    var heightAllDataIndex = 0

//    //初始化pickerView原始数据的倍数
//    let dataSizeMultiple = 1
    
    //当前体重的选择框
    var pesoPickerView = UIPickerView()
    //初始化数据
    var pesoData = ["千克","磅"]
    var pesoAllData = [["20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49", "50", "51", "52", "53", "54", "55", "56", "57", "58", "59", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "71", "72", "73", "74", "75", "76", "77", "78", "79", "80", "81", "82", "83", "84", "85", "86", "87", "88", "89", "90", "91", "92", "93", "94", "95", "96", "97", "98", "99", "100", "101", "102", "103", "104", "105", "106", "107", "108", "109", "110", "111", "112", "113", "114", "115", "116", "117", "118", "119", "120", "121", "122", "123", "124", "125", "126", "127", "128", "129", "130", "131", "132", "133", "134", "135", "136", "137", "138", "139", "140", "141", "142", "143", "144", "145", "146", "147", "148", "149", "150", "151", "152", "153", "154", "155", "156", "157", "158", "159", "160", "161", "162", "163", "164", "165", "166", "167", "168", "169", "170", "171", "172", "173", "174", "175", "176", "177", "178", "179", "180", "181", "182", "183", "184", "185", "186", "187", "188", "189", "190", "191", "192", "193", "194", "195", "196", "197", "198", "199", "200"],["22.7", "23.1", "23.6", "24.0", "24.5", "24.9", "25.4", "25.9", "26.3", "26.8", "27.2", "27.7", "28.1", "28.6", "29.0", "29.5", "29.9", "30.4", "30.8", "31.3", "31.8", "32.2", "32.7", "33.1", "33.6", "34.0", "34.5", "34.9", "35.4", "35.8", "36.3", "36.7", "37.2", "37.6", "38.1", "38.6", "39.0", "39.5", "39.9", "40.4", "40.8", "41.3", "41.7", "42.2", "42.6", "43.1", "43.5", "44.0", "44.5", "44.9", "45.4", "45.8", "46.3", "46.7", "47.2", "47.6", "48.1", "48.5", "49.0", "49.4", "49.9", "50.3", "50.8", "51.3", "51.7", "52.2", "52.6", "53.1", "53.5", "54.0", "54.4", "54.9", "55.3", "55.8", "56.2", "56.7", "57.2", "57.6", "58.1", "58.5", "59.0", "59.4", "59.9", "60.3", "60.8", "61.2", "61.7", "62.1", "62.6", "63.0", "63.5", "64.0", "64.4", "64.9", "65.3", "65.8", "66.2", "66.7", "67.1", "67.6", "68.0", "68.5", "68.9", "69.4", "69.9", "70.3", "70.8", "71.2", "71.7", "72.1", "72.6", "73.0", "73.5", "73.9", "74.4", "74.8", "75.3", "75.7", "76.2", "76.7", "77.1", "77.6", "78.0", "78.5", "78.9", "79.4", "79.8", "80.3", "80.7", "81.2", "81.6", "82.1", "82.6", "83.0", "83.5", "83.9", "84.4", "84.8", "85.3", "85.7", "86.2", "86.6", "87.1", "87.5", "88.0", "88.5", "88.9", "89.4", "89.8", "90.3", "90.7"]]
    //选择体重单位的索引
    var pesoDataIndex = 0
    //选择体重数值的索引
    var pesoAllDataIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //文本框的委托
        UserNameTextField.delegate = self
        HeightTextField.delegate = self
        PesoTextField.delegate = self
        ExpectPesoTextField.delegate = self
        
        //日期选择器
        initDatePickerView()
        
        //身高选择器
        initHeightPickerView()
        
        //当前体重选择器
        initPesoPickerView(self.PesoTextField)
        
        //期待体重选择器
        initPesoPickerView(self.ExpectPesoTextField)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //初始化日期
    func initDatePickerView(){
        //添加标签栏、确认按钮，取消按钮
        toolBar(self.DateTextField)
        //日期选择器属性及样式
        datePicker.locale = NSLocale(localeIdentifier: "zh_cn") as Locale
        datePicker.timeZone = NSTimeZone.system
        datePicker.datePickerMode = UIDatePickerMode.date
//        datePicker.addTarget(self, action: #selector(getDate), for: .valueChanged)
        datePicker.layer.backgroundColor = UIColor.white.cgColor
        datePicker.layer.masksToBounds = true
        DateTextField.inputView = datePicker
    }
    
    //日期选择器选择处理方法
    @objc func getDate(dataPicker: UIDatePicker) {
        let formatter = DateFormatter()
        let date = datePicker.date
        formatter.dateFormat = "yyyy-MM-dd"
        let dateStr = formatter.string(from: date)
        self.DateTextField.text = dateStr
    }
    
    //初始化身高选择器
    func initHeightPickerView() {
//        //身高选择单位数据
//        heightData = ["厘米","英寸"]
//
//        //CM的数组数据
//        var cmArray = [String]()
//        //inches的数组数据
//        var inchesArrray = [String]()
//
//        //设置是否显示选中状态
//        heightPicker.showsSelectionIndicator = true
        //pickerView委托和数据源
        heightPickerView.dataSource = self
        heightPickerView.delegate = self

        heightPickerView.layer.backgroundColor = UIColor.white.cgColor
        //点击身高文本框弹出身高选择器
        HeightTextField.inputView = heightPickerView
        
        //身高数据选项默认中间
        heightPickerView.selectRow(heightAllData[0].count/2, inComponent: 0, animated: false)
        
        //添加一个标签栏，确定按钮，取消按钮
        toolBar(self.HeightTextField)
        
        
//
////        循环添加cmArray的数据
//        for  i in 50...260{
//            cmArray.append("\(i)")
//        }
//        print(cmArray)
//
//        //循环添加inchesArray的数据
//        for i in 50...260{
//            let s = String(format: "%.1f", Double(i) * 0.393701)
//            inchesArrray.append(s)
//        }
//        print(inchesArrray)
//
//        //将厘米数据和英寸的数据保存到一个数组
//        heightAllData = [cmArray,inchesArrray]
//        print(heightAllData)
        
    }
    
    //初始化当前体重选择器
    func initPesoPickerView(_ field: UITextField) {
        let field = field
        //千克的数组
//        var kgPeso = [String]()
        //磅的数组
//        var lbPeso = [String]()
        //pesoPickerView的委托和数据源
        pesoPickerView.delegate = self
        pesoPickerView.dataSource = self
        //背景颜色
        pesoPickerView.layer.backgroundColor = UIColor.white.cgColor
        //点击体重文本框弹出体重选择器
        if field == self.PesoTextField {
            self.PesoTextField.inputView = pesoPickerView
        }else {
            self.ExpectPesoTextField.inputView = pesoPickerView
        }
        
//        //当前体重默认选择中间
//        pesoPickerView.selectRow(pesoAllData[0].count/2, inComponent: 0, animated:false)
        
//        for i in 20...200 {
//            kgPeso.append("\(i)")
//        }
//
//        for i in 50...200{
//            let s = String(format: "%.1f", Double(i) * 0.4535924)
//            lbPeso.append(s)
//        }
//
//        pesoAllData = [kgPeso,lbPeso]
//        print(pesoAllData)
        //为选择框添加按钮
        toolBar(field)
    }
    
    
    //TextFieldDelegate委托协议
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //关闭键盘
        if textField == self.UserNameTextField {
            textField.resignFirstResponder()
            return true
        } else if textField == self.HeightTextField {
            textField.resignFirstResponder()
            return true
        } else if textField == self.PesoTextField {
            textField.resignFirstResponder()
            return true
        } else if textField == self.ExpectPesoTextField {
            textField.resignFirstResponder()
            return true
        }
        return true
    }
    
    //heightPickerView委托协议
//    //返回几个分区
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 2
//    }
//
//    //行数
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        if component == 0 {
//            let row1 = pickerView.selectedRow(inComponent: 0)
//            var arraY = heightAllData.index(of: row1) as! [String]
//            return arraY.count
//        }
//        return heightData.count
//        }
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        if component == 0 {
//            return self.heightAllData[row] as? String
//        }
//        return heightData[row] as? String
//    }
    
    //PickerView委托协议
    //返回几个分区
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    //行数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //如果当前pickerView是身高选择栏
        if pickerView == heightPickerView {
            if component == 0 {
                return  heightAllData[component % heightData.count].count
            }else {
                return  heightData.count
            }
        }
        //如果当前pickerView是体重选择栏
        if pickerView == pesoPickerView {
            if component == 0 {
                return pesoAllData[component % pesoData.count].count
            }else{
                return pesoData.count
                
            }
        }
        return 0
    }
    //显示各项的内容
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //如果当前pickerView是身高选择栏
        if pickerView == heightPickerView {
            if component == 0 {
                return heightAllData[heightDataIndex][row % heightAllData[heightDataIndex].count]
            }else {
                return heightData[row % heightData.count]
            }
        }
     //如果当前pickerView是体重选择栏
        if pickerView == pesoPickerView {
            if component == 0{
                return pesoAllData[pesoDataIndex][row % pesoAllData[pesoDataIndex].count]
            }else {
                return pesoData[row % pesoData.count]
        }
    }
        return nil
}
    
    //选中某一项后会触发
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //如果当前pickerView是身高选择栏
        if pickerView == heightPickerView {
            //重新让pickerView又选回中间部分的数据项
            if component == 0 {
                heightAllDataIndex = row % heightAllData[heightDataIndex].count
                let position = heightAllData[heightDataIndex].count/2 + heightAllDataIndex
                heightPickerView.selectRow(position, inComponent: 1, animated: false)
                //heightAllDataIndex = 0
                heightPickerView.reloadComponent(1)
                heightPickerView.selectRow(heightAllData[heightDataIndex].count/2, inComponent: 1, animated: false)
            }else {
                heightDataIndex = row % heightData.count
                let position = heightData.count/2 + heightDataIndex
                heightPickerView.selectRow(position, inComponent: 0, animated: false)
            }
        }
        //如果当前pickerView是体重选择栏
        if pickerView == pesoPickerView {
            if component == 0 {
                pesoAllDataIndex = row % pesoAllData[pesoDataIndex].count
                let position = pesoAllData[pesoDataIndex].count/2 + pesoAllDataIndex
                pesoPickerView.selectRow(position, inComponent: 1, animated: false)
                pesoPickerView.reloadComponent(1)
//                pesoPickerView.selectRow(pesoAllData[pesoDataIndex].count/2, inComponent: 1, animated: false)
            }else {
                pesoDataIndex = row % pesoData.count
                let position = pesoData.count/2 + pesoDataIndex
                pesoPickerView.selectRow(position, inComponent: 0, animated: false)
            }
        }
    }
    //触碰到键盘以外的区域都关闭键盘
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DateTextField.resignFirstResponder()
        UserNameTextField.resignFirstResponder()
//        HeightTextField.resignFirstResponder()
        PesoTextField.resignFirstResponder()
        ExpectPesoTextField.resignFirstResponder()
    }
    
    //标签栏、确认按钮，取消按钮
    func toolBar(_ field: UITextField) {
        let field = field
        let toolBar = UIToolbar()
        //通用的返回按钮
        let cancelButton = UIBarButtonItem(title: "取消", style: .plain, target: self, action: #selector(cancel))
        //日期选择器的确认按钮
        let dateFinishButton = UIBarButtonItem(title: "确定", style: .done, target: self, action: #selector(finishDate))
        //身高去确认按钮
        let heightFinishButton = UIBarButtonItem(title: "确定", style: .done, target: self, action: #selector(finishHeight))
        //当前体重确认按钮
        let pesoFinishButton = UIBarButtonItem(title: "确定", style: .done, target: self, action: #selector(finishPeso))
        //期待体重按钮
        let expectPesoFinishButton = UIBarButtonItem(title: "确定", style: .done, target: self,action: #selector(finishExpectPeso))
        //标签
        let placeholder = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolBar.barStyle = .default
        toolBar.sizeToFit()
        toolBar.isTranslucent = false
        if field == DateTextField{ //判断filed是那个文本框
        toolBar.items = [cancelButton,placeholder,dateFinishButton]
        }else if field == HeightTextField {
            toolBar.items = [cancelButton,placeholder,heightFinishButton]
        }else if field == PesoTextField{
            toolBar.items = [cancelButton,placeholder,pesoFinishButton]
        }else if field == ExpectPesoTextField {
            toolBar.items = [cancelButton,placeholder,expectPesoFinishButton]
        }
        field.inputAccessoryView = toolBar
    }
    
    
    //cancel按钮
    @objc func cancel() {
        self.view.endEditing(true)
    }
    
    //日期格式化
    lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
   //finishDate按钮
    @objc func finishDate(){
            self.DateTextField.text = dateFormatter.string(from: datePicker.date)   //将日期选择框的值设置给日期文本框
            self.view.endEditing(true)
    }
    //finishHeight(身高选择栏确认按钮事件)
    @objc func finishHeight(){
        let row1 = self.heightPickerView.selectedRow(inComponent: 0)
        let row2 = self.heightPickerView.selectedRow(inComponent: 1)
        let selected1 = self.heightAllData[row2][row1]
        let selected2 = self.heightData[row2]
        self.HeightTextField.text = "\(selected1)\(selected2)"
        self.view.endEditing(true)
    }
    //finishPeso(当前体重选择栏确认按钮事件)
    @objc func finishPeso(){
        let row1 = self.pesoPickerView.selectedRow(inComponent: 0)
        let row2 = self.pesoPickerView.selectedRow(inComponent: 1)
        let selected1 = self.pesoAllData[row2][row1]
        let selected2 = self.pesoData[row2]
        self.PesoTextField.text = "\(selected1)\(selected2)"
        self.view.endEditing(true)
    }
    //finishExpectPeso(期待体重选择栏确认按钮事件)
    @objc func finishExpectPeso(){
        let row1 = self.pesoPickerView.selectedRow(inComponent: 0)
        let row2 = self.pesoPickerView.selectedRow(inComponent: 1)
        let selected1 = self.pesoAllData[row2][row1]
        let selected2 = self.pesoData[row2]
        self.ExpectPesoTextField.text = "\(selected1)\(selected2)"
        self.view.endEditing(true)
    }
    
    @IBAction func AddUserInfo(_ sender: Any) {
        //获取用户名
        let UserName = self.UserNameTextField.text!
        //获取性别的数据
        let Sex = self.UserSexSegmented.selectedSegmentIndex == 0 ? "男" : "女"
        //获取生日
        let date = self.DateTextField.text!
        //获取身高
        let height = self.HeightTextField.text!
        //获取当前体重
        let peso = self.PesoTextField.text!
        //获取期待体重
        let expectPeso = self.ExpectPesoTextField.text!
        print("用户名：\(UserName),性别：\(Sex),生日日期：\(date),身高：\(height),当前体重：\(peso),期待体重：\(expectPeso)")

    }
    
    
}
