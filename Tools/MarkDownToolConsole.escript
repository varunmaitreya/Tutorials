if(args.size() <= 2){ //std arguments, no file
	outln("\nToo few arguments. Enter --help for more information\n");
	return;
}

if(args.size() > 6){
	outln("\nToo many arguments. Enter --help for more information\n");
	return;
}

if(args[2] == "--help"){
	outln(
		"\n----MarkDownTool----\n\n"+
		"usage: escript MarkDownToolConsole.escript ROOT_FOLDER OPTIONS\n\n"+
		"Options:\n"+
		"\t-i\tcreate tutorial index file\n" + 
		"\t-h\tparse MarkDown files to HTML\n" +
		"\t-m\tadd menu for navigation to HTML files\n"
	);
}

var parseHTML = false;
var makeIndex = false;
var addNavigation = false;
var rootFolder = null;

for(var i = 2; i < args.size(); i++){
	if(args[i] == "-i")
		makeIndex = true;
	else if(args[i] == "-h")
		parseHTML = true;
	else if(args[i] == "-m")
		addNavigation = true;
	else if(IO.isDir(args[i]))
		rootFolder = args[i];
	else{
		outln("ERROR: Unkown argument " + args[i]);
		return;
	}
}

if(!rootFolder){
	outln("ERROR: Arguments do not contain root folder");
}

if(makeIndex){
	static IndexBuilder = load(__DIR__ + "/lib/IndexBuilder.escript");
	if(IndexBuilder){
		var indexTree = IndexBuilder.createTree(rootFolder);
		IndexBuilder.createAndSaveIndex(indexTree, true, rootFolder);
	}
	else
		outln("ERROR: Could not find IndexBuilder at " + __DIR__ + "/lib");
}
				
static CodeSectionParser = load(__DIR__ + "/lib/CodeSectionParser.escript");
if(CodeSectionParser)
	CodeSectionParser.recurseFolderAndParse(rootFolder, parseHTML);
else
	outln("ERROR: Could not find CodeSectionParser at " + __DIR__  + "/lib");
			
if(addNavigation){
	static MenuAdder = load(__DIR__ + "/lib/MenuAdder.escript");
	if(MenuAdder)
		MenuAdder.recurseFiles(rootFolder);
	else
		outln("ERROR: Could not find MenuAdder at " + __DIR__ + "/lib");
}
	
outln("Parsing done");

return;