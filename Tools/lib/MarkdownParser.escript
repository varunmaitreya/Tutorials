/*
 * This file is part of the open source part of the
 * Platform for Algorithm Development and Rendering (PADrend).
 * Web page: http://www.padrend.de/
 * Copyright (C) 2016-2017 Claudius Jähn <claudius@uni-paderborn.de>
 * Copyright (C) 2017 Florian Pieper <fpieper@uni-paderborn.de>
 * 
 * PADrend consists of an open source part and a proprietary part.
 * The open source part of PADrend is subject to the terms of the Mozilla
 * Public License, v. 2.0. You should have received a copy of the MPL along
 * with this library; see the file LICENSE. If not, you can obtain one at
 * http://mozilla.org/MPL/2.0/.
 */

static replaceRange = fn(String input, String start, String end, replaceFn){
	var parts = [];
	var pos = 0;
	while(true){
		var nextStartPos = input.find(start, pos);
		if (!nextStartPos)
			break;
		var nextEndPos = input.find(end, nextStartPos+start.length());
		if (!nextEndPos)
			break;
		parts += input.substr(pos, nextStartPos-pos);
		parts += replaceFn(input.substr(nextStartPos, nextEndPos - nextStartPos+ end.length()));
		pos = nextEndPos + end.length();
	}
	parts += input.substr(pos);
	return parts.implode();
};
static getBeginningWhitespaces = fn(String input){
	var s = "";
	for (var i=0; i<input.length(); ++i){
		if (" \t".find(input[i]))
			s += input[i];
		else
			break;
	}
	return s;
};
/*
	outln(isHeadline("####a")); // true
	outln(isHeadline("####")); // false
	outln(isHeadline("========== fd")); //false
*/
static isHeadline = fn(String tLine){
	if (tLine[0]==='=' || tLine[0]==='#'){
		foreach( ['#', '='] as var marker){
			var i=0;
			while (tLine[i]===marker)
				++i;
			if (i>0 && i<6 &&i<tLine.length())
				return true;
		}
	}
	return false;
};
static isRepetition = fn(String tLine, String c){
	for (var i=tLine.length()-1; i>=0; --i)
		if (tLine[i]!=c)
			return false;
	return true;
};
static isOrderedListItem = fn(String tLine){
	var c = tLine[0];
	if (c>='0'&& c<='9'){
		for (var i=1; i<tLine.length(); ++i){
			c = tLine[i];
			if (c>='0'&& c<='9')
				continue;
			return tLine[i]==='.';
		}
	}
	return false;
};
static isWordCharOrDigit = fn(c){
	return (c>='a'&&c<='z') || (c>='A'&&c<='Z') || (c>='0'&&c<='9') || ord(c)>128;
};
static readTabelHeader = fn(String tline){
	var lineNoWS = tline.replaceAll(" ", "");
	lineNoWS = lineNoWS.replaceAll("\t", "");
	
	if(lineNoWS.beginsWith("|"))
		lineNoWS = lineNoWS.substr(1, lineNoWS.length()-1);
		
	if(lineNoWS.endsWith("|"))
		lineNoWS = lineNoWS.substr(0, lineNoWS.length()-1);
		
	var columnCount = 1;
	var align = [];
	var startOfCol = true;
	var minusCount = 0;
	
	for(var i = 0; i < lineNoWS.length(); i++){
		if(lineNoWS.substr(i,1) == "|"){
			if(minusCount < 3){ //no table since we need at least three -
				return false;
			}
				
			if(align.size() < columnCount)//no explecite alignment in last column, so we go with left by default		
				align += "left";
				
			minusCount = 0;
			columnCount ++;
			startOfCol = true;
		}
		else if(lineNoWS.substr(i,1) == ":"){
			if(startOfCol)
				align += "left";
			else if(i == lineNoWS.length()-1 || lineNoWS.substr(i+1,1) == "|"){ //eol or next is |	
				if(align.size() == columnCount)			//we had already added a left alignment because of a leading :
					align[columnCount-1] = "center"; 	//since we found one more : this means a center alignment 
				else
					align += "right";					//otherwise the alignment is set to right
			}
			else
				return false; //: not at valid position
			
			startOfCol = false;	
		}
		else if(lineNoWS.substr(i,1) == "-"){
			minusCount++;
			startOfCol = false;
		}
		else{//char not accepted
			return false;
		}			
	}
	
	if(align.size() < columnCount) //left alignment of last column
		align += "left";

	return (align.size == 0) ? false : align;
};
static MarkdownParser = new Type;
MarkdownParser.DEFAULT_TEMPLATE := "<!DOCTYPE html>\n"
				"<html><head>\n<meta charset=\"UTF-8\"/>\n"
				"{{{md:htmlHead}}}\n"
				"</head>\n<body>{{{md:header}}}{{{md:content}}}\n</body>\n</html>";
				
