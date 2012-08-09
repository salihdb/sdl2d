# sdl2D (D dili ilintisi)

Package sdl provides bindings for the [SDL][] library, version 2.2.0
The project's [source code][] and [documentation][] are released into the
[public domain][].

[SDL]: http://www.libsdl.org/
[source code]:https://github.com/salihdb/sdl2d
[documentation]: http://ddili.org/ders/d.en
[public domain]: https://creativecommons.org/publicdomain/zero/1.0/

# Status
Current status of the [API, sorted by category][]:

    * Basics
      - Init                        : 100% (0/9) Unclassified...
      - Include                     :  50% (8/9) Macros
      - Error                       : 100% (3/9)
      - Timer                       :  99% (9/9) SDL_TimerCallback
      - RWops                       :  50% (2/9)
      - Clipboard                   :      merge
      - Log                         :       skip
      - Assertions                  :   0% (1/9)
      - Version                     :       skip
      - Quit                        :      merge
    * Input Events
      - Events                      :  99% (2/9) SDL_EventFilter
      - Keyboard                    : 100% (5/9)
      - Keycode                     : 100% (6/9)
      - Scancode                    : 100% (8/9)
      - Gesture                     : 100% (1/9)
      - Mouse                       :   0% (7/9)
      - Touch                       : 100% (9/9)
      - Joystick                    :       skip
      - Input                       :      merge
    * Video
      - Video                       :  98% (9/9) Macros
      - Render                      : 100% (6/9)
      - Blit                        :  35% (1/9) Macros
      - Pixels                      :  80% (4/9) Macros
      - Blendmode & Shape           :      merge
      - Rect                        :  98% (5/9) Macros
      - Surface                     : 100% (7/9)
      - OpenGL                      :       skip
      - SWM                         :       skip
    * Audio
      - Audio                       :   0% (
    * Threads
      - Thread                      :       skip
      - Mutex                       :       skip
      - Atomic                      :       skip
    * Shared Object Support
      - Shared Object               :      merge
    * Platform and CPU Information
      - Config                      :   0% (
      - System                      :       merge
      - Platform                    :        skip
      - CPU                         :        skip
      - Endian                      :        skip
    * Power Management
      - Power                       :        skip

    * Total progress                :  50% (80+85+85+0+0)
[API, sorted by category]: http://wiki.libsdl.org/moin.cgi/APIByCategory

Installation and Testing
------------------------

To install all of the relevant libraries, use the following:

    hg clone http://hg.libsdl.org/SDL
    mkdir SDL/build
    cd SDL/build
    ../configure
    sudo make install
    export LD_LIBRARY_PATH=/usr/local/lib
    cd ..
    git clone https://github.com/salihdb/sdl2d
    dmd sdl2d/test sdl2d/events sdl2d/surface -L-lSDL2 -release 
    ./test