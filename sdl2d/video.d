module sdl2d.video;

import sdl2d.stdinc;
import sdl2d.pixels;
import sdl2d.rect;
import sdl2d.surface;

/**
 *  \brief  The structure that defines a display mode
 *  
 *  \sa SDL_GetNumDisplayModes()
 *  \sa SDL_GetDisplayMode()
 *  \sa SDL_GetDesktopDisplayMode()
 *  \sa SDL_GetCurrentDisplayMode()
 *  \sa SDL_GetClosestDisplayMode()
 *  \sa SDL_SetWindowDisplayMode()
 *  \sa SDL_GetWindowDisplayMode()
 */
extern(C) struct SDL_DisplayMode {
    Uint32 format;              /**< pixel format */
    int w;                      /**< width */
    int h;                      /**< height */
    int refresh_rate;           /**< refresh rate (or zero for unspecified) */
    void* driverdata;           /**< driver-specific data, initialize to 0 */
}

/**
 *  \brief The type used to identify a window
 *  
 *  \sa SDL_CreateWindow()
 *  \sa SDL_CreateWindowFrom()
 *  \sa SDL_DestroyWindow()
 *  \sa SDL_GetWindowData()
 *  \sa SDL_GetWindowFlags()
 *  \sa SDL_GetWindowGrab()
 *  \sa SDL_GetWindowPosition()
 *  \sa SDL_GetWindowSize()
 *  \sa SDL_GetWindowTitle()
 *  \sa SDL_HideWindow()
 *  \sa SDL_MaximizeWindow()
 *  \sa SDL_MinimizeWindow()
 *  \sa SDL_RaiseWindow()
 *  \sa SDL_RestoreWindow()
 *  \sa SDL_SetWindowData()
 *  \sa SDL_SetWindowFullscreen()
 *  \sa SDL_SetWindowGrab()
 *  \sa SDL_SetWindowIcon()
 *  \sa SDL_SetWindowPosition()
 *  \sa SDL_SetWindowSize()
 *  \sa SDL_SetWindowTitle()
 *  \sa SDL_ShowWindow()
 */
extern(C) struct SDL_Window;

/**
 *  \brief The flags on a window
 *  
 *  \sa SDL_GetWindowFlags()
 */
extern(C) enum SDL_WindowFlags {
    SDL_WINDOW_FULLSCREEN    = 0x00000001, /**< fullscreen window */
    SDL_WINDOW_OPENGL        = 0x00000002, /**< window usable with OpenGL context */
    SDL_WINDOW_SHOWN         = 0x00000004, /**< window is visible */
    SDL_WINDOW_HIDDEN        = 0x00000008, /**< window is not visible */
    SDL_WINDOW_BORDERLESS    = 0x00000010, /**< no window decoration */
    SDL_WINDOW_RESIZABLE     = 0x00000020, /**< window can be resized */
    SDL_WINDOW_MINIMIZED     = 0x00000040, /**< window is minimized */
    SDL_WINDOW_MAXIMIZED     = 0x00000080, /**< window is maximized */
    SDL_WINDOW_INPUT_GRABBED = 0x00000100, /**< window has grabbed input focus */
    SDL_WINDOW_INPUT_FOCUS   = 0x00000200, /**< window has input focus */
    SDL_WINDOW_MOUSE_FOCUS   = 0x00000400, /**< window has mouse focus */
    SDL_WINDOW_FOREIGN       = 0x00000800  /**< window not created by SDL */
}
/+
/**
 *  \brief Used to indicate that you don't care what the window position is.
 */
#define SDL_WINDOWPOS_UNDEFINED_MASK    0x1FFF0000
#define SDL_WINDOWPOS_UNDEFINED_DISPLAY(X)  (SDL_WINDOWPOS_UNDEFINED_MASK|(X))
#define SDL_WINDOWPOS_UNDEFINED         SDL_WINDOWPOS_UNDEFINED_DISPLAY(0)
#define SDL_WINDOWPOS_ISUNDEFINED(X)    \
            (((X)&0xFFFF0000) == SDL_WINDOWPOS_UNDEFINED_MASK)

/**
 *  \brief Used to indicate that the window position should be centered.
 */
