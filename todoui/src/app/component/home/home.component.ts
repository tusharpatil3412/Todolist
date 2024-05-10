import { Component } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { login } from './model';

@Component({
  selector: 'app-home',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent {
signUp=false;
SignUp(data:login){
  console.warn(data);
}
SignIn(data:login){
console.warn(data);
}
opensignup(){
 this.signUp=true; 
}
openlogin(){
  this.signUp=false;
}
}
