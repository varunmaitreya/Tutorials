/*
Any copyright is dedicated to the Public Domain.
http://creativecommons.org/publicdomain/zero/1.0/
Author: Sascha Brandt <sascha@brandt.graphics>
*/
#include "ExampleRenderer.h"
#include <MinSG/Core/Nodes/GeometryNode.h>
#include <MinSG/Core/Nodes/ListNode.h>
#include <MinSG/Core/FrameContext.h>
#include <MinSG/SceneManagement/Exporter/ExporterTools.h>
#include <MinSG/SceneManagement/Importer/ImporterTools.h>
#include <MinSG/SceneManagement/SceneDescription.h>
#include <Geometry/Box.h>
#include <Rendering/RenderingContext/RenderingContext.h>
#include <Rendering/Shader/Shader.h>
#include <Rendering/Shader/Uniform.h>
#include <Rendering/Draw.h>
#include <Util/Graphics/Color.h>

namespace ExampleProject {
	
// Vertex shader code
static const std::string vsCode = R"**(#version 330
	in vec3 sg_Position; // 3d position
	uniform mat4 sg_matrix_modelToClipping; // model space to screen space
	void main() {
		// transform the vertex to screen space
		gl_Position = sg_matrix_modelToClipping * vec4(sg_Position, 1);
	}
)**";
	
// Fragment shader code
static const std::string fsCode = R"**(#version 330
	uniform vec4 colorOverride;
	out vec4 fsOutColor; // Fragment shader output
	void main() {
		fsOutColor = colorOverride;
	}
)**";

using namespace MinSG;

// Static method that creates a shader object once
static Rendering::Shader* getShader() {
	static Rendering::Shader* shader = nullptr;
	if(!shader)
		shader = Rendering::Shader::createShader(vsCode, fsCode);
	return shader;
}

// ------------------------------------

/**
 * Gets called before traversal.
 * The return value indicates if the traversal should continue or not.
 */
State::stateResult_t ExampleRenderer::doEnableState(FrameContext& context, Node* node, const RenderParam& rp) {
	// call superclass
	auto result = NodeRendererState::doEnableState(context, node, rp);
	if(result != State::STATE_OK)
		return result;
	
	// Set the root node
	rootNode = node;
	
	// Get the shader
	Rendering::Shader* shader = getShader();
	
	// enable shader
	context.getRenderingContext().pushAndSetShader(shader);
	
	// You can also return State::STATE_SKIP_RENDERING to break the traversal (doDisableState does also not get called)
	return State::STATE_OK; // Continue traversal
}

// ------------------------------------

/**
 * Node renderer function.
 * Gets called for each node during traversal (after frustum culling if enabled).
 * The return value indicates if the traversal should continue or not.
 */
NodeRendererResult ExampleRenderer::displayNode(FrameContext& context, Node* node, const RenderParam& rp) {
		
	// Get the shader
	Rendering::Shader* shader = getShader();
	
	// get node position in world coordinates
	Geometry::Vec3 pos = node->getWorldOrigin();
	
	// get the bounding of the root node in world coordinates
	Geometry::Box rootBB = rootNode->getWorldBB();
	
	// normalize position to world bounding box
	pos -= rootBB.getMin();
	pos /= rootBB.getExtentMax();
	
	// use normalized position as colors
	Util::Color4f color(pos.x(), pos.y(), pos.z());
	
	// set shader uniform
	shader->setUniform(context.getRenderingContext(), Rendering::Uniform("colorOverride", color));
	
	// Draw the bounding box of the current node
	if(drawBoundingBox)
		Rendering::drawWireframeBox(context.getRenderingContext(), node->getWorldBB());
		
	// You can call NodeRendererResult::NODE_HANDLED to break traversal for the subtree
	// (The node also doesn't get drawn in this case)
	return NodeRendererResult::PASS_ON; // Continue traversal
}

// ------------------------------------

/**
 * Gets called after traversal.
 */
void ExampleRenderer::doDisableState(FrameContext& context, Node* node, const RenderParam& rp) {
	// call superclass
	NodeRendererState::doDisableState(context, node, rp);
	// disable shader
	context.getRenderingContext().popShader();
}


// ------------------------------------------------------------------------
// Serialization

using namespace MinSG::SceneManagement;

static const std::string STATE_TYPE("ExampleRenderer");
static const std::string ATTR_DRAW_BB("drawBB");

// Exporter function for this renderer so that we can save it in a .minsg file
static void exportState(ExporterContext& ctx, DescriptionMap& desc, State* state) {
	auto s = dynamic_cast<ExampleRenderer*>(state);
	desc.setString(Consts::ATTR_STATE_TYPE, STATE_TYPE);
	desc.setString(ATTR_DRAW_BB, Util::StringUtils::toString(s->getDrawBoundingBox()));
}

// Importer function for this renderer so that we can load it from a .minsg file
static bool importState(ImportContext& ctxt, const std::string& stateType, const DescriptionMap& d, Node* parent) {
	if(stateType != STATE_TYPE)
		return false;
	auto state = new ExampleRenderer;
	state->setDrawBoundingBox(d.getBool(ATTR_DRAW_BB, true));
	ImporterTools::finalizeState(ctxt, state, d);
	parent->addState(state);
	return true;
}

// Register the importer and exporter functions
static bool initExampleRenderer() {
	ExporterTools::registerStateExporter(ExampleRenderer::getClassId(), &exportState);
	ImporterTools::registerStateImporter(&importState);
	return true;
}
// directly register the importer/exporter when the library is loaded
static bool rendererRegistered = initExampleRenderer();

}
