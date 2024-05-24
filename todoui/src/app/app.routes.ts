import { Routes } from '@angular/router';
import { HomeComponent } from './component/home/home.component';
import { TodoComponent } from './component/todo/todo.component';
import { userGuard } from './user.guard';

export const routes: Routes = [
    {path:"",component:HomeComponent},
    {path:"todo",component:TodoComponent,canActivate:[userGuard]}
];
