module sdl2d.error;

import sdl2d.stdinc;

/* Public functions */
extern(C) void SDL_SetError(const char *fmt, ...);
extern(C) char* SDL_GetError();
// aslında const char* idi...

extern(C) void SDL_ClearError();

/**
 *  \name Internal error functions
 *  
 *  \internal 
 *  Private error reporting function - used internally.
 */
/*@{*/

void SDL_OutOfMemory() {
    SDL_Error(SDL_errorcode.SDL_ENOMEM);
}

void SDL_Unsupported() {
    SDL_Error(SDL_errorcode.SDL_UNSUPPORTED);
}

extern(C) enum SDL_errorcode {
    SDL_ENOMEM,
    SDL_EFREAD,
    SDL_EFWRITE,
    SDL_EFSEEK,
    SDL_UNSUPPORTED,
    SDL_LASTERROR
}

extern(C) void SDL_Error(SDL_errorcode code);

/* SDL_error.h */
