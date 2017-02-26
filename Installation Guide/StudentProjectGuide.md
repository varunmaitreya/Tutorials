# Setting up a student project (bachelor/master thesis)

## Building/Installing PADrend from source

Build PADrend according to the [Installation Guide](./InstallationGuide).

### Linux
sudo ninja install
ThirdParty libs are not installed
copy third party libs to /usr/local/lib
or copy to project lib folder

### Windows
run msys as administrator
navigate to padrend
make install

## Setup project
Download PADrend_ExampleProject
run PADrend once (PADrend.sh or PADrend.bat)
edit config.json
add "myPlugins/" to "PADrend"-"Paths"-"plugins"


```javascript
{
    ...
    "Paths":{
      "data":"data/",
      "plugins":[
        "/usr/local/share/PADrend/extPlugins/",
        "/usr/local/share/PADrend/plugins/",
        "myPlugins/"
      ],
      "scene":"data/scene/",
      "user":"./"
    },
    ...
}
```

## Build project
mkdir build
cd build
cmake ..

make (or ninja)