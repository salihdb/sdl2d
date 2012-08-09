module sdl2d.touch;
import sdl2d.stdinc;
//#include "SDL_error.h"
import sdl2d.video;

alias Sint64 SDL_TouchID;
alias Sint64 SDL_FingerID;

extern(C) struct SDL_Finger {
  SDL_FingerID id;
  Uint16 x;
  Uint16 y;
  Uint16 pressure;
  Uint16 xdelta;
  Uint16 ydelta;
  Uint16 last_x, last_y,last_pressure;  /* the last reported coordinates */
  SDL_bool down;
}

//extern(C) struct SDL_Touch;
//extern(C) struct SDL_Finger;

extern(C) struct SDL_Touch {
  
  /* Free the touch when it's time */
  void function(SDL_Touch* touch) FreeTouch;
  
  /* data common for tablets */
  float pressure_max, pressure_min;
  float x_max, x_min;
  float y_max, y_min;
  Uint16 xres, yres, pressureres;
  float native_xres, native_yres, native_pressureres;
  float tilt_x;                 /* for future use */
  float tilt_y;                 /* for future use */
  float rotation;               /* for future use */
  
  /* Data common to all touch */
  SDL_TouchID id;
  SDL_Window* focus;
  
  char *name;
  Uint8 buttonstate;
  SDL_bool relative_mode;
  SDL_bool flush_motion;

  int num_fingers;
  int max_fingers;
  SDL_Finger** fingers;
    
  void* driverdata;
}

/* Function prototypes */

/**
 *  \brief Get the touch object at the given id.
 *
 *
 */
  extern(C) SDL_Touch* SDL_GetTouch(SDL_TouchID id);

/**
 *  \brief Get the finger object of the given touch, at the given id.
 *
 *
 */
  extern(C) SDL_Finger* SDL_GetFinger(SDL_Touch *touch, SDL_FingerID id);
  
