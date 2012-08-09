module sdl2d.rwops;
import sdl2d.stdinc;

/**
 * This is the read/write operation structure -- very basic.
 */
extern(C) struct SDL_RWops {
    /**
     *  Seek to \c offset relative to \c whence, one of stdio's whence values:
     *  RW_SEEK_SET, RW_SEEK_CUR, RW_SEEK_END
     *  
     *  \return the final offset in the data stream.
     */

    //long (* seek) (struct SDL_RWops * context, long offset, int whence);
    long function(SDL_RWops* context, long offset, long whence) seek;
    
    /**
     *  Read up to \c maxnum objects each of size \c size from the data
     *  stream to the area pointed at by \c ptr.
     *  
     *  \return the number of objects read, or 0 at error or end of file.
     */

    //size_t(* read) (struct SDL_RWops * context, void *ptr, size_t size, size_t maxnum);
    size_t function(SDL_RWops* context, void* ptr, size_t size, size_t maxnum) read;

    /**
     *  Write exactly \c num objects each of size \c size from the area
     *  pointed at by \c ptr to data stream.
     *  
     *  \return the number of objects written, or 0 at error or end of file.
     */

    //size_t(* write) (struct SDL_RWops * context, const void *ptr, size_t size, size_t num);
    size_t function(SDL_RWops* context, const void* ptr, size_t size, size_t num) write;

    /**
     *  Close and free an allocated SDL_RWops structure.
     *  
     *  \return 0 if successful or -1 on write error when flushing data.
     */
    //int (* close) (struct SDL_RWops * context);
    int function(SDL_RWops* context) close;

    Uint32 type;
    union hidden {

version(Android) {

        struct androidio {
            void *fileNameRef;
            void *inputStreamRef;
            void *readableByteChannelRef;
            void *readMethod;
            long position;
            int size;
        }
}

version(Win32) {

        struct windowsio {
            SDL_bool append;
            void *h;
            struct buffer {
                void *data;
                size_t size;
                size_t left;
            }
        }

}
/*
#ifdef HAVE_STDIO_H
        struct stdio
        {
            SDL_bool autoclose;
            FILE* fp;
        }//*/
//#endif
        struct mem {
            Uint8* base;
            Uint8* here;
            Uint8* stop;
        }
        struct unknown {
            void *data1;
        }
    }

}

/**
 *  \name RWFrom functions
 *  
 *  Functions to create SDL_RWops structures from various data streams.
 */
/*@{*/

extern(C) SDL_RWops* SDL_RWFromFile(const char *file, const char *mode);
/*
#ifdef HAVE_STDIO_H
extern(C) SDL_RWops* SDL_RWFromFP(FILE * fp, SDL_bool autoclose);
#else //*/
extern(C) SDL_RWops* SDL_RWFromFP(void * fp, SDL_bool autoclose);
//#endif

extern(C) SDL_RWops* SDL_RWFromMem(void* mem, int size);

extern(C) SDL_RWops* SDL_RWFromConstMem(const void* mem, int size);

/*@}*//*RWFrom functions*/


extern(C) SDL_RWops* SDL_AllocRW();

extern(C) void SDL_FreeRW(SDL_RWops* area);

enum RW_SEEK_SET = 0;       /**< Seek from the beginning of data */
enum RW_SEEK_CUR = 1;       /**< Seek relative to current read point */
enum RW_SEEK_END = 2;       /**< Seek relative to the end of data */

/**
 *  \name Read/write macros
 *  
 *  Macros to easily read and write from an SDL_RWops structure.
 */
/*@{*/

/*
                // YAPILACAK //


#define SDL_RWseek(ctx, offset, whence)	(ctx)->seek(ctx, offset, whence)
#define SDL_RWtell(ctx)			(ctx)->seek(ctx, 0, RW_SEEK_CUR)
#define SDL_RWread(ctx, ptr, size, n)	(ctx)->read(ctx, ptr, size, n)
#define SDL_RWwrite(ctx, ptr, size, n)	(ctx)->write(ctx, ptr, size, n)
#define SDL_RWclose(ctx)		(ctx)->close(ctx)


                // YAPILACAK //
*/


/*@}*//*Read/write macros*/


/** 
 *  \name Read endian functions
 *  
 *  Read an item of the specified endianness and return in native format.
 */
/*@{*/
extern(C) Uint16 SDL_ReadLE16(SDL_RWops* src);
extern(C) Uint16 SDL_ReadBE16(SDL_RWops* src);
extern(C) Uint32 SDL_ReadLE32(SDL_RWops* src);
extern(C) Uint32 SDL_ReadBE32(SDL_RWops* src);
extern(C) Uint64 SDL_ReadLE64(SDL_RWops* src);
extern(C) Uint64 SDL_ReadBE64(SDL_RWops* src);
/*@}*//*Read endian functions*/

/** 
 *  \name Write endian functions
 *  
 *  Write an item of native format to the specified endianness.
 */
/*@{*/
extern(C) size_t SDL_WriteLE16(SDL_RWops* dst, Uint16 value);
extern(C) size_t SDL_WriteBE16(SDL_RWops* dst, Uint16 value);
extern(C) size_t SDL_WriteLE32(SDL_RWops* dst, Uint32 value);
extern(C) size_t SDL_WriteBE32(SDL_RWops* dst, Uint32 value);
extern(C) size_t SDL_WriteLE64(SDL_RWops* dst, Uint64 value);
extern(C) size_t SDL_WriteBE64(SDL_RWops* dst, Uint64 value);
/*@}*//*Write endian functions*/

