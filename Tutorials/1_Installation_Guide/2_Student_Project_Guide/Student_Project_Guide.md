<!---BEGINN_INDEXSECTION--->
<!---Automaticly generated section. Do not edit!!!--->
# Overview
* 1 Installation Guide
    * 1.1 [Installation Guide](../../1_Installation_Guide/1_Installation_Guide.html)
    * 1.2 [Student Project Guide](../../1_Installation_Guide/2_Student_Project_Guide/Student_Project_Guide.html)
    * 1.3 [SyntaxHighlighting](../../1_Installation_Guide/3_EScript_Syntax_Highlighting/SyntaxHighlighting.html)
<!---END_INDEXSECTION--->
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