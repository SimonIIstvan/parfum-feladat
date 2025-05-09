import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { IndexComponent } from './index/index.component';
import { ParfumokComponent } from './parfumok/parfumok.component';
import { RendelesComponent } from './rendeles/rendeles.component';

const routes: Routes = [
  {path: 'fooldal', component: IndexComponent},
  {path: 'parfumok', component: ParfumokComponent},
  {path: 'rendeles', component: RendelesComponent},
  {path: '', redirectTo: '/fooldal', pathMatch: 'full'}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
