/*
 * Copyright (C) 2013 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/*
 * Android config -- "android-aarch64".  Used for ARM aarch64 device builds.
 */
#ifndef _ANDROID_CONFIG_H
#define _ANDROID_CONFIG_H

/*
 * ===========================================================================
 *                              !!! IMPORTANT !!!
 * ===========================================================================
 *
 * This file is included by ALL C/C++ source files.  Don't put anything in
 * here unless you are absolutely certain it can't go anywhere else.
 *
 * Any C++ stuff must be wrapped with "#ifdef __cplusplus".  Do not use "//"
 * comments.
 */

/*
 * Define if we have <malloc.h> header
 */
#define HAVE_MALLOC_H 1

/*
 * Define if we're running on *our* linux on device or emulator.
 */
#define HAVE_ANDROID_OS 1

/*
 * The default path separator for the platform
 */
#define OS_PATH_SEPARATOR '/'

/*
 * Define if <stdint.h> exists.
 */
#define HAVE_STDINT_H 1

<<<<<<< HEAD
/*
 * Define if <stdbool.h> exists.
 */
#define HAVE_STDBOOL_H 1

/*
 * Define if <sched.h> exists.
 */
#define HAVE_SCHED_H 1

/*
 * Define if pread() exists
 */
#define HAVE_PREAD 1

/*
 * Define if we have st_mtim in struct stat
 */
#define HAVE_STAT_ST_MTIM 1

/*
 * Define if printf() supports %zd for size_t arguments
 */
#define HAVE_PRINTF_ZD 1

/*
 * Define to 1 if <stdlib.h> provides qsort_r() with a BSD style function prototype.
 */
#define HAVE_BSD_QSORT_R 0

/*
 * Define to 1 if <stdlib.h> provides qsort_r() with a GNU style function prototype.
 */
#define HAVE_GNU_QSORT_R 0

/*
 * Define CONFIG_64BIT based on __LP64__
 */
#ifdef __LP64__
#define  CONFIG_64BIT
#endif

=======
>>>>>>> 71cd45a4fbee7eb650a523e4ad3c6eac4ef3ee58
#endif /* _ANDROID_CONFIG_H */