#define SDL_WINDOWPOS_CENTERED_MASK    0x2FFF0000
#define SDL_WINDOWPOS_CENTERED_DISPLAY(X)  (SDL_WINDOWPOS_CENTERED_MASK|(X))
#define SDL_WINDOWPOS_CENTERED         SDL_WINDOWPOS_CENTERED_DISPLAY(0)
#define SDL_WINDOWPOS_ISCENTERED(X)    \
            (((X)&0xFFFF0000) == SDL_WINDOWPOS_CENTERED_MASK)
+/
/**
 *  \brief Event subtype for window events
 */
extern(C) enum SDL_WindowEventID {
    SDL_WINDOWEVENT_NONE,           /**< Never used */
    SDL_WINDOWEVENT_SHOWN,          /**< Window has been shown */
    SDL_WINDOWEVENT_HIDDEN,         /**< Window has been hidden */
    SDL_WINDOWEVENT_EXPOSED,        /**< Window has been exposed and should be 
                                         redrawn */
    SDL_WINDOWEVENT_MOVED,          /**< Window has been moved to data1, data2 
                                     */
    SDL_WINDOWEVENT_RESIZED,        /**< Window has been resized to data1xdata2 */
    SDL_WINDOWEVENT_SIZE_CHANGED,   /**< The window size has changed, either as
                                         a result of an API call or through the
                                         system or user changing the window
                                         size. */
    SDL_WINDOWEVENT_MINIMIZED,      /**< Window has been minimized */
    SDL_WINDOWEVENT_MAXIMIZED,      /**< Window has been maximized */
    SDL_WINDOWEVENT_RESTORED,       /**< Window has been restored to normal size
                                         and position */
    SDL_WINDOWEVENT_ENTER,          /**< Window has gained mouse focus */
    SDL_WINDOWEVENT_LEAVE,          /**< Window has lost mouse focus */
    SDL_WINDOWEVENT_FOCUS_GAINED,   /**< Window has gained keyboard focus */
    SDL_WINDOWEVENT_FOCUS_LOST,     /**< Window has lost keyboard focus */
    SDL_WINDOWEVENT_CLOSE           /**< The window manager requests that the 
                                         window be closed */
}

/**
 *  \brief An opaque handle to an OpenGL context.
 */
alias void* SDL_GLContext;

/**
 *  \brief OpenGL configuration attributes
 */
extern(C) enum SDL_GLattr {
    SDL_GL_RED_SIZE,
    SDL_GL_GREEN_SIZE,
    SDL_GL_BLUE_SIZE,
    SDL_GL_ALPHA_SIZE,
    SDL_GL_BUFFER_SIZE,
    SDL_GL_DOUBLEBUFFER,
    SDL_GL_DEPTH_SIZE,
    SDL_GL_STENCIL_SIZE,
    SDL_GL_ACCUM_RED_SIZE,
    SDL_GL_ACCUM_GREEN_SIZE,
    SDL_GL_ACCUM_BLUE_SIZE,
    SDL_GL_ACCUM_ALPHA_SIZE,
    SDL_GL_STEREO,
    SDL_GL_MULTISAMPLEBUFFERS,
    SDL_GL_MULTISAMPLESAMPLES,
    SDL_GL_ACCELERATED_VISUAL,
    SDL_GL_RETAINED_BACKING,
    SDL_GL_CONTEXT_MAJOR_VERSION,
    SDL_GL_CONTEXT_MINOR_VERSION,
    SDL_GL_CONTEXT_EGL,
    SDL_GL_CONTEXT_FLAGS,
    SDL_GL_CONTEXT_PROFILE_MASK
}

extern(C) enum SDL_GLprofile {
    SDL_GL_CONTEXT_PROFILE_CORE           = 0x0001,
    SDL_GL_CONTEXT_PROFILE_COMPATIBILITY  = 0x0002,
    SDL_GL_CONTEXT_PROFILE_ES2            = 0x0004
}

extern(C) enum SDL_GLcontextFlag {
    SDL_GL_CONTEXT_DEBUG_FLAG              = 0x0001,
    SDL_GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 0x0002,
    SDL_GL_CONTEXT_ROBUST_ACCESS_FLAG      = 0x0004
}


/* Function prototypes */

