import pencere, nesne, olaylar;
import sdl2d.timer; /*               DERLEME PARAMETRELERİ:
dmd oyun pencere nesne olaylar sdl2d/events sdl2d/surface -L-lSDL2 -release   */
int loopCounter, startTick;

int timeLeft(int xTick) {
  int now = SDL_GetTicks();
  if(xTick <= now) return 0;
  else return xTick - now;
}
void main(){
  startTick = SDL_GetTicks();

  scope(failure) {
    printf("-YAZILIM HATALI SONLANDI-\n");
    printf("=========================\n");
    printf("Hata bilgileri:\n");
  }
  scope(success) {
    printf("%d defa döngü döndü\n", loopCounter);
    printf("Hoşça kal\n");
    sdl2d.init.SDL_Quit();
  }
  SDL_Renderer* sahne;

  auto pencere = new Pencere(400, 400, 0);
       pencere.Kur(sahne, "Deneme Oyunu 1.0");

  auto zemin = new Nesne();
       zemin.YükleBMP("duvar.bmp", sahne);

  auto oyuncu = new Nesne();
       oyuncu.YükleBMP("karadelik.bmp", sahne);
       oyuncu.x = (pencere.w - oyuncu.w) / 2;
       oyuncu.y = (pencere.h - oyuncu.h) / 2;

  double HIZLAN   = 0.0123456789;
  double YAVAŞLA  = 0.9987654321;
  double nXkonumu = cast(double)oyuncu.x;
  double nYkonumu = cast(double)oyuncu.y;
  double nXivmesi = 0;
  double nYivmesi = 0;

  enum çerçeveKalınlığı = 10;

  KLAVYE_TUŞLARI tuşları;
  alias tuşları yönTuşu;

  printf("%s başladı...\n", pencere.Başlığı);

  int x, y;
  pencere.Konumlandır(0, 0);/*
  pencere.Konumu(&x, &y);//*/
  printf("Pencere %d/%d konumundaydı ve\n", x, y);

  enum { yapma, yap };
  //pencere.tamEkran(yap);/*
  pencere.Büyüt();//*/

  enum FPS = 120;
  int xTick = SDL_GetTicks();
  do {
    SDL_Delay(timeLeft(xTick));
    xTick += 1000 / FPS;
    loopCounter++;
    int clockFPS = (SDL_GetTicks() - startTick)/loopCounter;
    printf("%d(%.1f FPS)                                \r",
           SDL_GetTicks(), 1000.0 / cast(float)clockFPS);
    //if(xSay == 999) pencere.Küçült();
    if(yönTuşu.sol) nXivmesi -= HIZLAN;
    if(yönTuşu.sağ) nXivmesi += HIZLAN;
        nXivmesi *= YAVAŞLA;
        nXkonumu += nXivmesi;

    if(yönTuşu.üst) nYivmesi -= HIZLAN;
    if(yönTuşu.alt) nYivmesi += HIZLAN;
        nYivmesi *= YAVAŞLA;
        nYkonumu += nYivmesi;

    if(nXkonumu > cast(double)(pencere.w - oyuncu.w - çerçeveKalınlığı) ||
      (nXkonumu < cast(double)çerçeveKalınlığı)) {
      nXkonumu -= nXivmesi;
      nXivmesi = -nXivmesi * YAVAŞLA;
    }
    if(nYkonumu > cast(double)(pencere.h - oyuncu.h - çerçeveKalınlığı) ||
      (nYkonumu < cast(double)çerçeveKalınlığı)) {
      nYkonumu -= nYivmesi;
      nYivmesi = -nYivmesi * YAVAŞLA;
    }
    oyuncu.x = cast(int)nXkonumu;
    oyuncu.y = cast(int)nYkonumu;

    zemin.Yansıt(sahne);
    oyuncu.Yansıt(sahne);

    SDL_RenderPresent(sahne);
  } while(tuşları.Denetle());
  pencere.Son();
}
