module sdl2d.surface;

import sdl2d.stdinc;
import sdl2d.events;
import sdl2d.pixels;
import sdl2d.rect;
import sdl2d.blit;
import sdl2d.rwops;

/**
 *  \name Surface flags
 *  
 *  These are the currently supported flags for the ::SDL_surface.
 *  
 *  \internal
 *  Used internally (read-only).
 */
/*@{*/
enum Uint32 SDL_SWSURFACE = 0;          /**< Just here for compatibility */
enum Uint32 SDL_PREALLOC  = 0x00000001; /**< Surface uses preallocated memory */
enum Uint32 SDL_RLEACCEL  = 0x00000002; /**< Surface is RLE encoded */
enum Uint32 SDL_DONTFREE  = 0x00000004; /**< Surface is referenced internally */
/*@}*//*Surface flags*/

/**
 *  Evaluates to true if the surface needs to be locked before access.
 */
//alias SDL_MUSTLOCK(S)	(((S)->flags & SDL_RLEACCEL) != 0)

/**
 * \brief A collection of pixels used in software blitting.
 *
 * \note  This structure should be treated as read-only, except for \c pixels,
 *        which, if not NULL, contains the raw pixel data for the surface.
 */
extern(C) struct SDL_Surface {
    Uint32 flags;               /**< Read-only */
    SDL_PixelFormat* format;    /**< Read-only */
    int w, h;                   /**< Read-only */
    int pitch;                  /**< Read-only */
    void* pixels;               /**< Read-write */

    /** Application data associated with the surface */
    void* userdata;             /**< Read-write */

    /** information needed for surfaces requiring locks */
    int locked;                 /**< Read-only */
    void* lock_data;            /**< Read-only */

    /** clipping information */
    SDL_Rect clip_rect;         /**< Read-only */

    /** info for fast blit mapping to other surfaces */
    SDL_BlitMap* map;           /**< Private */

    /** Reference count -- used when freeing surface */
    int refcount;               /**< Read-mostly */
}
/**
 * \brief The type of function used for surface blitting functions.
 */
//typedef int (*SDL_blit) (struct SDL_Surface * src, SDL_Rect * srcrect, struct SDL_Surface * dst, SDL_Rect * dstrect);

/**
 *  Allocate and free an RGB surface.
 *  
 *  If the depth is 4 or 8 bits, an empty palette is allocated for the surface.
 *  If the depth is greater than 8 bits, the pixel format is set using the
 *  flags '[RGB]mask'.
 *  
 *  If the function runs out of memory, it will return NULL.
 *  
 *  \param flags The \c flags are obsolete and should be set to 0.
 */
extern(C) SDL_Surface* SDL_CreateRGBSurface(Uint32 flags,
                                            int width,
                                            int height,
                                            int depth,
                                            Uint32 Rmask,
                                            Uint32 Gmask,
                                            Uint32 Bmask,
                                            Uint32 Amask);
                                            
extern(C) SDL_Surface*bSDL_CreateRGBSurfaceFrom(void* pixels,
                                                int width,
                                                int height,
                                                int depth,
                                                int pitch,
                                                Uint32 Rmask,
                                                Uint32 Gmask,
                                                Uint32 Bmask,
                                                Uint32 Amask);
                                                
extern(C) void SDL_FreeSurface(SDL_Surface* surface);

/**
 *  \brief Set the palette used by a surface.
 *  
 *  \return 0, or -1 if the surface format doesn't use a palette.
 *  
 *  \note A single palette can be shared with many surfaces.
 */
extern(C) int SDL_SetSurfacePalette(SDL_Surface* surface, SDL_Palette* palette);

/**
 *  \brief Sets up a surface for directly accessing the pixels.
 *  
 *  Between calls to SDL_LockSurface() / SDL_UnlockSurface(), you can write
 *  to and read from \c surface->pixels, using the pixel format stored in 
 *  \c surface->format.  Once you are done accessing the surface, you should 
 *  use SDL_UnlockSurface() to release it.
 *  
 *  Not all surfaces require locking.  If SDL_MUSTLOCK(surface) evaluates
 *  to 0, then you can read and write to the surface at any time, and the
 *  pixel format of the surface will not change.
 *  
 *  No operating system or library calls should be made between lock/unlock
 *  pairs, as critical system locks may be held during this time.
 *  
 *  SDL_LockSurface() returns 0, or -1 if the surface couldn't be locked.
 *  
 *  \sa SDL_UnlockSurface()
 */
