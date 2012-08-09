module sdl2d.rect;

import sdl2d.stdinc;
/**
 *  \brief  The structure that defines a point
 *
 *  \sa SDL_EnclosePoints
 */
extern(C) struct SDL_Point {
    int x, y;
}

/**
 *  \brief A rectangle, with the origin at the upper left.
 *  
 *  \sa SDL_RectEmpty
 *  \sa SDL_RectEquals
 *  \sa SDL_HasIntersection
 *  \sa SDL_IntersectRect
 *  \sa SDL_UnionRect
 *  \sa SDL_EnclosePoints
 */
extern(C) struct SDL_Rect {
    int x, y;
    int w, h;
}

/*TODO********************************************************************TODO*/
/*TODO******************************* DEVAM EDECEK ***********************TODO*/
/*TODO********************************************************************TODO*/

/**
 *  \brief Determine whether two rectangles intersect.
 *  
 *  \return SDL_TRUE if there is an intersection, SDL_FALSE otherwise.
 */
extern(C) SDL_bool SDL_HasIntersection(const SDL_Rect* A,
                                       const SDL_Rect* B);

/**
 *  \brief Calculate the intersection of two rectangles.
 *  
 *  \return SDL_TRUE if there is an intersection, SDL_FALSE otherwise.
 */
extern(C) SDL_bool SDL_IntersectRect(const SDL_Rect* A,
                                     const SDL_Rect* B,
                                     SDL_Rect* result);

/**
 *  \brief Calculate the union of two rectangles.
 */
extern(C) void SDL_UnionRect(const SDL_Rect* A,
                             const SDL_Rect* B,
                             SDL_Rect* result);

/**
 *  \brief Calculate a minimal rectangle enclosing a set of points
 *
 *  \return SDL_TRUE if any points were within the clipping rect
 */
extern(C) SDL_bool SDL_EnclosePoints(const SDL_Point* points,
                                     int count,
                                     const SDL_Rect* clip,
                                     SDL_Rect* result);

/**
 *  \brief Calculate the intersection of a rectangle and line segment.
 *  
 *  \return SDL_TRUE if there is an intersection, SDL_FALSE otherwise.
 */
extern(C) SDL_bool SDL_IntersectRectAndLine(const SDL_Rect* rect,
                                            int* X1,
                                            int* Y1,
                                            int* X2,
                                            int* Y2);

/* SDL_rect.h */
