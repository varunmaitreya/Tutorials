static Vec2 = Geometry.Vec2;
static Vec3 = Geometry.Vec3;

var buildMesh = fn() {
	// First we build a simple Mesh, consisting of a single quad
	var mb = new Rendering.MeshBuilder();
	mb.color(new Util.Color4f(1,1,1,1));
	// Vertex 0:
	mb.position(new Vec3(0,0,0));
	mb.texCoord0(new Vec2(0,1));
	mb.addVertex();

	// Vertex 1:
	mb.position(new Vec3(10,0,0));
	mb.texCoord0(new Vec2(1,1));
	mb.addVertex();

	// Vertex 2:
	mb.position(new Vec3(10,10,0));
	mb.texCoord0(new Vec2(1,0));
	mb.addVertex();

	// Vertex 3:
	mb.position(new Vec3(0,10,0));
	mb.texCoord0(new Vec2(0,0));
	mb.addVertex();

	// create quad
	mb.addQuad(0,1,2,3);
	// return mesh
	return mb.buildMesh();
};

// build GeometryNode with corresponding mesh
var geo = new MinSG.GeometryNode(buildMesh());
// create chess texture of size 1024*1024, with tiles of side length 64
var chess = Rendering.createChessTexture(1024, 1024, 64);
// create new TextureState
var texState = new MinSG.TextureState(chess);
// you could also set the TextureUnit:
texState.setTextureUnit(0); // only needed if you add more than one texture though...
// add state to node
geo += texState;


// create new scene and add node to it
var sceneNode = new MinSG.ListNode();
sceneNode += geo;
PADrend.registerScene(sceneNode);
PADrend.selectScene(sceneNode);