extern(C) int SDL_LockSurface(SDL_Surface* surface);
/** \sa SDL_LockSurface() */
extern(C) void SDL_UnlockSurface(SDL_Surface* surface);

/**
 *  Load a surface from a seekable SDL data stream (memory or file).
 *  
 *  If \c freesrc is non-zero, the stream will be closed after being read.
 *  
 *  The new surface should be freed with SDL_FreeSurface().
 *  
 *  \return the new surface, or NULL if there was an error.
 */
extern(C) SDL_Surface* SDL_LoadBMP_RW(SDL_RWops* src, int freesrc);

//#define SDL_LoadBMP(file)	SDL_LoadBMP_RW(SDL_RWFromFile(file, "rb"), 1)
SDL_Surface* SDL_LoadBMP(const char* file) {
  return SDL_LoadBMP_RW(SDL_RWFromFile(file, "rb"), 1);
}

extern(C) int SDL_SetSurfaceRLE(SDL_Surface* surface,
                                int flag);

/**
 *  \brief Sets the color key (transparent pixel) in a blittable surface.
 *  
 *  \param surface The surface to update
 *  \param flag Non-zero to enable colorkey and 0 to disable colorkey
 *  \param key The transparent pixel in the native surface format
 *  
 *  \return 0 on success, or -1 if the surface is not valid
 *
 *  You can pass SDL_RLEACCEL to enable RLE accelerated blits.
 */
extern(C) int SDL_SetColorKey(SDL_Surface* surface,
                              int flag,
                              Uint32 key);

/**
 *  \brief Gets the color key (transparent pixel) in a blittable surface.
 *  
 *  \param surface The surface to update
 *  \param key A pointer filled in with the transparent pixel in the native 
 *             surface format
 *  
 *  \return 0 on success, or -1 if the surface is not valid or colorkey is not 
 *          enabled.
 */
extern(C) int SDL_GetColorKey(SDL_Surface* surface,
                              Uint32* key);

/**
 *  \brief Set an additional color value used in blit operations.
 *  
 *  \param surface The surface to update.
 *  \param r The red color value multiplied into blit operations.
 *  \param g The green color value multiplied into blit operations.
 *  \param b The blue color value multiplied into blit operations.
 *  
 *  \return 0 on success, or -1 if the surface is not valid.
 *  
 *  \sa SDL_GetSurfaceColorMod()
 */
extern(C) int SDL_SetSurfaceColorMod(SDL_Surface* surface,
                                     Uint8 r,
                                     Uint8 g,
                                     Uint8 b);


/**
 *  \brief Get the additional color value used in blit operations.
 *  
 *  \param surface The surface to query.
 *  \param r A pointer filled in with the current red color value.
 *  \param g A pointer filled in with the current green color value.
 *  \param b A pointer filled in with the current blue color value.
 *  
 *  \return 0 on success, or -1 if the surface is not valid.
 *  
 *  \sa SDL_SetSurfaceColorMod()
 */
extern(C) int SDL_GetSurfaceColorMod(SDL_Surface* surface,
                                     Uint8* r,
                                     Uint8* g,
                                     Uint8* b);

/**
 *  \brief Set an additional alpha value used in blit operations.
 *  
 *  \param surface The surface to update.
 *  \param alpha The alpha value multiplied into blit operations.
 *  
 *  \return 0 on success, or -1 if the surface is not valid.
 *  
 *  \sa SDL_GetSurfaceAlphaMod()
 */
extern(C) int SDL_SetSurfaceAlphaMod(SDL_Surface* surface,
                                     Uint8 alpha);

