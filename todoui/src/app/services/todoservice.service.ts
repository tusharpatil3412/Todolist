import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Todo } from '../models/datatype';

@Injectable({
  providedIn: 'root'
})
export class TodoserviceService {

  constructor(private http:HttpClient) 
  {
    
   }
   addTodo(data:Todo){
    
   return this.http.post(`https://localhost:7091/api/Todo/new`,data);
   }
   usertodo(userid:number)
   {
    return this.http.get<Todo[]>(`https://localhost:7091/api/Todo/${userid}`)
   }
   filterService(id:number,status:string){
    return this.http.get<Todo[]>(`https://localhost:7091/api/Todo/${id}/${status}`)
   }
   todobyid(id:number){
   return this.http.get<Todo>(`https://localhost:7091/api/Todo/single/${id}`)
   }
   update(todo:Todo){
   
    return this.http.put<boolean>(`https://localhost:7091/api/Todo/update/${todo.id}`,todo)
   }
   delete(id:number){
  
    return this.http.delete(`https://localhost:7091/api/Todo/${id}`)
    
   }
}
