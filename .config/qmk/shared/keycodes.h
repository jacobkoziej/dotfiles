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

#ifdef LAYOUT_COLEMAK_DHM
#define MT_A MT(MOD_LALT, KC_A)
#define MT_R MT(MOD_LGUI, KC_R)
#define MT_S MT(MOD_LSFT, KC_S)
#define MT_T MT(MOD_LCTL, KC_T)
#define MT_N MT(MOD_RCTL, KC_N)
#define MT_E MT(MOD_RSFT, KC_E)
#define MT_I MT(MOD_RGUI, KC_I)
#define MT_O MT(MOD_RALT, KC_O)
#endif // LAYOUT_COLEMAK_DHM

#ifdef LAYOUT_QWERTY
#define MT_A    MT(MOD_LALT, KC_A)
#define MT_S    MT(MOD_LGUI, KC_S)
#define MT_D    MT(MOD_LSFT, KC_D)
#define MT_F    MT(MOD_LCTL, KC_F)
#define MT_J    MT(MOD_RCTL, KC_J)
#define MT_K    MT(MOD_RSFT, KC_K)
#define MT_L    MT(MOD_RGUI, KC_L)
#define MT_SCLN MT(MOD_RALT, KC_SCLN)
#endif // LAYOUT_QWERTY