/**
 *  \brief Get the additional alpha value used in blit operations.
 *  
 *  \param surface The surface to query.
 *  \param alpha A pointer filled in with the current alpha value.
 *  
 *  \return 0 on success, or -1 if the surface is not valid.
 *  
 *  \sa SDL_SetSurfaceAlphaMod()
 */
extern(C) int SDL_GetSurfaceAlphaMod(SDL_Surface* surface,
                                     Uint8 * alpha);

/**
 *  \brief Set the blend mode used for blit operations.
 *  
 *  \param surface The surface to update.
 *  \param blendMode ::SDL_BlendMode to use for blit blending.
 *  
 *  \return 0 on success, or -1 if the parameters are not valid.
 *  
 *  \sa SDL_GetSurfaceBlendMode()
 */
extern(C) int SDL_SetSurfaceBlendMode(SDL_Surface* surface,
                                      SDL_BlendMode blendMode);

/**
 *  \brief Get the blend mode used for blit operations.
 *  
 *  \param surface   The surface to query.
 *  \param blendMode A pointer filled in with the current blend mode.
 *  
 *  \return 0 on success, or -1 if the surface is not valid.
 *  
 *  \sa SDL_SetSurfaceBlendMode()
 */
extern(C) int SDL_GetSurfaceBlendMode(SDL_Surface* surface,
                                      SDL_BlendMode* blendMode);

/**
 *  Sets the clipping rectangle for the destination surface in a blit.
 *  
 *  If the clip rectangle is NULL, clipping will be disabled.
 *  
 *  If the clip rectangle doesn't intersect the surface, the function will
 *  return SDL_FALSE and blits will be completely clipped.  Otherwise the
 *  function returns SDL_TRUE and blits to the surface will be clipped to
 *  the intersection of the surface area and the clipping rectangle.
 *  
 *  Note that blits are automatically clipped to the edges of the source
 *  and destination surfaces.
 */
extern(C) SDL_bool SDL_SetClipRect(SDL_Surface* surface,
                                   const SDL_Rect * rect);

/**
 *  Gets the clipping rectangle for the destination surface in a blit.
 *  
 *  \c rect must be a pointer to a valid rectangle which will be filled
 *  with the correct values.
 */
extern(C) void SDL_GetClipRect(SDL_Surface* surface,
                               SDL_Rect* rect);

/**
 *  Creates a new surface of the specified format, and then copies and maps 
 *  the given surface to it so the blit of the converted surface will be as 
 *  fast as possible.  If this function fails, it returns NULL.
 *  
 *  The \c flags parameter is passed to SDL_CreateRGBSurface() and has those 
 *  semantics.  You can also pass ::SDL_RLEACCEL in the flags parameter and
 *  SDL will try to RLE accelerate colorkey and alpha blits in the resulting
 *  surface.
 */
extern(C) SDL_Surface* SDL_ConvertSurface(SDL_Surface* src,
                                          SDL_PixelFormat* fmt,
                                          Uint32 flags);
                                          
extern(C) SDL_Surface* SDL_ConvertSurfaceFormat(SDL_Surface* src,
                                                Uint32 pixel_format,
                                                Uint32 flags);

/**
 * \brief Copy a block of pixels of one format to another format
 *  
 *  \return 0 on success, or -1 if there was an error
 */
extern(C) int SDL_ConvertPixels(int width,
                                int height,
                                Uint32 src_format,
                                const void* src,
                                int src_pitch,
                                Uint32 dst_format,
                                void* dst,
                                int dst_pitch);

/**
 *  Performs a fast fill of the given rectangle with \c color.
 *  
 *  If \c rect is NULL, the whole surface will be filled with \c color.
 *  
 *  The color should be a pixel of the format used by the surface, and 
 *  can be generated by the SDL_MapRGB() function.
 *  
 *  \return 0 on success, or -1 on error.
 */
extern(C) int SDL_FillRect(SDL_Surface* dst,
                           const SDL_Rect* rect,
                           Uint32 color);
                           
extern(C) int SDL_FillRects(SDL_Surface* dst,
                            const SDL_Rect* rects,
                            int count, Uint32 color);

