import { inject } from '@angular/core';
import { CanActivateFn, Router } from '@angular/router';

export const userGuard: CanActivateFn = (route, state) => {
  const router=inject(Router);
  const token=localStorage.getItem('user');
  if(token){

    return true;
  }else {
    router.navigate(['']);
    return false;
  }
}