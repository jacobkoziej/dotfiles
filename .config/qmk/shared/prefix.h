// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * prefix.h -- prefix automation
 * Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>
 */

#include QMK_KEYBOARD_H

#include <stdbool.h>
#include <stdint.h>

#define PREFIX_NVIM LCTL(KC_W    )
#define PREFIX_TMUX LCTL(KC_SPACE)

bool process_prefix(const uint16_t keycode, const keyrecord_t * const record);
