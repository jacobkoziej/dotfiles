// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * keymap.c -- moonlander keymap
 * Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>
 */

#include QMK_KEYBOARD_H

#define MT_R MT(MOD_LALT, KC_R)
#define MT_S MT(MOD_LGUI, KC_S)
#define MT_T MT(MOD_LCTL, KC_T)
#define MT_N MT(MOD_RCTL, KC_N)
#define MT_E MT(MOD_RGUI, KC_E)
#define MT_I MT(MOD_RALT, KC_I)

enum layers {
    BASE,
    LAYERS,
};

// clang-format off
const uint16_t PROGMEM keymaps[LAYERS][MATRIX_ROWS][MATRIX_COLS] = {
	[BASE] = LAYOUT(
	QK_BOOT, _______, _______, _______, _______, _______, _______,          _______, _______, _______, _______, _______, _______, _______,
	_______, KC_Q   , KC_W   , KC_F   , KC_P   , KC_B   , _______,          _______, KC_J   , KC_L   , KC_U   , KC_Y   , KC_QUOT, _______,
	_______, KC_A   , MT_R   , MT_S   , MT_T   , KC_G   , _______,          _______, KC_M   , MT_N   , MT_E   , MT_I   , KC_O   , _______,
	_______, KC_Z   , KC_X   , KC_C   , KC_D   , KC_V   ,                            KC_K   , KC_H   , KC_COMM, KC_DOT , KC_SLSH, _______,
	_______, _______, _______, _______, _______,          _______,          _______,          _______, _______, _______, _______, _______,
	                                    KC_SPC , KC_TAB , _______,          _______, KC_ENT , KC_BSPC
	),
};
// clang-format on
