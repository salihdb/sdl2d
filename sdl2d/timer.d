module sdl2d.timer;
import sdl2d.stdinc;

/**
 * \brief Get the number of milliseconds since the SDL library initialization.
 *  
 * \note This value wraps if the program runs for more than ~49 days.
 */
extern(C) Uint32 SDL_GetTicks();

/**
 * \brief Get the current value of the high resolution counter
 */
extern(C) Uint64 SDL_GetPerformanceCounter();

/**
 * \brief Get the count per second of the high resolution counter
 */
extern(C) Uint64 SDL_GetPerformanceFrequency();

/**
 * \brief Wait a specified number of milliseconds before returning.
 */
extern(C) void SDL_Delay(Uint32 ms);

/**
 *  Function prototype for the timer callback function.
 *  
 *  The callback function is passed the current timer interval and returns
 *  the next timer interval.  If the returned value is the same as the one
 *  passed in, the periodic alarm continues, otherwise a new alarm is
 *  scheduled.  If the callback returns 0, the periodic alarm is cancelled.
 */
//typedef Uint32 (SDLCALL * ) (Uint32 interval, void *param);
extern(C) Uint32 function(Uint32 interval, void *param)SDL_TimerCallback;
/**
 * Definition of the timer ID type.
 */
alias int SDL_TimerID;

/**
 * \brief Add a new timer to the pool of timers already running.
 *
 * \return A timer ID, or NULL when an error occurs.
 */
//extern(C) SDL_TimerID SDL_AddTimer(Uint32 interval,
//                                   SDL_TimerCallback callback,
//                                   void *param);

/**
 * \brief Remove a timer knowing its ID.
 *
 * \return A boolean value indicating success or failure.
 *
 * \warning It is not safe to remove a timer multiple times.
 */
extern(C) SDL_bool SDL_RemoveTimer(SDL_TimerID id);

/* SDL_timer.h */
