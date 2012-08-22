module pencere;

public import sdl2d.render, sdl2d.error, core.stdc.stdio: printf;
import sdl2d.stdinc, sdl2d.surface, sdl2d.video;

class Pencere {
  SDL_Window* window;
  int w, h, r;
  alias SDL_bool.SDL_TRUE SDL_TRUE;


  this (int w, int h, int r) {
    this.w = w;
    this.h = h;
    this.r = r;
  }
  
  void Kur(ref SDL_Renderer* Sahne, string Başlık) @property {
    SDL_CreateWindowAndRenderer(w, h, r, window, Sahne);
    if(window== null) {
        printf("SDL Error: %s\n", SDL_GetError());
        throw new Exception("HATA: PENCERE OLUŞTURULAMADI");
    }
    başlığıDeğiştir(Başlık);/*
    SDL_SetWindowTitle(window, cast(const char*)Başlık);//*/
  }
  
  void Sil (SDL_Window* pencere) {
    SDL_DestroyWindow(pencere);
  }
  
  void Simgesi (SDL_Surface * icon, Uint8 * mask) {
    //SDL_WM_SetIcon(icon, mask); /* FIXME */
  }
  
  SDL_Surface* yüzeyDöndür (SDL_Window* pencere) {
    return SDL_GetWindowSurface(pencere);
  }
  
  void tamEkran(int yap) {
    SDL_bool b;   // Sanki TRUE! \\
    //if(yap) /* TODO YAPILACAK TODO */
    SDL_SetWindowFullscreen(window, b	);
  }
  
  char* Başlığı () @property {
    return SDL_GetWindowTitle(window);
  }
  
  void başlığıDeğiştir(string Başlık) {
    SDL_SetWindowTitle(window, cast(const char*)Başlık);
  }
  
  void Gizle () @property {
    SDL_HideWindow(window);
  }
  
  void Göster () @property {
    SDL_ShowWindow(window);
  }
  
  void öneGetir () @property {
    SDL_RaiseWindow(window);
  }
  
  void Büyüt () @property {
    SDL_MaximizeWindow(window);
  }
  
  void Küçült () @property {
    SDL_MinimizeWindow(window);
  }
  // ??? SDL_RestoreWindow(window); ???
  void Konumu (int *x, int *y) {
    SDL_GetWindowPosition (window, x, y);
  }
  void Konumlandır (int x, int y) @property {
    SDL_SetWindowPosition(window, x, y);
  }
  
  void Son() {
    SDL_VideoQuit();
  }
  
  ~this() {
    Sil(this.window);
  }
}

