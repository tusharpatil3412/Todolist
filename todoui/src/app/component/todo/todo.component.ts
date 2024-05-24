import { Component, OnInit, numberAttribute } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { Todo, user } from '../../models/datatype';
import { TodoserviceService } from '../../services/todoservice.service';
import {  Router } from '@angular/router';

@Component({
  selector: 'app-todo',
  standalone: true,
  imports: [FormsModule],
  templateUrl: './todo.component.html',
  styleUrl: './todo.component.css'
})
export class TodoComponent implements OnInit {
  data:Todo=new Todo();
  username:string|undefined;
  id:number|undefined;
  Todos:Todo[]|undefined;
  edit:boolean=false;
  constructor(private todoser:TodoserviceService,private rout:Router){}
  ngOnInit(): void {
      this.userload();
      this.todoload();
  }
 NewTodo(data:Todo){
    if(this.edit)
    {
      data.userid=this.id; 
      data.id=this.data.id
      this.todoser.update(data).subscribe((res)=>{
        this.data= new Todo();
       this.todoload();
      })
    }
    else
{    data.userid=this.id;   
    this.todoser.addTodo(data).subscribe((res)=>{
      this.data= new Todo();
     this.todoload();
    })
  }   
    
  }
  clearTodo()
  {
    this.data= new Todo();
    this.edit=false;
  }
 
  userload(){
   
   var localdata=localStorage.getItem('user');
   let data:user = localdata && JSON.parse(localdata)
   this.username=data.name;
    this.id= data.id;
   
  }
  todoload(){
    
   this.id && this.todoser.usertodo(this.id).subscribe((res)=>{
    this.Todos=res
    console.warn(res);
    
    
   })
  }
  LogOut(){
    localStorage.removeItem('user');
    this.rout.navigate([''])
   }
   filter(status:string){
  if (status=="All")
    {
      this.todoload();
    }
    else{
   this.id && this.todoser.filterService(this.id,status).subscribe((res)=>{
    this.Todos=res
    })
  }

   }

   getTodo(id:number|undefined){
    this.edit=true;
    id != undefined ? this.todoser.todobyid(id).subscribe(
        (response) => {
          console.warn(response);
          this.data.id=response.id;
          this.data.status=response.status;
          this.data.description=response.description;
          this.data.title=response.title;
        },
        
      )
    : console.log('ID is undefined');}
    deleteTodo(){
     
      
    this.id && this.todoser.delete(this.id).subscribe((res)=>{
      
     this.todoload();
    })
    }
}
