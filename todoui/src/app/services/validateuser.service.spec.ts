import { TestBed } from '@angular/core/testing';

import { ValidateuserService } from './validateuser.service';

describe('ValidateuserService', () => {
  let service: ValidateuserService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(ValidateuserService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
