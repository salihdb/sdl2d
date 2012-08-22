module olaylar;

import sdl2d.events, sdl2d.keycode;

public struct KLAVYE_TUŞLARI {
	bool sol, sağ, üst, alt;  
  SDL_Event event;
  SDL_EventType type;

	bool Denetle() @property {
	  while(SDL_PollEvent(&event)) {
      if(event.type == type.SDL_KEYDOWN) {
        switch(event.key.keysym.sym) {
          case SDLK_LEFT   : sol = true; break;
          case SDLK_RIGHT  : sağ = true; break;
          case SDLK_UP     : üst = true; break;
          case SDLK_DOWN   : alt = true; break;
          default          : break;
        }
      } else if(event.type == type.SDL_KEYUP) {                    
        switch(event.key.keysym.sym) {
          case SDLK_ESCAPE : return false; // çıkış
          case SDLK_LEFT   : sol = false; break;
          case SDLK_RIGHT  : sağ = false; break;
          case SDLK_UP     : üst = false; break;
          case SDLK_DOWN   : alt = false; break;
          default          : break;
        }
      } else if(event.type == type.SDL_QUIT) {
        return false; // çıkış
      }
    }
    return true;
  }
}
