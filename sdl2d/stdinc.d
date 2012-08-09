module sdl2d.stdinc;

import sdl2d.init;
//import sdl2d.assert;
//import sdl2d.atomic;
//import sdl2d.audio;
//import sdl2d.blendmode; // Merged here...
import sdl2d.blit;
//import sdl2d.clipboard; // Merged here...
//import sdl2d.config;
//import sdl2d.cpuinfo;
//import sdl2d.endian;
import sdl2d.error;
import sdl2d.events;
import sdl2d.gesture;
//import sdl2d.input;
//import sdl2d.joystick;
import sdl2d.keyboard;
import sdl2d.keycode;
import sdl2d.pixels;
//import sdl2d.quit; // Merged here...
import sdl2d.rect;
import sdl2d.render;
import sdl2d.rwops;
//import sdl2d.shape; // Merged here...
import sdl2d.surface;
import sdl2d.timer;
//import sdl2d.touch;
import sdl2d.scancode;
import sdl2d.video;

/* -TODO- Merged into by file: SDL_blendmode.h                         -TODO- */
/**
 *  \brief The blend mode used in SDL_RenderCopy() and drawing operations.
 */
extern(C) enum SDL_BlendMode {
    SDL_BLENDMODE_NONE  = 0x00000000,   /**< No blending */
    SDL_BLENDMODE_BLEND = 0x00000001,   /**< dst = (src * A) + (dst * (1-A)) */
    SDL_BLENDMODE_ADD   = 0x00000002,   /**< dst = (src * A) + dst */
    SDL_BLENDMODE_MOD   = 0x00000004    /**< dst = src * dst */
}
/* -TODO- Merged into by file: SDL_blendmode.h                         -TODO- */

/* -TODO- Merged into by file: SDL_shape.h                             -TODO- */
extern(C) {
  enum {
    SDL_NONSHAPEABLE_WINDOW    = -1,
    SDL_INVALID_SHAPE_ARGUMENT = -2,
    SDL_WINDOW_LACKS_SHAPE     = -3
  }
}

/**
 *  \brief Create a window that can be shaped with the specified position,
 *                                                  dimensions, and flags.
 *  
 *  \param title The title of the window, in UTF-8 encoding.
 *  \param x     The x position of the window, ::SDL_WINDOWPOS_CENTERED, or 
 *               ::SDL_WINDOWPOS_UNDEFINED.
 *  \param y     The y position of the window, ::SDL_WINDOWPOS_CENTERED, or 
 *               ::SDL_WINDOWPOS_UNDEFINED.
 *  \param w     The width of the window.
 *  \param h     The height of the window.
 *  \param flags The flags for the window, a mask of SDL_WINDOW_BORDERLESS with
 *               any of the following: 
 *               ::SDL_WINDOW_OPENGL,     ::SDL_WINDOW_INPUT_GRABBED,
 *               ::SDL_WINDOW_SHOWN,      ::SDL_WINDOW_RESIZABLE,
 *               ::SDL_WINDOW_MAXIMIZED,  ::SDL_WINDOW_MINIMIZED,
 *		 ::SDL_WINDOW_BORDERLESS is always set,
 * and ::SDL_WINDOW_FULLSCREEN is always unset.
 *  
 *  \return The window created, or NULL if window creation failed.
 *  
 *  \sa SDL_DestroyWindow()
 */
extern(C) SDL_Window* SDL_CreateShapedWindow(const char* title,
                                             int x,
                                             int y,
                                             int w,
                                             int h,
                                             Uint32 flags);

/**
 * \brief Return whether the given window is a shaped window. 
 *
 * \param window The window to query for being shaped.
 *
 * \return SDL_TRUE if the window is a window that can be shaped, SDL_FALSE if the window is unshaped or NULL.
 * \sa SDL_CreateShapedWindow
 */
extern(C) SDL_bool SDL_IsShapedWindow(const SDL_Window* window);

/** \brief An enum denoting the specific type of contents present in an SDL_WindowShapeParams union. */
extern(C) enum WindowShapeMode {
	/** \brief The default mode, a binarized alpha cutoff of 1. */
	ShapeModeDefault,
	/** \brief A binarized alpha cutoff with a given integer value. */
	ShapeModeBinarizeAlpha,
	/** \brief A binarized alpha cutoff with a given integer value,
	                              but with the opposite comparison. */
	ShapeModeReverseBinarizeAlpha,
	/** \brief A color key is applied. */
	ShapeModeColorKey
}

// #define SDL_SHAPEMODEALPHA(mode) (mode == ShapeModeDefault || mode == ShapeModeBinarizeAlpha || mode == ShapeModeReverseBinarizeAlpha)
int SDL_SHAPEMODEALPHA(int mode) {
 return (mode == WindowShapeMode.ShapeModeDefault ||
         mode == WindowShapeMode.ShapeModeBinarizeAlpha ||
         mode == WindowShapeMode.ShapeModeReverseBinarizeAlpha);
}

