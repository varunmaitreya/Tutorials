<!--TODO screenshots screenshots screenshots ... -->
#Goal of this tutorial
In this tutorial you will learn some basics techniques for working with PADrend.
In the first part we will load the first scene. 
This is a crucial step since most of the time you are using PADrend you will have to deal with scenes.
The second part is about navigation.
You will learn to move through a scene in three different ways, namely by keyboard, by mouse and by gamepad.

#Assumption
To finish this tutorial you need a working installation of PADrend. 
For installation hints follow the [Building PADrend from Source](https://macabeo.cs.upb.de/trac/AlgoCG/wiki/BuildingFromSource "Building PADrend from Source") guide.

#PADrend menu overview

#Setting up PADrend
Lets start PADrend.

* Linux: Open a terminal and navigate to the PADrend folder.
  Type _./build/PADrend/PADrend_ to start PADrend.
* Windows: Open the PADrend folder.
  Start the PADrend.exe.

First of all you should choose a window size that fits to the screen resolution of your computer.
Open PADrend and go to the _config_ menu.
Choose _System Window_ and use the _Size_ drop-down menu to alter the window size.
To apply the changes you need to save the configuration.
Open the _config_ menu and choose _Save Configuration_. 
Restart PADrend by using the _Restart_ button in the file menu PADrend and it should open with correct size.

#Import and load a scene
<!---TODO where to download the scene?, replace NAME)-->
Now that PADrend is running with a proper window size we can go on and load the first scene.
Before we can do so it has first to be imported.
In this tutorial we will use the NAME scene.   
To import the scene it has to be located at the correct folder.
Open the NAME.minsg file in a text-editor.
You can extract the path to place the scene of one of the _filename_ attributes.
The path (normally it should be _/data/scene_)is relative to the PADrend working directory.
Check whether it exists and if not created it.
Copy both, the .minsg and the .zip file, to the directory.   
Lets load the scene. Open PADrend.
Go to the _file_ menu and choose _Load Scene..._.
Select NAME.minsg and hit _Confirm_.
The scene will be loaded.
This may take some seconds.
After loading a scene for the first time you can also load it via main menu using _Recent Scenes_.
Press space to reset the camera.

##Switch between loaded scenes
PADrend offers you the possibility to load multiple scenes at the same time.
This can for example be used to copy nodes from one scene and paste them to another.
How this works is content of a later tutorial.
To switch between the loaded scenes open the _Scenes_ menu.
You will find the currently loaded scenes in the _Current scenes_ list.
Scene \#0 is the empty scene that is created at the startup of PADrend.
To switch between to another scene choose one form the list by clicking on it.
You may have noticed the white triangle on the left beside each entry.
Clicking on it will provide you with the meta information of the scene.
This are for example the title of the scene and the author who created it. 

![Load scene dialog](figures/load_scene.png)

#Navigation
After we have loaded the scene let us start moving around a bit.
Navigation in PADrend can be done in three different ways.
You can use the keyboard, the mouse, a gamepad or a combination. 
There is a complete keybindings overview in your PADrend directory under _PADrend/doc/Help.txt_.

##Keyboard navigation
* Use the keys [w], [a], [s] and [d] for moving forward, left, backward and right.
  You will move in the direction of the camera. 
  If the camera for example looks slightly down in an angle and you press [w] you will move down with this angle.
* Use the keys [q] and [e] to rotate the camera.
* Use the keys [r] and [f] to move the camera up and down.
* Use [space] to reset the camera. <!--TODO what means reset-->
* Use [Numpad 5] to move the camera above the whole scene.

##Mouse navigation
To use mouse navigation you need first to activate it.
Press either the key [m] or the middle button of your mouse (in modern mouses by pressing the mousewheel down).
Now you can take a look around by moving the mouse.
Practice a while until you feel comfort with it.
It is also possible to move around by using the mouse.
While in mouse navigation mode press down and hold the left mouse button.
If you now move the mouse backwards and forwards you will move backwards and forwards.
Same applies for left and right movement.
If you press and hold the right mouse button instead you will move up and down when moving the mouse backwards and forwards.
To exit the mouse navigation mode use again the [m] key or the middle mouse button.

##Gamepad navigation
Using a gamepad results in a smooth movement.
Before you can use it for the first time you have to activate it.
Go to _Config_ and enable _Joystick support_ under the entry _Navigation_.
Save the configuration and restart PADrend. 
Use the left analog stick for moving backward, forwards, left and right.
If you press and hold the gamepad's [5] key while using the left analog stick you will move up and down instead of backwards and forwards.
With the right analog stick you can rotate the camera left, right, up and down.

##Up to you
<!-- add some point within the scene that should be reached-->
Now that you know how to navigate try to reach...
 