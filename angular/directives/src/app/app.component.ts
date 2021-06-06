import { Component, OnInit } from '@angular/core';

@Component({
    selector: 'app-root',
    templateUrl: './app.component.html',
    styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {
    title = 'directives';
     color = '';
    currentClasses: Record<string, boolean> = {};

    isSpecial = true;
    canSave = true;
    isUnchanged = false;

    currentItem = { name: '', upperCaseName: '' };

    ngOnInit() {
        this.setCurrentClasses();
    }

    setCurrentClasses() {
        this.currentClasses = {
            saveable: this.canSave,
            modified: !this.isUnchanged,
            special: this.isSpecial
        }
    }

    onModelChanges($event: string) {
        this.currentItem.upperCaseName = $event.toUpperCase();
    
    }
}
