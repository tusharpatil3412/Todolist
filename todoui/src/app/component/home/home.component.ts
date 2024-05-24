import { Component, OnInit } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { login,  user } from '../../models/datatype';
import { ValidateuserService } from '../../services/validateuser.service';
import { Route, Router } from '@angular/router';



@Component({
  selector: 'app-home',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent implements OnInit{

  signUp=false;
  constructor( private validiteuserservice:ValidateuserService,private rout:Router){

  }
  ngOnInit(): void {
   this.userreload();
  }
SignUp(data:user){
  
  this.validiteuserservice.SignUp(data)
}
SignIn(data:login){
this.validiteuserservice.SignIn(data)
}
opensignup(){
 this.signUp=true; 
}
openlogin(){
  this.signUp=false;
}
userreload(){
  var localdata=localStorage.getItem('user');
  if(localdata)
    {
      this.rout.navigate(['/todo'])
    }
}
}
