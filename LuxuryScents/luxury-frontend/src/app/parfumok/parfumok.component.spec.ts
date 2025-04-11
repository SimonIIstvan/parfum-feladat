import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ParfumokComponent } from './parfumok.component';

describe('ParfumokComponent', () => {
  let component: ParfumokComponent;
  let fixture: ComponentFixture<ParfumokComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ParfumokComponent]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ParfumokComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