/**
 *  \brief Get the number of video drivers compiled into SDL
 *  
 *  \sa SDL_GetVideoDriver()
 */
extern(C) int SDL_GetNumVideoDrivers();

/**
 *  \brief Get the name of a built in video driver.
 *  
 *  \note The video drivers are presented in the order in which they are
 *        normally checked during initialization.
 *  
 *  \sa SDL_GetNumVideoDrivers()
 */
extern(C) char* SDL_GetVideoDriver(int index);
// aslında const char* idi...
/**
 *  \brief Initialize the video subsystem, optionally specifying a video driver.
 *  
 *  \param driver_name Initialize a specific driver by name, or NULL for the 
 *                     default video driver.
 *  
 *  \return 0 on success, -1 on error
 *  
 *  This function initializes the video subsystem; setting up a connection
 *  to the window manager, etc, and determines the available display modes
 *  and pixel formats, but does not initialize a window or graphics mode.
 *  
 *  \sa SDL_VideoQuit()
 */
extern(C) int SDL_VideoInit(const char* driver_name);

/**
 *  \brief Shuts down the video subsystem.
 *  
 *  This function closes all windows, and restores the original video mode.
 *  
 *  \sa SDL_VideoInit()
 */ 
extern(C) void SDL_VideoQuit();

/**
 *  \brief Returns the name of the currently initialized video driver.
 *  
 *  \return The name of the current video driver or NULL if no driver
 *          has been initialized
 *  
 *  \sa SDL_GetNumVideoDrivers()
 *  \sa SDL_GetVideoDriver()
 */
extern(C) char* SDL_GetCurrentVideoDriver();
// aslında const char* idi...
/**
 *  \brief Returns the number of available video displays.
 *  
 *  \sa SDL_GetDisplayBounds()
 */
extern(C) int SDL_GetNumVideoDisplays();

/**
 *  \brief Get the desktop area represented by a display, with the primary
 *         display located at 0,0
 *  
 *  \return 0 on success, or -1 if the index is out of range.
 *  
 *  \sa SDL_GetNumVideoDisplays()
 */
extern(C) int SDL_GetDisplayBounds(int displayIndex, SDL_Rect* rect);

/**
 *  \brief Returns the number of available display modes.
 *  
 *  \sa SDL_GetDisplayMode()
 */
extern(C) int SDL_GetNumDisplayModes(int displayIndex);

/**
 *  \brief Fill in information about a specific display mode.
 *  
 *  \note The display modes are sorted in this priority:
 *        \li bits per pixel -> more colors to fewer colors
 *        \li width -> largest to smallest
 *        \li height -> largest to smallest
 *        \li refresh rate -> highest to lowest
 *  
 *  \sa SDL_GetNumDisplayModes()
 */
extern(C) int SDL_GetDisplayMode(int displayIndex,
                                 int modeIndex,
                                 SDL_DisplayMode* mode);

/**
 *  \brief Fill in information about the desktop display mode.
 */
extern(C) int SDL_GetDesktopDisplayMode(int displayIndex,
                                        SDL_DisplayMode* mode);

/**
 *  \brief Fill in information about the current display mode.
 */
extern(C) int SDL_GetCurrentDisplayMode(int displayIndex, SDL_DisplayMode* mode);

/**
 *  \brief Get the closest match to the requested display mode.
 *  
 *  \param mode The desired display mode
 *  \param closest A pointer to a display mode to be filled in with the closest 
 *                 match of the available display modes.
 *  
 *  \return The passed in value \c closest, or NULL if no matching video mode 
 *          was available.
 *  
 *  The available display modes are scanned, and \c closest is filled in with the
 *  closest mode matching the requested mode and returned.  The mode format and 
 *  refresh_rate default to the desktop mode if they are 0.  The modes are 
 *  scanned with size being first priority, format being second priority, and 
 *  finally checking the refresh_rate.  If all the available modes are too 
 *  small, then NULL is returned.
 *  
 *  \sa SDL_GetNumDisplayModes()
 *  \sa SDL_GetDisplayMode()
 */
extern(C) SDL_DisplayMode* SDL_GetClosestDisplayMode(int displayIndex,
                                                     const SDL_DisplayMode* mode,
                                                     SDL_DisplayMode* closest);

