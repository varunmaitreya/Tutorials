
if(!loadLibrary("../../libE_XML"))
	return;

var fileContents;
try{
	fileContents = IO.loadTextFile(args[2]);
}catch(e){
	return;
}

//fileContents = XML.replace(fileContents, "([A-Za-z_:]*)getClassName\\(\\)", '"[CLASSNAME]"');
fileContents = XML.replace(fileContents, "[ \\t]*(.*)::init\\([\\*\\&]?(.*)\\);", '/*! [INIT]{{ \\ref $1::init $$ $2 }}*/');
fileContents = XML.replace(fileContents, "\\s*(\\w+)\\s*=\\s*new\\s+Namespace.*;", '/*! [TYPE]{{ $1 $$ namespace $$ }}*/');
fileContents = XML.replace(fileContents, "\\s*(\\w+)\\s*=\\s*getTypeObject\\(\\)\\s*;", '/*! [TYPE]{{ $1 $$ type $$ }}*/');
fileContents = XML.replace(fileContents, "\\s*(\\w+)\\s*=\\s*([A-Za-z_:]+)::getTypeObject\\(\\)\\s*;", '/*! [TYPE]{{ $1 $$ type $$ $2 }}*/');

outln(fileContents);
return;