/**
	Parse the given markdown document and convert it into an html string using the given template
	to define the header and footer.
 */
MarkdownParser.convertDocument ::= fn(String markdownString, String template = this.DEFAULT_TEMPLATE,
									[Map,void] inReplacements = void){
	var replacements = inReplacements ? inReplacements.clone() : new Map;
	replacements['content'] = this.convertString(markdownString);
	return replaceRange(template,"{{{md:", "}}}", [replacements] => fn(replacements, key){
		key = key.substr(6,-3);
		return replacements[key] ? replacements[key] : "";
	});
};
static Node = new Type;
Node._constructor ::= fn(inTag, inLevel, inFormatStyle=false){
	this.tag = inTag;
	this.level = inLevel;
	this.formatStyle = inFormatStyle;
};
Node.content := "";
Node.level := 0;
Node.tag := "div";
Node.attributes := "";
Node.requiredParent := false;
Node.formatStyle := true;
Node.children @(init) := Array;
Node.printTree ::= fn(l){
	outln("\t"*l, this.tag);
	foreach(this.children as var c)
		c.printTree(l+1);
};


MarkdownParser.getBlocks @(private) ::= fn(String text){
	var lines = text.split("\n");
	var blocks = [];
	var currentBlock = false;
	var prevBlockIndentation = 0;
	
	while (!lines.empty()){
		var line = lines.popFront();
		var tLine = line.trim();

		if (tLine.empty()){
			if (currentBlock){
				blocks += currentBlock;
				currentBlock = false;
			}
			continue;
		}
		
		var ws = getBeginningWhitespaces(line).replace("\t", "    ");
		var wsLevel = (ws.length()/4).floor();

		// indented code block
		if ( wsLevel>0){
			var prevBlock = currentBlock ? currentBlock : blocks.back();
			if (!prevBlock || wsLevel>prevBlock.level){

				if (currentBlock)
					blocks += currentBlock;
				currentBlock = new Node("pre", prevBlock ? (currentBlock ? currentBlock.level+1 : blocks.back().level) : 0, false);
				currentBlock.attributes=" class='code'";
				currentBlock.content = line + "\n";
				while (!lines.empty()){
					line = lines.front();
					tLine = line.trim();
					if (!tLine.empty() &&
							(getBeginningWhitespaces(line).replace("\t", "    ").length()/4).floor()<=currentBlock.level){
						break;
					}
					lines.popFront();
					currentBlock.content += line + "\n";
				}
				blocks += currentBlock;
				currentBlock = false;
				continue;
			}
		}
		if (tLine.beginsWith("```")){
			if (currentBlock){
				blocks += currentBlock;
			}
			currentBlock = new Node("pre", wsLevel, false);
			currentBlock.content = "";
			currentBlock.attributes=" class='code'";

			line = line.substr(line.find("```")+3);
			if (line.find("```")){ // single line code block
				currentBlock.content += line.substr(0, line.find("```"));
			}else{
				var langSpecifier = line.trim(); // first line contains language specifier
				while (!lines.empty()){
					line = lines.popFront();
					if(line.contains("```")){
						currentBlock.content += line.substr(0, line.find("```"));
						if (!langSpecifier.empty())
							currentBlock.attributes=" class='code code-"+langSpecifier+"'"; 
						break;
					}
					currentBlock.content += line + "\n";
				}
			}
			continue;
		}

		// comment block
		if (tLine.beginsWith("<!--")){
			if (currentBlock){
				blocks += currentBlock;
			}
			currentBlock = new Node(false, wsLevel, false);
			currentBlock.content = "";
			
			do{
				if(line.contains("-->")){
					currentBlock.content += line.substr(0, line.find("-->")+3);
					lines.pushFront(line.substr(line.find("-->")+3)); // pop back remainder
					break;
				}
				currentBlock.content += line + "\n";
				line = lines.popFront();
			}while (!lines.empty());
			continue;
		}
		
		//tabel
		if(tLine.contains("|")){
			//possible table, count | and \|, if difference >0 we have a table
			var numberOf = fn(str, searchStr){
				var count = 0;
				for(var i = 0; i < str.length() - searchStr.length() - 1; i++)
					if(str.substr(i, searchStr.length()) == searchStr)
						count++;
				return count;
			};
			var processLine = fn(tLine, alignment, wsLevel, tag){
				var nodes = [];
				
				var split = tLine.split("|");
				
				if(split[0] == "");
					split.popFront();
				if(split[split.size()-1] == "")
					split.popBack();
				
				if(!split.empty()){
					var node = new Node("tr", wsLevel + 1, false);
					node.requiredParent = "table";
					nodes += node;
				}
				//if we have fewer columns than alignments, we fill up with empty fields
				//the other way around we ignore all extra columns
				foreach(alignment as var columnAlignment){
					var content = (split.empty()) ? "" : split.popFront();
					var node = new Node(tag, wsLevel + 2, true);
					node.requiredParent = "tr";
					node.content = content;
					node.attributes = " align='" + columnAlignment + "'";
					node.alignment := alignment;
					nodes += node;
				}
				
				return (nodes.size() > 0) ? nodes : false; 
			};
				
			if(currentBlock && (currentBlock.tag == "td"||currentBlock.tag == "th")){
				//previous node was part of a table
				blocks += currentBlock;
				var alignment = currentBlock.alignment;
				var nodes = processLine(tLine, alignment, wsLevel, "td");
				if(nodes){
					foreach(nodes as var node)
						blocks += node;
				}
				currentBlock = blocks.popBack();
				continue;
			}
			else{
				var alignment = readTabelHeader(tLine);
				if(alignment){//we have a table
					var firstLine = currentBlock.content;
					firstLine = firstLine.trim();
					var nodes = processLine(firstLine, alignment, wsLevel, "th");
					if(nodes && !nodes.empty()){
						var tableNode = new Node("table", wsLevel, false);
						tableNode.attributes = " style='width:auto' border='1' rules='all' cellpadding='6'";
						blocks += tableNode;
						foreach(nodes as var node)
							blocks += node;
						currentBlock = blocks.popBack();
						continue;
					}
				}else{
					if(currentBlock)
						blocks += currentBlock;
				
					currentBlock = new Node("p", wsLevel, true);
					currentBlock.content = line.lTrim() + "\n";
					continue;
					//nodestack is empty, we are not sure if this gets a table (we have not read the |---|... line yet) so we process the node as normal text
				}	
			}
		}
				
		// unordered list item?
		foreach (["+ ", "+\t", "- ", "-\t", "* ", "*\t"] as var bullet){ 
			if (tLine.beginsWith(bullet) && tLine.length()>2){
				if (currentBlock){
					blocks += currentBlock;
				}
				currentBlock = new Node("li", wsLevel, false);
				currentBlock.requiredParent = "ul";
				blocks += currentBlock;
				currentBlock = new Node("p", wsLevel + 1, true);
				currentBlock.content += line.lTrim().substr(2) + "\n";
				break;
			}
		} // ordered list item
		else if (isOrderedListItem(tLine)){
			if (currentBlock){
				blocks += currentBlock;
			}
			currentBlock = new Node("li", wsLevel, false);
			currentBlock.requiredParent = "ol";
			blocks += currentBlock;
			currentBlock = new Node("p", wsLevel + 1, true);
			currentBlock.content += line.substr(line.find(".")+1).lTrim() + "\n";
			continue;
		} // headline
		else if (isHeadline(tLine)){
			if (currentBlock)
				blocks += currentBlock;

			var headlineMarker = tLine[0];
			var counter=0;
			while (tLine[counter]===headlineMarker)
				++counter;
			line = tLine.substr(counter).lTrim();
			var i = line.length()-1;
			while (i>=0 && line[i]===headlineMarker)
				--i;
			line = line.substr(0, i+1).rTrim();
				
			currentBlock = new Node("h" + counter, wsLevel, true);
			currentBlock.content = line;
			blocks += currentBlock;
			currentBlock = false;
			continue;
		} // underlined headline
		else if ( (isRepetition(tLine,"-")||isRepetition(tLine,"=")) && tLine.length()>3 && 
				currentBlock && currentBlock.tag == 'p' && !currentBlock.content.trim().contains("\n")){
			currentBlock.tag = "h" + (tLine[0]=="-" ? 1 : 2);
			blocks += currentBlock;
			currentBlock = false;
			continue;
		}
		// else normal text
		else {
			if (!currentBlock){
				currentBlock = new Node("p", wsLevel, true);
				currentBlock.content = "";
			}
			currentBlock.content += line.lTrim() + "\n";
		}
	}
	if (currentBlock)
		blocks += currentBlock;

	return blocks;
};