/**
 *  \brief Get the display index associated with a window.
 *  
 *  \return the display index of the display containing the center of the
 *          window, or -1 on error.
 */
extern(C) int SDL_GetWindowDisplay(SDL_Window* window);

/**
 *  \brief Set the display mode used when a fullscreen window is visible.
 *
 *  By default the window's dimensions and the desktop format and refresh rate
 *  are used.
 *  
 *  \param mode The mode to use, or NULL for the default mode.
 *  
 *  \return 0 on success, or -1 if setting the display mode failed.
 *  
 *  \sa SDL_GetWindowDisplayMode()
 *  \sa SDL_SetWindowFullscreen()
 */
extern(C) int SDL_SetWindowDisplayMode(SDL_Window* window,
                                       const SDL_DisplayMode* mode);

/**
 *  \brief Fill in information about the display mode used when a fullscreen
 *         window is visible.
 *
 *  \sa SDL_SetWindowDisplayMode()
 *  \sa SDL_SetWindowFullscreen()
 */
extern(C) int SDL_GetWindowDisplayMode(SDL_Window* window,
                                       SDL_DisplayMode* mode);

/**
 *  \brief Get the pixel format associated with the window.
 */
extern(C) Uint32 SDL_GetWindowPixelFormat(SDL_Window* window);

/**
 *  \brief Create a window with the specified position, dimensions, and flags.
 *  
 *  \param title The title of the window, in UTF-8 encoding.
 *  \param x     The x position of the window, ::SDL_WINDOWPOS_CENTERED, or 
 *               ::SDL_WINDOWPOS_UNDEFINED.
 *  \param y     The y position of the window, ::SDL_WINDOWPOS_CENTERED, or 
 *               ::SDL_WINDOWPOS_UNDEFINED.
 *  \param w     The width of the window.
 *  \param h     The height of the window.
 *  \param flags The flags for the window, a mask of any of the following: 
 *               ::SDL_WINDOW_FULLSCREEN, ::SDL_WINDOW_OPENGL, 
 *               ::SDL_WINDOW_SHOWN,      ::SDL_WINDOW_BORDERLESS, 
 *               ::SDL_WINDOW_RESIZABLE,  ::SDL_WINDOW_MAXIMIZED, 
 *               ::SDL_WINDOW_MINIMIZED,  ::SDL_WINDOW_INPUT_GRABBED.
 *  
 *  \return The id of the window created, or zero if window creation failed.
 *  
 *  \sa SDL_DestroyWindow()
 */
extern(C) SDL_Window* SDL_CreateWindow(const char* title,
                                       int x,
                                       int y,
                                       int w,
                                       int h,
                                       Uint32 flags);

/**
 *  \brief Create an SDL window from an existing native window.
 *  
 *  \param data A pointer to driver-dependent window creation data
 *  
 *  \return The id of the window created, or zero if window creation failed.
 *  
 *  \sa SDL_DestroyWindow()
 */
extern(C) SDL_Window* SDL_CreateWindowFrom(const void* data);

/**
 *  \brief Get the numeric ID of a window, for logging purposes.
 */
extern(C) Uint32 SDL_GetWindowID(SDL_Window* window);

/**
 *  \brief Get a window from a stored ID, or NULL if it doesn't exist.
 */
extern(C) SDL_Window* SDL_GetWindowFromID(Uint32 id);

/**
 *  \brief Get the window flags.
 */
extern(C) Uint32 SDL_GetWindowFlags(SDL_Window* window);

/**
 *  \brief Set the title of a window, in UTF-8 format.
 *  
 *  \sa SDL_GetWindowTitle()
 */
extern(C) void SDL_SetWindowTitle(SDL_Window* window,
                                  const char* title);

/**
 *  \brief Get the title of a window, in UTF-8 format.
 *  
 *  \sa SDL_SetWindowTitle()
 */
extern(C) char* SDL_GetWindowTitle(SDL_Window* window);
// aslında const char* idi...
/**
 *  \brief Set the icon for a window.
 *  
 *  \param icon The icon for the window.
 */
extern(C) void SDL_SetWindowIcon(SDL_Window* window,
                                 SDL_Surface* icon);

