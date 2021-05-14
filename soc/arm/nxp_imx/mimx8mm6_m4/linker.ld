/*
 * Copyright (c) 2020, Manivannan Sadhasivam <mani@kernel.org>
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <arch/arm/aarch32/cortex_m/scripts/linker.ld>

#ifdef CONFIG_RPMSG_SERVICE
/* Specify the shared memory area */
MEMORY
{
  rpmsg_sh_mem          (RW)  : ORIGIN = 0xb8000000, LENGTH = 0x400000
}

SECTIONS
{
  /* NOINIT section for rpmsg_sh_mem */
  .noinit_rpmsg_sh_mem (NOLOAD) : ALIGN(4)
  {
     *(.noinit.$rpmsg_sh_mem*)
     . = ALIGN(4) ;
  } > rpmsg_sh_mem
}
#endif
