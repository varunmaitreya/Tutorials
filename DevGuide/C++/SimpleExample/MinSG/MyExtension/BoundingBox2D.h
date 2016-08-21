// prevent multiple includes of this file
#ifndef MY_EXTENSION_BOUNDINGBOX2D_H_
#define MY_EXTENSION_BOUNDINGBOX2D_H_

#include <Geometry/Vec2.h>

// We're lazy and we just want to write Vec2 instead of Geometry::Vec2
using Geometry::Vec2;

// Never pollute the global namespace!
namespace MinSG {
// Use your plugin specific namespace inside of the MinSG namespace
namespace MyExtension {
// This class is just a very simple example.
// This basic bounding box is defined by two Vec2's, describing the two extreme corners
class BoundingBox2D {
private:
    Vec2 min;
    Vec2 max;
public:
    // Define some useful constructors
    BoundingBox2D() : min(0.0, 0.0), max(0.0, 0.0) {}
    BoundingBox2D(BoundingBox2D& other) : min(other.min), max(other.max) {}
    BoundingBox2D(BoundingBox2D* other) : min(other->min), max(other->max) {}
    BoundingBox2D(Vec2& pmin, Vec2& pmax) : min(pmin), max(pmax) {}
    BoundingBox2D(Vec2* pmin, Vec2* pmax) : min(*pmin), max(*pmax) {}
    BoundingBox2D(float minX, float minY, float maxX, float maxY) : min(minX, minY), max(maxX, maxY) {}
    
    // Define some helper methods to get/set all values
    float getMinX() { return min.x(); }
    void setMinX(float v) { min.setX(v); }
    
    float getMinY() { return min.y(); }
    void setMinY(float v) { min.setY(v); }
    
    float getMaxX() { return max.x(); }
    void setMaxX(float v) { max.setX(v); }
    
    float getMaxY() { return max.y(); }
    void setMaxY(float v) { max.setY(v); }
    
    float getWidth() { return max.x() - min.x(); }
    float getHeight() { return max.y() - min.y(); }
    
    float getArea() { return getWidth() * getHeight(); }
    
    Vec2 getMin() { return min; }
    void setMin(Vec2 v) { min = v; }
    Vec2 getMax() { return max; }
    void setMax(Vec2 v) { max = v; }
    
    Vec2 getCenter() { return (min + max) * 0.5f; }
    
    // Define some additional features
    bool contains(Vec2 v) {
        float x = v.x(), y = v.y();
        return x >= min.x() && x <= max.x() && y >= min.y() && y <= max.y();
    }
    
    bool intersects(BoundingBox2D* other) {
        return abs(getMinX() - other->getMinX()) < (getWidth() + other->getWidth()) / 2
            && abs(getMinY() - other->getMinY()) < (getHeight() + other->getHeight()) / 2;
    }
    
    // (In)equality operators
    inline bool operator==(const BoundingBox2D& other) {
        return min == other.min && max == other.max;
    }
    
    inline bool operator!=(const BoundingBox2D& other) {
        return min != other.min || max != other.max;
    }
};
}
}

#endif
