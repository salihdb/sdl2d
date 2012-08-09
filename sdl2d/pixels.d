module sdl2d.pixels;

import sdl2d.stdinc;
import sdl2d.rect;

/**
 *  \name Transparency definitions
 *  
 *  These define alpha as the opacity of a surface.
 */
/*@{*/
enum int SDL_ALPHA_OPAQUE      = 255;
enum int SDL_ALPHA_TRANSPARENT = 0;
/*@}*/

/** Pixel type. */
extern(C) {
  enum {
    SDL_PIXELTYPE_UNKNOWN,
    SDL_PIXELTYPE_INDEX1,
    SDL_PIXELTYPE_INDEX4,
    SDL_PIXELTYPE_INDEX8,
    SDL_PIXELTYPE_PACKED8,
    SDL_PIXELTYPE_PACKED16,
    SDL_PIXELTYPE_PACKED32,
    SDL_PIXELTYPE_ARRAYU8,
    SDL_PIXELTYPE_ARRAYU16,
    SDL_PIXELTYPE_ARRAYU32,
    SDL_PIXELTYPE_ARRAYF16,
    SDL_PIXELTYPE_ARRAYF32
  }
}

/** Bitmap pixel order, high bit -> low bit. */
extern(C) {
  enum {
    SDL_BITMAPORDER_NONE,
    SDL_BITMAPORDER_4321,
    SDL_BITMAPORDER_1234
  }
}

/** Packed component order, high bit -> low bit. */
extern(C) {
  enum {
    SDL_PACKEDORDER_NONE,
    SDL_PACKEDORDER_XRGB,
    SDL_PACKEDORDER_RGBX,
    SDL_PACKEDORDER_ARGB,
    SDL_PACKEDORDER_RGBA,
    SDL_PACKEDORDER_XBGR,
    SDL_PACKEDORDER_BGRX,
    SDL_PACKEDORDER_ABGR,
    SDL_PACKEDORDER_BGRA
  }
}

/** Array component order, low byte -> high byte. */
extern(C) {
  enum {
    SDL_ARRAYORDER_NONE,
    SDL_ARRAYORDER_RGB,
    SDL_ARRAYORDER_RGBA,
    SDL_ARRAYORDER_ARGB,
    SDL_ARRAYORDER_BGR,
    SDL_ARRAYORDER_BGRA,
    SDL_ARRAYORDER_ABGR
  }
}

/** Packed component layout. */
extern(C) {
  enum {
    SDL_PACKEDLAYOUT_NONE,
    SDL_PACKEDLAYOUT_332,
    SDL_PACKEDLAYOUT_4444,
    SDL_PACKEDLAYOUT_1555,
    SDL_PACKEDLAYOUT_5551,
    SDL_PACKEDLAYOUT_565,
    SDL_PACKEDLAYOUT_8888,
    SDL_PACKEDLAYOUT_2101010,
    SDL_PACKEDLAYOUT_1010102
  }
}

/*TODO********************************************************************TODO*/
/*TODO******************************* DEVAM EDECEK ***********************TODO*/
/*TODO********************************************************************TODO*/

extern(C) struct SDL_Color {
    Uint8 r;
    Uint8 g;
    Uint8 b;
    Uint8 unused;
}

alias SDL_Color SDL_Colour;

extern(C) struct SDL_Palette {
    int ncolors;
    SDL_Color* colors;
    Uint32 versions; // keyword çakışması version olacaktı!
    int refcount;
}

/**
 *  \note Everything in the pixel format structure is read-only.
 */
extern(C) struct SDL_PixelFormat {
    Uint32 format;
    SDL_Palette* palette;
    Uint8 BitsPerPixel;
    Uint8 BytesPerPixel;
    Uint8 padding[2];
    Uint32 Rmask;
    Uint32 Gmask;
    Uint32 Bmask;
    Uint32 Amask;
    Uint8 Rloss;
    Uint8 Gloss;
    Uint8 Bloss;
    Uint8 Aloss;
    Uint8 Rshift;
    Uint8 Gshift;
    Uint8 Bshift;
    Uint8 Ashift;
    int refcount;
    SDL_PixelFormat* next;
};
/**
 * \brief Get the human readable name of a pixel format
 */
extern(C) char* SDL_GetPixelFormatName(Uint32 format);
// aslında const char* idi...

