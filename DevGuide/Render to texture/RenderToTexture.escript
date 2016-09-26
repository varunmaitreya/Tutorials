/*
 * This file is part of the open source part of the
 * Platform for Algorithm Development and Rendering (PADrend).
 * Web page: http://www.padrend.de/
 * Copyright (C) 2016 Florian Pieper <fpieper@mail.upb.de>
 * 
 * PADrend consists of an open source part and a proprietary part.
 * The open source part of PADrend is subject to the terms of the Mozilla
 * Public License, v. 2.0. You should have received a copy of the MPL along
 * with this library; see the file LICENSE. If not, you can obtain one at
 * http://mozilla.org/MPL/2.0/.
 */

var T = new Type(ExtObject);

T._constructor := fn(){
	var _resolution = 512; //TODO
	
	this.fbo := new Rendering.FBO();
	renderingContext.pushAndSetFBO(this.fbo);
	this.mirrorTexture := Rendering.createStdTexture(_resolution, _resolution, true);
	this.fbo.attachColorTexture(renderingContext, this.mirrorTexture);
	renderingContext.popFBO();
	Rendering.checkGLError();
	
	this.createScene();
	
	this.beforeFrame := [this] => fn(thisObj, x){
		//mirror the scene
		var nodeMatrix = thisObj.rootNode.getWorldTransformationMatrix();
		var scaleMatrix = new Geometry.Matrix4x4([1,0,0,0,
													0, 1,0,0,
													0,0,-1,0,
													0,0,0,1]);
		var newNodeMatrix = nodeMatrix * scaleMatrix;
		thisObj.rootNode.setWorldTransformation(newNodeMatrix.toSRT());
	
		//render scene to texture
		thisObj.mirrorNode.deactivate();
		
		//set rendering target
		frameContext.getRenderingContext().pushAndSetFBO(thisObj.fbo);
		/*frameContext.getRenderingContext().clearScreen(new Util.Color4f(0,0,0,1));
		
		var params = (new MinSG.RenderParam)
					.setFlags(MinSG.USE_WORLD_MATRIX|MinSG.FRUSTUM_CULLING) //|MinSG.NO_STATES);
					.setRenderingLayers( 0 );
		thisObj.rootNode.display(frameContext, params);*/
		
		frameContext.getRenderingContext().clearScreen(PADrend.getBGColor());
		PADrend.getRootNode().display(frameContext, PADrend.getRenderingFlags());
		
		frameContext.getRenderingContext().popFBO();
		thisObj.rootNode.setWorldTransformation(nodeMatrix.toSRT());
		thisObj.mirrorNode.activate();
		
		//TODO add current texturecoordinates
		thisObj.updateMirrorMesh();
	};
	
	Util.registerExtension('PADrend_BeforeRendering', this.beforeFrame);
};

T.updateMirrorMesh := fn(){
	var width = 1600;
	var height = 900;
	
	var meshBuilder = new Rendering.MeshBuilder();
	
	var textureCoordinate = frameContext.convertWorldPosToScreenPos(new Geometry.Vec3(-2,0,0));
	meshBuilder.addVertex(new Geometry.Vec3(-2,0,0), new Geometry.Vec3(0,0,1), 1, 1, 1, 1, textureCoordinate.getX()/width, textureCoordinate.getY()/height);//0
	textureCoordinate = frameContext.convertWorldPosToScreenPos(new Geometry.Vec3(2,0,0));
	meshBuilder.addVertex(new Geometry.Vec3( 2,0,0), new Geometry.Vec3(0,0,1), 1, 1, 1, 1, textureCoordinate.getX()/width, textureCoordinate.getY()/height);//1
	textureCoordinate = frameContext.convertWorldPosToScreenPos(new Geometry.Vec3(2,2,0));
	meshBuilder.addVertex(new Geometry.Vec3( 2,2,0), new Geometry.Vec3(0,0,1), 1, 1, 1, 1, textureCoordinate.getX()/width, textureCoordinate.getY()/height);//2
	textureCoordinate = frameContext.convertWorldPosToScreenPos(new Geometry.Vec3(-2,2,0));
	meshBuilder.addVertex(new Geometry.Vec3(-2,2,0), new Geometry.Vec3(0,0,1), 1, 1, 1, 1, textureCoordinate.getX()/width, textureCoordinate.getY()/height);//3
	
	meshBuilder.addQuad(0, 1, 2, 3);
	
	var mirrorMesh = meshBuilder.buildMesh();

	this.mirrorNode.setMesh(mirrorMesh);
};

T.createScene := fn(){
	this.rootNode := new MinSG.ListNode();
	
	this.mirrorNode := new MinSG.GeometryNode();
	this.mirrorNode.addState(new MinSG.TextureState(this.mirrorTexture));
	this.updateMirrorMesh();
	
	var mesh1 = Rendering.MeshBuilder.createBox(new Geometry.Box(0, 0, 0, 2, 2, 2));
	Rendering.setColor(mesh1, new Util.Color4f(1,0,0,1));
	var mesh2 = Rendering.MeshBuilder.createCone(1.0, 2.0, 100); 
	Rendering.setColor(mesh2, new Util.Color4f(0,1,0,1));
	var mesh3 = Rendering.MeshBuilder.createSphere(100, 100);
	Rendering.setColor(mesh3, new Util.Color4f(0,0,1,1));
	
	var node1 = new MinSG.GeometryNode(mesh1);
	var node2 = new MinSG.GeometryNode(mesh2);
	var node3 = new MinSG.GeometryNode(mesh3);
	
	node1.setRelPosition(new Geometry.Vec3(1, 0, 15));
	node2.rotateLocal_deg(90.0, new Geometry.Vec3(0, 0, 1));
	node2.setRelPosition(new Geometry.Vec3(0, 0, 12));
	node3.setRelPosition(new Geometry.Vec3(3, 0, 12));
	
	rootNode += node1;
	rootNode += node2;
	rootNode += node3;
	
	rootNode += this.mirrorNode;
	
	this.rootNode := rootNode;
};


var t = new T();
t.createScene();

var sceneNode = t.rootNode;

PADrend.registerScene(sceneNode);
PADrend.selectScene(sceneNode);