/**
 *  \brief Associate an arbitrary named pointer with a window.
 *  
 *  \param window   The window to associate with the pointer.
 *  \param name     The name of the pointer.
 *  \param userdata The associated pointer.
 *
 *  \return The previous value associated with 'name'
 *
 *  \note The name is case-sensitive.
 *
 *  \sa SDL_GetWindowData()
 */
extern(C) void* SDL_SetWindowData(SDL_Window* window,
                                  const char* name,
                                  void* userdata);

/**
 *  \brief Retrieve the data pointer associated with a window.
 *  
 *  \param window   The window to query.
 *  \param name     The name of the pointer.
 *
 *  \return The value associated with 'name'
 *  
 *  \sa SDL_SetWindowData()
 */
extern(C) void *SDL_GetWindowData(SDL_Window* window,
                                  const char* name);

/**
 *  \brief Set the position of a window.
 *  
 *  \param window   The window to reposition.
 *  \param x        The x coordinate of the window, ::SDL_WINDOWPOS_CENTERED, or
                    ::SDL_WINDOWPOS_UNDEFINED.
 *  \param y        The y coordinate of the window, ::SDL_WINDOWPOS_CENTERED, or
                    ::SDL_WINDOWPOS_UNDEFINED.
 *  
 *  \note The window coordinate origin is the upper left of the display.
 *  
 *  \sa SDL_GetWindowPosition()
 */
extern(C) void SDL_SetWindowPosition(SDL_Window* window,
                                     int x,
                                     int y);

/**
 *  \brief Get the position of a window.
 *  
 *  \sa SDL_SetWindowPosition()
 */
extern(C) void SDL_GetWindowPosition(SDL_Window* window,
                                     int* x, 
                                     int* y);

/**
 *  \brief Set the size of a window's client area.
 *  
 *  \note You can't change the size of a fullscreen window, it automatically
 *        matches the size of the display mode.
 *  
 *  \sa SDL_GetWindowSize()
 */
extern(C) void SDL_SetWindowSize(SDL_Window* window,
                                 int w,
                                 int h);

/**
 *  \brief Get the size of a window's client area.
 *  
 *  \sa SDL_SetWindowSize()
 */
extern(C) void SDL_GetWindowSize(SDL_Window* window,
                                int* w,
                                int* h);

/**
 *  \brief Show a window.
 *  
 *  \sa SDL_HideWindow()
 */
extern(C) void SDL_ShowWindow(SDL_Window* window);

/**
 *  \brief Hide a window.
 *  
 *  \sa SDL_ShowWindow()
 */
extern(C) void SDL_HideWindow(SDL_Window* window);

/**
 *  \brief Raise a window above other windows and set the input focus.
 */
extern(C) void SDL_RaiseWindow(SDL_Window* window);

/**
 *  \brief Make a window as large as possible.
 *  
 *  \sa SDL_RestoreWindow()
 */
extern(C) void SDL_MaximizeWindow(SDL_Window* window);

/**
 *  \brief Minimize a window to an iconic representation.
 *  
 *  \sa SDL_RestoreWindow()
 */
extern(C) void SDL_MinimizeWindow(SDL_Window* window);

/**
 *  \brief Restore the size and position of a minimized or maximized window.
 *  
 *  \sa SDL_MaximizeWindow()
 *  \sa SDL_MinimizeWindow()
 */
extern(C) void SDL_RestoreWindow(SDL_Window* window);

/**
 *  \brief Set a window's fullscreen state.
 *  
 *  \return 0 on success, or -1 if setting the display mode failed.
 *  
 *  \sa SDL_SetWindowDisplayMode()
 *  \sa SDL_GetWindowDisplayMode()
 */
extern(C) int SDL_SetWindowFullscreen(SDL_Window* window,
                                      SDL_bool fullscreen);

/**
 *  \brief Get the SDL surface associated with the window.
 *
 *  \return The window's framebuffer surface, or NULL on error. 
 *
 *  A new surface will be created with the optimal format for the window,
 *  if necessary. This surface will be freed when the window is destroyed.
 *
 *  \note You may not combine this with 3D or the rendering API on this window.
 *
 *  \sa SDL_UpdateWindowSurface()
 *  \sa SDL_UpdateWindowSurfaceRects()
 */
extern(C) SDL_Surface* SDL_GetWindowSurface(SDL_Window* window);

