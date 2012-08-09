module sdl2d.init;

import sdl2d.stdinc;

/**
 *  \name SDL_INIT_*
 *  
 *  These are the flags which may be passed to SDL_Init().  You should
 *  specify the subsystems which you will be using in your application.
 */
/*@{*/
enum Uint32 SDL_INIT_TIMER         = 0x00000001;
enum Uint32 SDL_INIT_AUDIO         = 0x00000010;
enum Uint32 SDL_INIT_VIDEO         = 0x00000020;
//enum Uint32 SDL_INIT_CDROM       = 0x00000100; /* Unused, scrap, old OEM */
enum Uint32 SDL_INIT_JOYSTICK      = 0x00000200;
enum Uint32 SDL_INIT_HAPTIC        = 0x00001000;
enum Uint32 SDL_INIT_NOPARACHUTE   = 0x00100000; /* Don't catch fatal signals */
//enum Uint32 SDL_INIT_EVENTTHREAD = 0x01000000; /* Not supported on all OS's */
enum Uint32 SDL_INIT_EVERYTHING    = 0x0000FFFF;
/*@}*/

/* -TODO- Merged into by file: SDL_main.h                              -TODO- */
/**
 *  The prototype for the application's main() function
 */
extern(C) int SDL_main(int argc, char *argv[]);

/**
 *  This can be called to set the application class at startup
 */
version (Win32) {
  extern(C) int SDL_RegisterApp(char* name, Uint32 style, void* hInst);
  extern(C) void SDL_UnregisterApp();
}
/* -TODO- Merged into by file: SDL_main.h                             -TODO- */

/**
 *  This function initializes  the subsystems specified by \c flags
 *  Unless the ::SDL_INIT_NOPARACHUTE flag is set, it will install cleanup
 *  signal handlers for some commonly ignored fatal signals (like SIGSEGV).
 */
extern(C) int SDL_Init(Uint32 flags);

/**
 *  This function initializes specific SDL subsystems
 */
extern(C) int SDL_InitSubSystem(Uint32 flags);

/**
 *  This function cleans up specific SDL subsystems
 */
extern(C) void SDL_QuitSubSystem(Uint32 flags);

/**
 *  This function returns a mask of the specified subsystems which have
 *  previously been initialized.
 *  
 *  If \c flags is 0, it returns a mask of all initialized subsystems.
 */
extern(C) Uint32 SDL_WasInit(Uint32 flags);

/**
 *  This function cleans up all initialized subsystems. You should
 *  call it upon all exit conditions.
 */
extern(C) void SDL_Quit();

