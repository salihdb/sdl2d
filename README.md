# sdl2D (D dili ilintisi)

Package sdl provides bindings for the [SDL][] library, version 2.2.0
The project's [source code][] and [documentation][] are released into the
[public domain][].

[SDL]: http://www.libsdl.org/
[source code]:https://github.com/salihdb/sdl2d
[documentation]: http://ddili.org/ders/d.en
[public domain]: https://creativecommons.org/publicdomain/zero/1.0/

## Status
Current status of the [API, sorted by category][]:

    * Basics
      - Init                        : 100% (
      - Include                     : 100% (
      - Error                       :  33% (
      - Timer                       : 100% (
      - RWops                       : 100% (
      - Clipboard                   :       merge
      - Log                         :        skip
      - Assertions                  :   0% (
      - Version                     :        skip
      - Quit                        :       merge
    * Input Events
      - Events                      : 100% (
      - Keyboard                    : 100% (
      - Keycode                     : 100% (
      - Scancode                    : 100% (
      - Gesture                     : 100% (
      - Mouse                       :   0% (
      - Touch                       : 100% (
      - Joystick                    :        skip
      - Input                       :       merge
    * Video
      - Video                       :  91% (
      - Render                      : 100% (
      - Blit                        : 100% (
      - Pixels                      : 100% (
      - Blendmode                   :       merge
      - Rect                        :  80% (
      - Surface                     :  23% (
      - OpenGL                      :        skip
      - SWM                         :        skip
    * Audio
      - Audio                       :   0% (
    * Threads
      - Thread                      :        skip
      - Mutex                       :        skip
      - Atomic                      :        skip
    * Shared Object Support
      - Shared Object               :       merge
    * Platform and CPU Information
      - Config                      :   0% (
      - System                      :       merge
      - Platform                    :        skip
      - CPU                         :        skip
      - Endian                      :        skip
    * Power Management
      - Power                       :        skip

    * Total progress                :  63% (
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