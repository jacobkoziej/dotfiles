// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * keymap.c -- moonlander keymap
 * Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>
 */

#include QMK_KEYBOARD_H

enum layers {
	BASE,
	SYMBOLS,
	LAYERS,
};

#define MT_A MT(MOD_LALT, KC_A)
#define MT_R MT(MOD_LGUI, KC_R)
#define MT_S MT(MOD_LSFT, KC_S)
#define MT_T MT(MOD_LCTL, KC_T)
#define MT_N MT(MOD_RCTL, KC_N)
#define MT_E MT(MOD_RSFT, KC_E)
#define MT_I MT(MOD_RGUI, KC_I)
#define MT_O MT(MOD_RALT, KC_O)

#define LT_BSPC LT(SYMBOLS, KC_BSPC)

// clang-format off
const uint16_t PROGMEM keymaps[LAYERS][MATRIX_ROWS][MATRIX_COLS] = {
	[BASE] = LAYOUT(
	_______, KC_1   , KC_2   , KC_3   , KC_4   , KC_5   , _______,          _______, KC_6   , KC_7   , KC_8   , KC_9   , KC_0   , _______,
	_______, KC_Q   , KC_W   , KC_F   , KC_P   , KC_B   , _______,          _______, KC_J   , KC_L   , KC_U   , KC_Y   , KC_QUOT, _______,
	_______, MT_A   , MT_R   , MT_S   , MT_T   , KC_G   , _______,          _______, KC_M   , MT_N   , MT_E   , MT_I   , MT_O   , _______,
	_______, KC_Z   , KC_X   , KC_C   , KC_D   , KC_V   ,                            KC_K   , KC_H   , KC_COMM, KC_DOT , KC_SLSH, _______,
	QK_BOOT, _______, _______, _______, KC_ESC ,          _______,          _______,          _______, _______, _______, _______, _______,
	                                    KC_SPC , KC_TAB , _______,          _______, KC_ENT , LT_BSPC
	),
	[SYMBOLS] = LAYOUT(
	_______, _______, _______, _______, _______, _______, _______,          _______, _______, _______, _______, _______, _______, _______,
	_______, KC_TILD, KC_COLN, KC_SLSH, KC_LBRC, _______, _______,          _______, _______, KC_RBRC, KC_BSLS, KC_PIPE, KC_GRV , _______,
	_______, KC_EXLM, KC_PLUS, KC_LT  , KC_LPRN, _______, _______,          _______, _______, KC_RPRN, KC_GT  , KC_MINS, KC_EQL , _______,
	_______, KC_AT  , KC_HASH, KC_AMPR, KC_LCBR, _______,                            _______, KC_RCBR, KC_ASTR, KC_CIRC, KC_PERC, _______,
	_______, _______, _______, _______, KC_LCTL,          _______,          _______,          _______, _______, _______, _______, _______,
	                                    KC_UNDS, _______, _______,          _______, _______, _______
	),
};
// clang-format on