/** \brief A union containing parameters for shaped windows. */
extern(C) union SDL_WindowShapeParams {
	/** \brief a cutoff alpha value for binarization of the window shape's
	                                                         alpha channel. */
	Uint8 binarizationCutoff;
	SDL_Color colorKey;
}

/** \brief A struct that tags the SDL_WindowShapeParams union with an enum
                                       describing the type of its contents. */
extern(C) struct SDL_WindowShapeMode {
	/** \brief The mode of these window-shape parameters. */
	WindowShapeMode mode;
	/** \brief Window-shape parameters. */
	SDL_WindowShapeParams parameters;
}

/**
 * \brief Set the shape and parameters of a shaped window.
 *
 * \param window The shaped window whose parameters should be set.
 * \param shape A surface encoding the desired shape for the window.
 * \param shape_mode The parameters to set for the shaped window.
 *
 * \return 0 on success, SDL_INVALID_SHAPE_ARGUMENT on invalid an invalid shape argument, or SDL_NONSHAPEABLE_WINDOW
 *           if the SDL_Window* given does not reference a valid shaped window.
 *
 * \sa SDL_WindowShapeMode
 * \sa SDL_GetShapedWindowMode.
 */
extern(C) int SDL_SetWindowShape(SDL_Window* window,
                                 SDL_Surface* shape,
                                 SDL_WindowShapeMode* shape_mode);

/**
 * \brief Get the shape parameters of a shaped window.
 *
 * \param window The shaped window whose parameters should be retrieved.
 * \param shape_mode An empty shape-mode structure to fill, or NULL to check whether the window has a shape.
 *
 * \return 0 if the window has a shape and, provided shape_mode was not NULL, shape_mode has been filled with the mode
 *           data, SDL_NONSHAPEABLE_WINDOW if the SDL_Window given is not a shaped window, or SDL_WINDOW_LACKS_SHAPE if
 *           the SDL_Window* given is a shapeable window currently lacking a shape.
 *
 * \sa SDL_WindowShapeMode
 * \sa SDL_SetWindowShape
 */
extern(C) int SDL_GetShapedWindowMode(SDL_Window* window,
                                      SDL_WindowShapeMode* shape_mode);

/* -TODO- Merged into by file: SDL_shape.h                             -TODO- */

/* -TODO- Merged into by file: SDL_clipboard.h                         -TODO- */
/**
 * \brief Put UTF-8 text into the clipboard
 *
 * \sa SDL_GetClipboardText()
 */
extern(C) int SDL_SetClipboardText(const char* text);

/**
 * \brief Get UTF-8 text from the clipboard, which must be freed with SDL_free()
 *
 * \sa SDL_SetClipboardText()
 */
extern(C) char* SDL_GetClipboardText();

/* -TODO- Merged into by file: SDL_clipboard.h                         -TODO- */

/**
 *  \name Basic data types
 */
/*@{*/

extern(C) struct SDL_bool {
  enum {
    SDL_FALSE = 0,
    SDL_TRUE = 1
  }
}
/**
 * \brief A signed 8-bit integer type.
 */
alias byte Sint8;
/**
 * \brief An unsigned 8-bit integer type.
 */
alias ubyte Uint8;
/**
 * \brief A signed 16-bit integer type.
 */
alias short Sint16;
/**
 * \brief An unsigned 16-bit integer type.
 */
alias ushort Uint16;
/**
 * \brief A signed 32-bit integer type.
 */
alias int Sint32;
/**
 * \brief An unsigned 32-bit integer type.
 */
alias uint Uint32;
/**
 * \brief A signed 64-bit integer type.
 */
alias long Sint64;
/**
 * \brief An unsigned 64-bit integer type.
 */
alias ulong Uint64;

/*@}*//*Basic data types*/

/* -TODO- Merged into by file: SDL_quit.h                              -TODO- */
/* There are no functions directly affecting the quit event */

//#define SDL_QuitRequested() \
//(SDL_PumpEvents(), (SDL_PeepEvents(NULL,0,SDL_PEEKEVENT,SDL_QUIT,SDL_QUIT)>0))

bool SDL_QuitRequested() {
  SDL_PumpEvents();
  if(SDL_PeepEvents(null, 0, SDL_eventaction.SDL_PEEKEVENT,
                             SDL_EventType.SDL_QUIT,
                             SDL_EventType.SDL_QUIT) > 0) {
    return SDL_bool.SDL_TRUE;
  }
  return SDL_bool.SDL_FALSE;
}//*/
  /* SDL_bool SDL_QuitRequested(void) 
   * Returns SDL_TRUE if SDL_QUIT is queued or SDL_FALSE otherwise.
   * Source: http://wiki.libsdl.org/moin.cgi/SDL_QuitRequested
   */

/* -TODO- Merged into by file: SDL_quit.h                              -TODO- */
/* SDL_stdinc.h */
/*TODO********************************************************************TODO*/
/*TODO******************************* DEVAM EDECEK ***********************TODO*/
/*TODO********************************************************************TODO*/
