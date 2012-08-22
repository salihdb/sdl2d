module nesne;

import pencere, sdl2d.rect, sdl2d.surface;

class Nesne {
  SDL_Texture* kaplama;
  SDL_Rect konum;
  alias konum this;
  
  int Yansıt(SDL_Renderer* renderer) {
    SDL_RenderCopy(renderer, kaplama, null, &konum);
    return 0;
  }
  
  void YükleBMP(const char* file, SDL_Renderer* renderer) @property {
    SDL_Surface* temp = SDL_LoadBMP(file);
    scope(exit) SDL_FreeSurface(temp);
    
    if(temp == null) {
      printf("SDL Error: %s\n", SDL_GetError());
      throw new Exception("HATA: DOSYA BULUNAMADI");
    }

    this.w = temp.w;
    this.h = temp.h;

    kaplama = SDL_CreateTextureFromSurface(renderer, temp);
    if(!kaplama) {
      printf("SDL Error: %s\n", SDL_GetError());
      throw new Exception("HATA: KAPLAMA OLUŞTURULAMADI");
    }
  }
}
