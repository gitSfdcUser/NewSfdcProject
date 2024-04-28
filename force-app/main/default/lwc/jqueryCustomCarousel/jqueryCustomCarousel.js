import { LightningElement, api } from 'lwc';

export default class JqueryCustomCarousel extends LightningElement {
  @api images = [];

  connectedCallback() {
    this.images = [
      { id: 1, src: 'https://t4.ftcdn.net/jpg/05/50/95/87/360_F_550958748_OeGcRonEUNoVhd0wjd9zSEMhLFIGO9Bt.jpg', alt: 'Image 1' },
      { id: 2, src: 'https://media.istockphoto.com/id/962366210/photo/anonymous-hacker-with-laptop-in-front-of-binary-code-cyber-security.jpg?s=612x612&w=0&k=20&c=-BJLwYAzjTsXh5Zj_Qn-5HQ-MRYA2fr_SdXv7oqqSZk=', alt: 'Image 2' },
      { id: 3, src: 'https://www.pandasecurity.com/en/mediacenter/src/uploads/2016/03/pandasecurity-Who-are-the-most-famous-hackers-in-history.jpg', alt: 'Image 3' },
    ];
  }
}