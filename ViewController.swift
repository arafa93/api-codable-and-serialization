//
//  ViewController.swift
//  Api`s
//
//  Created by Mohamed Arafa on 8/23/18.
//  Copyright © 2018 Swaqny. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var getData = [apiGet]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIget(){}
        
        APIpost(){}
        
    }

    
    
    func APIget(completed : @escaping () -> ()){
        
        guard let url = URL(string: "https://my-json-server.typicode.com/arafa93/IFood/resturants") else {return}
        
        URLSession.shared.dataTask(with: url) { (data, success, error) in
            
            if error == nil{
                
                do{
                    
                    self.getData = try JSONDecoder().decode([apiGet].self, from: data!)
                    
                    completed()
                    
                    DispatchQueue.main.async {
                        print(self.getData)
                        print("*******")
                        print(self.getData[0].foods[1].rate)

                    }
                
                }catch{
                    print(error)
                }
   
            }

            
        }.resume()
        
        
    }
    
    
    func APIpost(completed : @escaping () -> ()){
        
        guard let url = URL(string: "http://beehive.zad-test.online/api/post/login") else { return }
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        
        completed()
        
        let PostAPI = apiPost(email: "mm", password: "mm")
        
        let encoder =  JSONEncoder()
        
        do {
            
            let dataEncode = try encoder.encode(PostAPI)
            request.httpBody = dataEncode
            
            
        } catch  {
            print(error)
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, success, error) in
            
            do{
                
                let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                
                
                completed()
                
                DispatchQueue.main.async {
                    print("this is my Json " , jsonResponse)
                }
                
            }catch{
                print(error)
            }
 
        }
        task.resume()
        
        
    }
    
    
    
    
    

}

