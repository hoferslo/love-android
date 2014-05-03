/**
 * Copyright (c) 2006-2014 LOVE Development Team
 *
 * This software is provided 'as-is', without any express or implied
 * warranty.  In no event will the authors be held liable for any damages
 * arising from the use of this software.
 *
 * Permission is granted to anyone to use this software for any purpose,
 * including commercial applications, and to alter it and redistribute it
 * freely, subject to the following restrictions:
 *
 * 1. The origin of this software must not be misrepresented; you must not
 *    claim that you wrote the original software. If you use this software
 *    in a product, an acknowledgment in the product documentation would be
 *    appreciated but is not required.
 * 2. Altered source versions must be plainly marked as such, and must not be
 *    misrepresented as being the original software.
 * 3. This notice may not be removed or altered from any source distribution.
 **/

#ifndef LOVE_TOUCH_SDL_TOUCH_H
#define LOVE_TOUCH_SDL_TOUCH_H

// LOVE
#include "touch/Touch.h"

// C++
#include <map>

// SDL
#include <SDL_events.h>

namespace love
{
namespace touch
{
namespace sdl
{

class Touch : public love::touch::Touch
{
public:

	virtual ~Touch() {}

	virtual int getTouchCount() const;
	virtual TouchInfo getTouch(int index) const;

	// Implements Module.
	virtual const char *getName() const;

	// SDL has functions to query the state of touch presses, but unfortunately
	// they are updated on a different thread in some backends, which causes
	// issues especially if the user is iterating through the current touches
	// when they're updated. So we only update our touch press state in
	// love::event::sdl::Event::convert.
	void onEvent(const SDL_TouchFingerEvent &event);

private:

	// All current touches, indexed by their IDs.
	std::map<int64, TouchInfo> touches;

}; // Touch

} // sdl
} // touch
} // love

#endif // LOVE_TOUCH_SDL_TOUCH_H