/**
 *  Performs a fast blit from the source surface to the destination surface.
 *  
 *  This assumes that the source and destination rectangles are
 *  the same size.  If either \c srcrect or \c dstrect are NULL, the entire
 *  surface (\c src or \c dst) is copied.  The final blit rectangles are saved
 *  in \c srcrect and \c dstrect after all clipping is performed.
 *  
 *  \return If the blit is successful, it returns 0, otherwise it returns -1.
 *
 *  The blit function should not be called on a locked surface.
 *
 *  The blit semantics for surfaces with and without alpha and colorkey
 *  are defined as follows:
 *  \verbatim
    RGBA->RGB:
      SDL_SRCALPHA set:
        alpha-blend (using alpha-channel).
        SDL_SRCCOLORKEY ignored.
      SDL_SRCALPHA not set:
        copy RGB.
        if SDL_SRCCOLORKEY set, only copy the pixels matching the
        RGB values of the source colour key, ignoring alpha in the
        comparison.
   
    RGB->RGBA:
      SDL_SRCALPHA set:
        alpha-blend (using the source per-surface alpha value);
        set destination alpha to opaque.
      SDL_SRCALPHA not set:
        copy RGB, set destination alpha to source per-surface alpha value.
      both:
        if SDL_SRCCOLORKEY set, only copy the pixels matching the
        source colour key.
   
    RGBA->RGBA:
      SDL_SRCALPHA set:
        alpha-blend (using the source alpha channel) the RGB values;
        leave destination alpha untouched. [Note: is this correct?]
        SDL_SRCCOLORKEY ignored.
      SDL_SRCALPHA not set:
        copy all of RGBA to the destination.
        if SDL_SRCCOLORKEY set, only copy the pixels matching the
        RGB values of the source colour key, ignoring alpha in the
       comparison.
   
    RGB->RGB: 
      SDL_SRCALPHA set:
        alpha-blend (using the source per-surface alpha value).
      SDL_SRCALPHA not set:
        copy RGB.
      both:
        if SDL_SRCCOLORKEY set, only copy the pixels matching the
        source colour key.
    \endverbatim
 *  
 *  You should call SDL_BlitSurface() unless you know exactly how SDL
 *  blitting works internally and how to use the other blit functions.
 */
alias SDL_UpperBlit SDL_BlitSurface;

/**
 *  This is the public blit function, SDL_BlitSurface(), and it performs
 *  rectangle validation and clipping before passing it to SDL_LowerBlit()
 */
extern(C) int SDL_UpperBlit(SDL_Surface* src,
                            const SDL_Rect* srcrect,
                            SDL_Surface* dst,
                            SDL_Rect* dstrect);

/**
 *  This is a semi-private blit function and it performs low-level surface
 *  blitting only.
 */
extern(C) int SDL_LowerBlit(SDL_Surface* src,
                            SDL_Rect* srcrect,
                            SDL_Surface* dst,
                            SDL_Rect * dstrect);

/**
 *  \brief Perform a fast, low quality, stretch blit between two surfaces of the
 *         same pixel format.
 *  
 *  \note This function uses a static buffer, and is not thread-safe.
 */
extern(C) int SDL_SoftStretch(SDL_Surface* src,
                              const SDL_Rect* srcrect,
                              SDL_Surface* dst,
                              const SDL_Rect* dstrect);

alias SDL_UpperBlitScaled SDL_BlitScaled;

/**
 *  This is the public scaled blit function, SDL_BlitScaled(), and it performs
 *  rectangle validation and clipping before passing it to SDL_LowerBlitScaled()
 */
extern(C) int SDL_UpperBlitScaled(SDL_Surface* src,
                                  const SDL_Rect* srcrect,
                                  SDL_Surface* dst,
                                  SDL_Rect * dstrect);

/**
 *  This is a semi-private blit function and it performs low-level surface
 *  scaled blitting only.
 */
extern(C) int SDL_LowerBlitScaled(SDL_Surface* src,
                                  SDL_Rect* srcrect,
                                  SDL_Surface* dst,
                                  SDL_Rect * dstrect);

/* SDL_surface.h */
