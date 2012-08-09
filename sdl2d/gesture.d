module sdl2d.gesture;

import sdl2d.stdinc;
import sdl2d.error;
import sdl2d.video;
import sdl2d.touch;
import sdl2d.rwops;

alias Sint64 SDL_GestureID;

/* Function prototypes */

/**
 *  \brief Begin Recording a gesture on the specified touch, or all touches (-1)
 *
 *
 */
extern(C) int SDL_RecordGesture(SDL_TouchID touchId);

/**
 *  \brief Save all currently loaded Dollar Gesture templates
 *
 *
 */
extern(C) int SDL_SaveAllDollarTemplates(SDL_RWops *src);

/**
 *  \brief Save a currently loaded Dollar Gesture template
 *
 *
 */
extern(C) int SDL_SaveDollarTemplate(SDL_GestureID gestureId, SDL_RWops* src);

/**
 *  \brief Load Dollar Gesture templates from a file
 *
 *
 */
extern(C) int SDL_LoadDollarTemplates(SDL_TouchID touchId, SDL_RWops *src);

/* SDL_gesture.h */
