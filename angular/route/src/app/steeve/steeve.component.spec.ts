import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SteeveComponent } from './steeve.component';

describe('SteeveComponent', () => {
  let component: SteeveComponent;
  let fixture: ComponentFixture<SteeveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ SteeveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(SteeveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
