module sdl2d.keyboard;

import sdl2d.stdinc;
import sdl2d.error;
import sdl2d.keycode;
import sdl2d.scancode;
import sdl2d.rect;
import sdl2d.video;

/**
 *  \brief The SDL keysym structure, used in key events.
 */
extern(C) struct SDL_Keysym {
    SDL_Scancode scancode;      /**< SDL physical key code - see ::SDL_Scancode for details */
    SDL_Keycode sym;            /**< SDL virtual key code - see ::SDL_Keycode for details */
    Uint16 mod;                 /**< current key modifiers */
    Uint32 unicode;             /**< \deprecated use SDL_TextInputEvent instead */
};

/* Function prototypes */

/**
 *  \brief Get the window which currently has keyboard focus.
 */
extern(C) SDL_Window* SDL_GetKeyboardFocus();

/**
 *  \brief Get a snapshot of the current state of the keyboard.
 *  
 *  \param numkeys if non-NULL, receives the length of the returned array.
 *  
 *  \return An array of key states. Indexes into this array are obtained by using ::SDL_Scancode values.
 *  
 *  \b Example:
 *  \code
 *  Uint8 *state = SDL_GetKeyboardState(NULL);
 *  if ( state[SDL_SCANCODE_RETURN] )   {
 *      printf("<RETURN> is pressed.\n");
 *  }
 *  \endcode
 */
extern(C) Uint8* SDL_GetKeyboardState(int* numkeys);

/**
 *  \brief Get the current key modifier state for the keyboard.
 */
extern(C) SDL_Keymod SDL_GetModState();

/**
 *  \brief Set the current key modifier state for the keyboard.
 *  
 *  \note This does not change the keyboard state, only the key modifier flags.
 */
extern(C) void SDL_SetModState(SDL_Keymod modstate);

/**
 *  \brief Get the key code corresponding to the given scancode according
 *         to the current keyboard layout.
 *  
 *  See ::SDL_Keycode for details.
 *  
 *  \sa SDL_GetKeyName()
 */
extern(C) SDL_Keycode SDL_GetKeyFromScancode(SDL_Scancode scancode);

/**
 *  \brief Get the scancode corresponding to the given key code according to the
 *         current keyboard layout.
 *  
 *  See ::SDL_Scancode for details.
 *  
 *  \sa SDL_GetScancodeName()
 */
extern(C) SDL_Scancode SDL_GetScancodeFromKey(SDL_Keycode key);

/**
 *  \brief Get a human-readable name for a scancode.
 *  
 *  \return A pointer to the name for the scancode.
 *          If the scancode doesn't have a name, this function returns
 *          an empty string ("").
 *
 *  \sa SDL_Scancode
 */
extern(C) char* SDL_GetScancodeName(SDL_Scancode scancode);
// aslında const char* idi...
/**
 *  \brief Get a scancode from a human-readable name
 *  
 *  \return scancode, or SDL_SCANCODE_UNKNOWN if the name wasn't recognized
 *
 *  \sa SDL_Scancode
 */
extern(C) SDL_Scancode SDL_GetScancodeFromName(const char* name);

/**
 *  \brief Get a human-readable name for a key.
 *  
 *  \return A pointer to a UTF-8 string that stays valid at least until the next
 *          call to this function. If you need it around any longer, you must 
 *          copy it.  If the key doesn't have a name, this function returns an 
 *          empty string ("").
 *  
 *  \sa SDL_Key
 */
extern(C) char* SDL_GetKeyName(SDL_Keycode key);
// aslında const char* idi...
/**
 *  \brief Get a key code from a human-readable name
 *  
 *  \return key code, or SDLK_UNKNOWN if the name wasn't recognized
 *
 *  \sa SDL_Keycode
 */
extern(C) SDL_Keycode SDL_GetKeyFromName(const char* name);

/**
 *  \brief Start accepting Unicode text input events.
 *  
 *  \sa SDL_StopTextInput()
 *  \sa SDL_SetTextInputRect()
 */
extern(C) void SDL_StartTextInput();

/**
 *  \brief Stop receiving any text input events.
 *  
 *  \sa SDL_StartTextInput()
 */
extern(C) void SDL_StopTextInput();

/**
 *  \brief Set the rectangle used to type Unicode text inputs.
 *  
 *  \sa SDL_StartTextInput()
 */
extern(C) void SDL_SetTextInputRect(SDL_Rect* rect);

/* SDL_keyboard.h*/
