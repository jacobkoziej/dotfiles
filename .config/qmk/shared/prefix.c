// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * prefix.c -- prefix automation
 * Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>
 */

#include QMK_KEYBOARD_H

#include <stdbool.h>
#include <stdint.h>

#include <shared/keycodes.h>
#include <shared/prefix.h>

static struct {
	bool nvim : 1;
	bool tmux : 1;
} prefix;

bool process_prefix(const uint16_t keycode, const keyrecord_t * const record)
{
	switch (keycode) {
		case KC_NVIM:
			prefix.nvim = record->event.pressed;
			return false;

		case KC_TMUX:
			prefix.tmux = record->event.pressed;
			return false;

		default:
			break;
	}

	if (record->event.pressed) {
		if (prefix.nvim)
			tap_code16(PREFIX_NVIM);

		if (prefix.tmux)
			tap_code16(PREFIX_TMUX);
	}

	return true;
}