MarkdownParser.formatStyles @(private) ::= fn(String text){
	var replacements = new Map;
	text = text.replaceAll( "  \n", "<br/>\n"); // explicit line breaks
	
	// images
	{
		var pos = 0;
		var parts = [];
		while (true){
			var p1 = text.find("![", pos);
			if (!p1)
				break;
			var p2 = text.find("](", p1+2);
			if (!p2)
				break;
			var p3 = text.find(")", p2+2);
			if (!p3)
				break;

			parts += text.substr(pos, p1-pos);

			var pTitle = text.find('"', p2);
			var urlEnd = p3;
			if (pTitle && pTitle<p3)
				urlEnd = p3;
			var p4 = text.find(" ", p2);
			if (p4 && p4<p3)
				urlEnd = p4;
			
			var img = '<img src="' + text.substr(p2+2, urlEnd-p2-2) + '"';
			var alt = text.substr(p1+2, p2-p1-2).trim();
			if (!alt.empty())
				img += ' alt="' + alt.replaceAll('"',"&quot;") + '"';
			if (pTitle){
				var title = text.substr(urlEnd, p3-urlEnd-1).replace('"', "").trim();
				if (!title.empty())
					img += ' title="' + title + '"';
			}
			img += "/>";

			var placeholder = "$$(inline," + replacements.count() + ")$$";
			replacements[placeholder] = img;
			parts += placeholder;

			pos = p3+1;
		}
		parts += text.substr(pos);
		text = parts.implode();
	}

	// links
	{
		var pos = 0;
		var parts = [];
		while (true){
			var p1 = text.find("[", pos);
			if (!p1)
				break;
			var p2 = text.find("](", p1+1);
			if (!p2)
				break;
			var p3 = text.find(")", p2+2);
			if (!p3)
				break;

			parts += text.substr(pos, p1-pos);

			var pTitle = text.find('"', p2);
			var urlEnd = p3;
			if (pTitle && pTitle<p3)
				urlEnd = p3;
			var p4 = text.find(" ", p2);
			if (p4 && p4<p3)
				urlEnd = p4;
			
			var anchor = '<a href="' + text.substr(p2+2, urlEnd-p2-2) + '"';
			var linkText = text.substr(p1+1, p2-p1-1).trim();

			if (pTitle){
				var title = text.substr(urlEnd, p3-urlEnd-1).replace('"', "").trim();
				if (!title.empty())
					anchor += ' title="' + title + '"';
			}
			anchor += ">" + linkText + "</a>";

			var placeholder = "$$(inline," + replacements.count() + ")$$";
			replacements[placeholder] = anchor;
			parts += placeholder;

			pos = p3+1;
		}
		parts += text.substr(pos);
		text = parts.implode();
	}
	
	{
		// text formatting
		var lines = text.split("\n");
		foreach ([["**","<strong>","</strong>"], ["__","<strong>","</strong>"], ["*", "<emph>", "</emph>"], ["_", "<emph>", "</emph>"], ["`", "<code>", "</code>"]] as var markerAndTags){
			[var marker, var startTag, var endTag] = markerAndTags;
			var markerLength = marker .length();
			var linesInput = lines;
			lines = [];

			foreach(linesInput as var line){
				var possibleMarkerPositions = [];
			
				for (var pos = line.find(marker); pos; pos = line.find(marker, pos+1)){
					var before = line.substr(pos-1, 1);
					var after = line.substr(pos + markerLength, 1);
					if ( !(before.empty() && after===" ") && !(before===" " && after===" ") && before!==marker[0] && after!==marker[0] && before!=='\\' 
							&& !(isWordCharOrDigit(before) && isWordCharOrDigit(after)))
						possibleMarkerPositions += pos;
				}
				if (!possibleMarkerPositions.empty()){
					var parts = [];
					var pos = 0;
					for (var i = 0; i<possibleMarkerPositions.size()-1; i+=2){
						var p1 = possibleMarkerPositions[i];
						var p2 = possibleMarkerPositions[i+1];
						parts += line.substr(pos, p1-pos);
						parts += startTag + line.substr(p1 + markerLength, p2-p1-markerLength) + endTag;
						pos = p2 + markerLength;
					}
					parts += line.substr(pos);
					line = parts.implode();
				}
				lines += line;
			}
		}
		text=lines.implode("\n");
	}
	
	{ // fill in replacements (after text formatting to skip formatting of links)
		var parts = [];

		var pos = 0;
		var lastPos = 0;
		for (pos = text.find("$$("); pos; pos = text.find("$$(", pos + 3)){
			parts += text.substr(lastPos, pos-lastPos);
			var pos2 = text.find(")$$", pos + 3);
			parts += replacements[text.substr(pos, pos2 - pos + 3)];
			lastPos = pos2 + 3;
		}
		parts += text.substr(lastPos);

		text = parts.implode();
	}
	
	return text.trim();
};