/**
 *  \brief Copy the window surface to the screen.
 *
 *  \return 0 on success, or -1 on error.
 *
 *  \sa SDL_GetWindowSurface()
 *  \sa SDL_UpdateWindowSurfaceRects()
 */
extern(C) int SDL_UpdateWindowSurface(SDL_Window* window);

/**
 *  \brief Copy a number of rectangles on the window surface to the screen.
 *
 *  \return 0 on success, or -1 on error.
 *
 *  \sa SDL_GetWindowSurface()
 *  \sa SDL_UpdateWindowSurfaceRect()
 */
extern(C) int SDL_UpdateWindowSurfaceRects(SDL_Window* window,
                                           SDL_Rect* rects,
                                           int numrects);

/**
 *  \brief Set a window's input grab mode.
 *  
 *  \param grabbed This is SDL_TRUE to grab input, and SDL_FALSE to release input.
 *  
 *  \sa SDL_GetWindowGrab()
 */
extern(C) void SDL_SetWindowGrab(SDL_Window* window,
                                 SDL_bool grabbed);

/**
 *  \brief Get a window's input grab mode.
 *  
 *  \return This returns SDL_TRUE if input is grabbed, and SDL_FALSE otherwise.
 *  
 *  \sa SDL_SetWindowGrab()
 */
extern(C) SDL_bool SDL_GetWindowGrab(SDL_Window* window);

/**
 *  \brief Set the brightness (gamma correction) for a window.
 *  
 *  \return 0 on success, or -1 if setting the brightness isn't supported.
 *  
 *  \sa SDL_GetWindowBrightness()
 *  \sa SDL_SetWindowGammaRamp()
 */
extern(C) int SDL_SetWindowBrightness(SDL_Window* window,
                                      float brightness);

/**
 *  \brief Get the brightness (gamma correction) for a window.
 *  
 *  \return The last brightness value passed to SDL_SetWindowBrightness()
 *  
 *  \sa SDL_SetWindowBrightness()
 */
extern(C) float SDL_GetWindowBrightness(SDL_Window* window);

/**
 *  \brief Set the gamma ramp for a window.
 *  
 *  \param red The translation table for the red channel, or NULL.
 *  \param green The translation table for the green channel, or NULL.
 *  \param blue The translation table for the blue channel, or NULL.
 *  
 *  \return 0 on success, or -1 if gamma ramps are unsupported.
 *  
 *  Set the gamma translation table for the red, green, and blue channels
 *  of the video hardware.  Each table is an array of 256 16-bit quantities,
 *  representing a mapping between the input and output for that channel.
 *  The input is the index into the array, and the output is the 16-bit
 *  gamma value at that index, scaled to the output color precision.
 *
 *  \sa SDL_GetWindowGammaRamp()
 */
extern(C) int SDL_SetWindowGammaRamp(SDL_Window* window,
                                     const Uint16* red,
                                     const Uint16* green,
                                     const Uint16* blue);

/**
 *  \brief Get the gamma ramp for a window.
 *  
 *  \param red   A pointer to a 256 element array of 16-bit quantities to hold 
 *               the translation table for the red channel, or NULL.
 *  \param green A pointer to a 256 element array of 16-bit quantities to hold 
 *               the translation table for the green channel, or NULL.
 *  \param blue  A pointer to a 256 element array of 16-bit quantities to hold 
 *               the translation table for the blue channel, or NULL.
 *   
 *  \return 0 on success, or -1 if gamma ramps are unsupported.
 *  
 *  \sa SDL_SetWindowGammaRamp()
 */
extern(C) int SDL_GetWindowGammaRamp(SDL_Window* window,
                                     Uint16* red,
                                     Uint16* green,
                                     Uint16* blue);

/**
 *  \brief Destroy a window.
 */
extern(C) void SDL_DestroyWindow(SDL_Window* window);


/**
 *  \brief Returns whether the screensaver is currently enabled (default on).
 *  
 *  \sa SDL_EnableScreenSaver()
 *  \sa SDL_DisableScreenSaver()
 */
extern(C) SDL_bool SDL_IsScreenSaverEnabled();

