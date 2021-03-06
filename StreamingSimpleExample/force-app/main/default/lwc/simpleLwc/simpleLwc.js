import { LightningElement, track, api, wire } from 'lwc';

import doAction1 from '@salesforce/apex/SimpleExample.doAction1';
import doAction2 from '@salesforce/apex/SimpleExample.doAction2';

import { subscribe, unsubscribe } from 'lightning/empApi';

export default class simpleLwc extends LightningElement {
    @track msg;

    connectedCallback() {
        this.handleSubscribe();
    }


    // permet de rafraichir le composant si un SFA28site est créé par le user
    handleSubscribe() {
        let thisreference=this;
        // Callback invoked whenever a new event message is received
        const messageCallback = function(response) {
            console.log('New message received: ', JSON.stringify(response));
            if(response.data.payload=='action1'){
                // do something here
                thisreference.msg='I should dsipaly something link to action 1';
            }else if(response.data.payload=='action2'){
                // do something else here
                thisreference.msg='I should launch action 2';
            }
        };
        subscribe('/u/genericStreamingChannel', -1, messageCallback);
    }

    action1() {
        doAction1();
    }

    action2() {
        doAction2();
    }

}