/**
	Parse the given markdown strin and convert it into an html string. 
	@see for converting complete documents, see convertDocument(...)
 */
MarkdownParser.convertString ::= fn(String text){
	// normalize line endings
	text = text.replace("\r","");
	
	// step 1: extract blocks
	var blocks = this.getBlocks(text);

	// step 2: perform style replacements
	foreach(blocks as var b){
		if (b.formatStyle)
			b.content = this.formatStyles(b.content);
	}
	
	// step 3: build tree (and add intermediate nodes)
	var root = new Node(false, -1);
	{
		var stack = [root];
		foreach(blocks as var b){
			while (stack.back().level>=b.level)
				stack.popBack();
			if (b.requiredParent && stack.back().tag!=b.requiredParent){ // require intermediate node
				if (stack.back().children.back() && stack.back().children.back().tag === b.requiredParent){ // can re-open prior node
					stack += stack.back().children.back();
					stack.back().children += b;
				}else{ // insert new intermediate node
					var newParent = new Node(b.requiredParent,b.level);
					stack.back().children += newParent;
					newParent.children +=b;
					stack += newParent;
				}
			}else{
				stack.back().children += b;
			}
			stack += b;
		}
	}
	
	// step 4: create html
	var resultLines = [];
	(fn(node,level,resultLines){
		var contentLines = node.content.split("\n");
		if (node.tag && contentLines.size()<=1 && node.children.empty()){
			resultLines += "\t"*level + "<" + node.tag + node.attributes + ">" + contentLines.front() + "</" + node.tag + ">";
		}else if(node.tag){
			resultLines += "\t"*level + "<" + node.tag + node.attributes +">";
			foreach (contentLines as var line)
				resultLines += "\t"*(level+1) + line;
			foreach(node.children as var c)
				thisFn(c, level+1, resultLines);
			resultLines += "\t"*level + "</" + node.tag + ">";
		}else{
			foreach (contentLines as var line)
				resultLines += "\t"*level + line;
			foreach(node.children as var c)
				thisFn(c, level+1, resultLines);
		}
	})(root, -1, resultLines);
	
	return resultLines.implode("\n");
};