/**
 *  \brief Allow the screen to be blanked by a screensaver
 *  
 *  \sa SDL_IsScreenSaverEnabled()
 *  \sa SDL_DisableScreenSaver()
 */
extern(C) void SDL_EnableScreenSaver();

/**
 *  \brief Prevent the screen from being blanked by a screensaver
 *  
 *  \sa SDL_IsScreenSaverEnabled()
 *  \sa SDL_EnableScreenSaver()
 */
extern(C) void SDL_DisableScreenSaver();


/**
 *  \name OpenGL support functions
 */
/*@{*/

/**
 *  \brief Dynamically load an OpenGL library.
 *  
 *  \param path The platform dependent OpenGL library name, or NULL to open the 
 *              default OpenGL library.
 *  
 *  \return 0 on success, or -1 if the library couldn't be loaded.
 *  
 *  This should be done after initializing the video driver, but before
 *  creating any OpenGL windows.  If no OpenGL library is loaded, the default
 *  library will be loaded upon creation of the first OpenGL window.
 *  
 *  \note If you do this, you need to retrieve all of the GL functions used in
 *        your program from the dynamic library using SDL_GL_GetProcAddress().
 *  
 *  \sa SDL_GL_GetProcAddress()
 *  \sa SDL_GL_UnloadLibrary()
 */
extern(C) int SDL_GL_LoadLibrary(const char* path);

/**
 *  \brief Get the address of an OpenGL function.
 */
extern(C) void* SDL_GL_GetProcAddress(const char* proc);

/**
 *  \brief Unload the OpenGL library previously loaded by SDL_GL_LoadLibrary().
 *  
 *  \sa SDL_GL_LoadLibrary()
 */
extern(C) void SDL_GL_UnloadLibrary();

/**
 *  \brief Return true if an OpenGL extension is supported for the current 
 *         context.
 */
extern(C) SDL_bool SDL_GL_ExtensionSupported(const char *extension);

/**
 *  \brief Set an OpenGL window attribute before window creation.
 */
extern(C) int SDL_GL_SetAttribute(SDL_GLattr attr, int value);

/**
 *  \brief Get the actual value for an attribute from the current context.
 */
extern(C) int SDL_GL_GetAttribute(SDL_GLattr attr, int* value);

/**
 *  \brief Create an OpenGL context for use with an OpenGL window, and make it 
 *         current.
 *  
 *  \sa SDL_GL_DeleteContext()
 */
extern(C) SDL_GLContext SDL_GL_CreateContext(SDL_Window* window);

/**
 *  \brief Set up an OpenGL context for rendering into an OpenGL window.
 *  
 *  \note The context must have been created with a compatible window.
 */
extern(C) int SDL_GL_MakeCurrent(SDL_Window* window, SDL_GLContext context);

/**
 *  \brief Set the swap interval for the current OpenGL context.
 *  
 *  \param interval 0 for immediate updates, 1 for updates synchronized with the
 *                  vertical retrace. If the system supports it, you may
 *                  specify -1 to allow late swaps to happen immediately
 *                  instead of waiting for the next retrace.
 *  
 *  \return 0 on success, or -1 if setting the swap interval is not supported.
 *  
 *  \sa SDL_GL_GetSwapInterval()
 */
extern(C) int SDL_GL_SetSwapInterval(int interval);

/**
 *  \brief Get the swap interval for the current OpenGL context.
 *  
 *  \return 0 if there is no vertical retrace synchronization, 1 if the buffer 
 *          swap is synchronized with the vertical retrace, and -1 if late
 *          swaps happen immediately instead of waiting for the next retrace.
 *          If the system can't determine the swap interval, or there isn't a
 *          valid current context, this will return 0 as a safe default.
 *  
 *  \sa SDL_GL_SetSwapInterval()
 */
extern(C) int SDL_GL_GetSwapInterval();

/**
 * \brief Swap the OpenGL buffers for a window, if double-buffering is 
 *        supported.
 */
extern(C) void SDL_GL_SwapWindow(SDL_Window* window);

/**
 *  \brief Delete an OpenGL context.
 *  
 *  \sa SDL_GL_CreateContext()
 */
extern(C) void SDL_GL_DeleteContext(SDL_GLContext context);

/*@}*//*OpenGL support functions*/

/* SDL_video.h */
