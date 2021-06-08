# GenericStreamingDemo

In order to use the Demo, follow this simple steps :

1 - first import the 2 classes and the lwc into your org.

2 - run the following apex code to create the generic streaming channel (code is located in StreamingSimpleExample/scripts/apex if you want to run it from vscode):
  insert new StreamingChannel(Name='/u/genericStreamingChannel',Description='simple exemple de generic streaming channel');

3 - open your org and just past this url : https:/xxxxx.lightning.force.com/one/one.app#eyJjb21wb25lbnREZWYiOiJjOnNpbXBsZUx3YyIsImF0dHJpYnV0ZXMiOnt9LCJzdGF0ZSI6e319

you'll arrive on the testing screen. Just click any of the 2 buttons.
They will call a future method that will fire back an event to the user on the front. The front is then able to do anything it needs to
