import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AppComponent } from './app.component';
import { SteeveComponent } from './steeve/steeve.component';

const routes: Routes = [
  {
    path: 'steeve', component: SteeveComponent
    
  },
  {path: '', component: AppComponent}
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
