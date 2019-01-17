
if(!loadLibrary("../libE_XML"))
	return;

var fileContents;
try{
	fileContents = IO.loadTextFile(args[2]);
}catch(e){
	return;
}

fileContents = XML.replace(fileContents, "[ \\t]*(.*)::init\\([\\*\\&]?(.*)\\);", '//! [INIT] {"obj" : "$1", "ns" : "$2"}');

outln(fileContents);
return;
