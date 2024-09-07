// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * keycodes.h -- custom keycodes
 * Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>
 */

#pragma once

#include QMK_KEYBOARD_H

enum keycodes {
	KC_NVIM = SAFE_RANGE,
	KC_TMUX,
};

#define MT_A MT(MOD_LALT, KC_A)
#define MT_R MT(MOD_LGUI, KC_R)
#define MT_S MT(MOD_LSFT, KC_S)
#define MT_T MT(MOD_LCTL, KC_T)
#define MT_N MT(MOD_RCTL, KC_N)
#define MT_E MT(MOD_RSFT, KC_E)
#define MT_I MT(MOD_RGUI, KC_I)
#define MT_O MT(MOD_RALT, KC_O)
