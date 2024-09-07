// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * keymap.c -- shared keymap
 * Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>
 */

#include QMK_KEYBOARD_H

#include <stdbool.h>
#include <stdint.h>

#include <shared/keymap.h>
#include <shared/prefix.h>

bool process_shared_record_user(const uint16_t keycode, const keyrecord_t * const record)
{
	bool process;

	process = process_prefix(keycode, record);

	if (!process)
		return false;

	return true;
}
