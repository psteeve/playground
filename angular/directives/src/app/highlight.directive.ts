import { Directive, ElementRef, HostListener, Input } from '@angular/core';

@Directive({
  selector: '[appHighlight]'
})
export class HighlightDirective {

  @Input() appHighlight = '';

  @Input() defaultColor = '';

  @HostListener('mouseenter') onMouseEnter() {
    this.highlight(this.appHighlight || this.defaultColor || 'red');
  }

  @HostListener('mouseleave') onMouseLeave() {
    this.highlight('');
  }


  constructor(private el: ElementRef) {
   }

   private highlight(color: string) {
     this.el.nativeElement.style.backgroundColor = color;
   }
}
