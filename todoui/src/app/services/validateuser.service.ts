import { Injectable } from '@angular/core';
import { login, user } from '../models/datatype';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { jsDocComment } from '@angular/compiler';

@Injectable({
  providedIn: 'root'
})
export class ValidateuserService {

  constructor(private http: HttpClient ,private Rout:Router) { }
  SignUp(data: user) {
    data.id = 0
    debugger
     this.http.post<any>(`https://localhost:7091/api/userdetailsl/Signup`, data).subscribe((res)=>{
      if(res){
        localStorage.setItem('user',JSON.stringify(res))
        this.Rout.navigate(['/todo'])
      }
      
    })

    }
  
  SignIn(data: login) {
    
     this.http.post<any>(`https://localhost:7091/api/userdetailsl/Login`, data).subscribe((res)=>{
      if(res){
        localStorage.setItem('user',JSON.stringify(res));
        this.Rout.navigate(['/todo']);
      }
      
    })
  }
  LogOut(){
   localStorage.removeItem('user');
  }
}