/**
 *  \brief Convert one of the enumerated pixel formats to a bpp and RGBA masks.
 *  
 *  \return SDL_TRUE, or SDL_FALSE if the conversion wasn't possible.
 *  
 *  \sa SDL_MasksToPixelFormatEnum()
 */
extern(C) SDL_bool SDL_PixelFormatEnumToMasks(Uint32 format,
                                              int* bpp,
                                              Uint32* Rmask,
                                              Uint32* Gmask,
                                              Uint32* Bmask,
                                              Uint32* Amask);

/**
 *  \brief Convert a bpp and RGBA masks to an enumerated pixel format.
 *  
 *  \return The pixel format, or ::SDL_PIXELFORMAT_UNKNOWN if the conversion 
 *          wasn't possible.
 *  
 *  \sa SDL_PixelFormatEnumToMasks()
 */
extern(C) Uint32 SDL_MasksToPixelFormatEnum(int bpp,
                                            Uint32 Rmask,
                                            Uint32 Gmask,
                                            Uint32 Bmask,
                                            Uint32 Amask);

/**
 *  \brief Create an SDL_PixelFormat structure from a pixel format enum.
 */
extern(C) SDL_PixelFormat* SDL_AllocFormat(Uint32 pixel_format);

/**
 *  \brief Free an SDL_PixelFormat structure.
 */
extern(C) void SDL_FreeFormat(SDL_PixelFormat* format);

/**
 *  \brief Create a palette structure with the specified number of color 
 *         entries.
 *  
 *  \return A new palette, or NULL if there wasn't enough memory.
 *  
 *  \note The palette entries are initialized to white.
 *  
 *  \sa SDL_FreePalette()
 */
extern(C) SDL_Palette* SDL_AllocPalette(int ncolors);

/**
 *  \brief Set the palette for a pixel format structure.
 */
extern(C) int SDL_SetPixelFormatPalette(SDL_PixelFormat* format,
                                        SDL_Palette* palette);

/**
 *  \brief Set a range of colors in a palette.
 *  
 *  \param palette    The palette to modify.
 *  \param colors     An array of colors to copy into the palette.
 *  \param firstcolor The index of the first palette entry to modify.
 *  \param ncolors    The number of entries to modify.
 *  
 *  \return 0 on success, or -1 if not all of the colors could be set.
 */
extern(C) int SDL_SetPaletteColors(SDL_Palette* palette,
                                   const SDL_Color * colors,
                                   int firstcolor,
                                   int ncolors);

/**
 *  \brief Free a palette created with SDL_AllocPalette().
 *  
 *  \sa SDL_AllocPalette()
 */
extern(C) void SDL_FreePalette(SDL_Palette* palette);

/**
 *  \brief Maps an RGB triple to an opaque pixel value for a given pixel format.
 *  
 *  \sa SDL_MapRGBA
 */
extern(C) Uint32 SDL_MapRGB(const SDL_PixelFormat* format,
                            Uint8 r,
                            Uint8 g,
                            Uint8 b);

/**
 *  \brief Maps an RGBA quadruple to a pixel value for a given pixel format.
 *  
 *  \sa SDL_MapRGB
 */
extern(C) Uint32 SDL_MapRGBA(const SDL_PixelFormat * format,
                             Uint8 r,
                             Uint8 g,
                             Uint8 b,
                             Uint8 a);

/**
 *  \brief Get the RGB components from a pixel of the specified format.
 *  
 *  \sa SDL_GetRGBA
 */
extern(C) void SDL_GetRGB(Uint32 pixel,
                          const SDL_PixelFormat* format,
                          Uint8 * r,
                          Uint8 * g,
                          Uint8 * b);

/**
 *  \brief Get the RGBA components from a pixel of the specified format.
 *  
 *  \sa SDL_GetRGB
 */
extern(C) void SDL_GetRGBA(Uint32 pixel,
                           const SDL_PixelFormat * format,
                           Uint8 * r,
                           Uint8 * g,
                           Uint8 * b,
                           Uint8 * a);

/**
 *  \brief Calculate a 256 entry gamma ramp for a gamma value.
 */
extern(C) void SDL_CalculateGammaRamp(float gamma, Uint16* ramp);

/* SDL_pixels.h */
