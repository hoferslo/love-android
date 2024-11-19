// customBlendMode.glsl
extern vec4 blendFactor; // Custom blend factor

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 screen_coords) {
    vec4 src = color * Texel(texture, texture_coords);   // Source color
    vec4 dest = love_PixelColor;                        // Destination color (what's on the canvas)
    
    // Custom blend formula: src + (dest * blendFactor)
    vec4 result = src + (dest * blendFactor);
    
    // Ensure the result is clamped between 0 and 1
    return clamp(result, 0.0, 1.0);
}