MarkdownParser.test1 ::= fn(){
	
	if(GLOBALS.getOS()=="WINDOWS") // clear screen 
		system("cls");
	var filename = './PADrend_Tutorials/MarkdownTest.md';
	//var filename = './PADrend_Tutorials/test.md';
	var text = Util.loadFile(filename);
	outln(text);
	var parser = new MarkdownParser;
	var html = parser.convertDocument(text);
		Util.saveFile(filename+".html", html);
	outln(html);
};

MarkdownParser.test2 ::= fn(){
	var tests = [
		["# headline1 #\n", "<h1>headline1</h1>"],
		["== headline2\n", "<h2>headline2</h2>"],
		["### headline3 ########\n", "<h3>headline3</h3>"],
		["===headline3b==========\n", "<h3>headline3b</h3>"],
		["headline1\n------\n", "<h1>headline1</h1>"],
		["headline2\n======\n", "<h2>headline2</h2>"],
		["Simple paragraph with *emphasized text*.\n", "<p>Simple paragraph with <emph>emphasized text</emph>.</p>"],
		["Simple paragraph with _emphasized text_.\n", "<p>Simple paragraph with <emph>emphasized text</emph>.</p>"],
		["Simple paragraph with **strong text**.\n", "<p>Simple paragraph with <strong>strong text</strong>.</p>"],
		["Simple paragraph with __strong text__.\n", "<p>Simple paragraph with <strong>strong text</strong>.</p>"],
		["Paragraph with a forced  \nlinebreak.\n", "<p>\n\tParagraph with a forced<br/>\n\tlinebreak.\n</p>"],
		["The following formula must not contain emphasized text: 1 * 2 = 2 * 1\n", "<p>The following formula must not contain emphasized text: 1 * 2 = 2 * 1</p>"],
		["This is a emphasized formular *1 * 2 = 2 * 1*.\n", "<p>This is a emphasized formular <emph>1 * 2 = 2 * 1</emph>.</p>"],
		["Image: ![Alternative \"text\"](figures/anUrl.png)", "<p>Image: <img src=\"figures/anUrl.png\" alt=\"Alternative &quot;text&quot;\"/></p>"],
		["Image2: ![alt](http://foo.bar/ding.gif \"title text\")", "<p>Image2: <img src=\"http://foo.bar/ding.gif\" alt=\"alt\" title=\"title text\"/></p>"],
		["[This is a link](https://foo.bar)", "<p><a href=\"https://foo.bar\">This is a link</a></p>"],
		["[This is a link](https://foo.bar \"title\")", "<p><a href=\"https://foo.bar\" title=\"title\">This is a link</a></p>"],
		["_ALIGN_X_RIGHT_ ", "<p><emph>ALIGN_X_RIGHT</emph></p>"],

	];
	foreach(tests as var testAndExpectedResult){
		[var test, var expectedResult] = testAndExpectedResult;
		var result = (new MarkdownParser).convertString(test);
		if (result.trim()===expectedResult.trim())
			outln("ok.");
		else
			outln("Error:", test, "\n", result, "\nexpected:\n", expectedResult);
	}
};
//MarkdownParser.test1();
//MarkdownParser.test2();

return MarkdownParser;
