// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * keymap.c -- moonlander keymap
 * Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>
 */

#include QMK_KEYBOARD_H

#include <shared/keycodes.h>
#include <shared/keymap.h>

enum layers {
	COLEMAK_DHM,
	SYMBOLS,
	MOVEMENT,
	LAYERS,
};

#define LT_BSPC LT(SYMBOLS,  KC_BSPC)
#define LT_SPC  LT(MOVEMENT, KC_SPC )

// clang-format off
const uint16_t PROGMEM keymaps[LAYERS][MATRIX_ROWS][MATRIX_COLS] = {
	[COLEMAK_DHM] = LAYOUT(
	_______, KC_1   , KC_2   , KC_3   , KC_4   , KC_5   , _______,          _______, KC_6   , KC_7   , KC_8   , KC_9   , KC_0   , _______,
	_______, KC_Q   , KC_W   , KC_F   , KC_P   , KC_B   , _______,          _______, KC_J   , KC_L   , KC_U   , KC_Y   , KC_QUOT, _______,
	_______, MT_A   , MT_R   , MT_S   , MT_T   , KC_G   , _______,          _______, KC_M   , MT_N   , MT_E   , MT_I   , MT_O   , _______,
	_______, KC_Z   , KC_X   , KC_C   , KC_D   , KC_V   ,                            KC_K   , KC_H   , KC_COMM, KC_DOT , KC_SLSH, _______,
	QK_BOOT, _______, _______, _______, KC_NVIM,          _______,          _______,          KC_TMUX, _______, _______, _______, _______,
	                                    LT_SPC , KC_TAB , KC_ESC ,          KC_CAPS, KC_ENT , LT_BSPC
	),
	[SYMBOLS] = LAYOUT(
	_______, KC_F1  , KC_F2  , KC_F3  , KC_F4  , KC_F5  , _______,          _______, KC_F6  , KC_F7  , KC_F8  , KC_F9  , KC_F10 , KC_F11 ,
	_______, KC_TILD, KC_COLN, KC_SCLN, KC_LBRC, KC_CIRC, _______,          _______, KC_DLR , KC_RBRC, KC_PERC, KC_PIPE, KC_GRV , KC_F12 ,
	_______, KC_EXLM, KC_MINS, KC_LT  , KC_LPRN, KC_AMPR, _______,          _______, KC_ASTR, KC_RPRN, KC_GT  , KC_PLUS, KC_EQL , _______,
	_______, _______, _______, KC_AT  , KC_LCBR, KC_SLSH,                            KC_BSLS, KC_RCBR, KC_HASH, _______, _______, _______,
	_______, _______, _______, _______, KC_LCTL,          _______,          _______,          _______, _______, _______, _______, _______,
	                                    KC_UNDS, KC_LGUI, _______,          _______, _______, _______
	),
	[MOVEMENT] = LAYOUT(
	_______, _______, _______, _______, _______, _______, _______,          _______, _______, _______, _______, _______, _______, _______,
	_______, _______, _______, _______, _______, _______, _______,          _______, KC_DOWN, KC_RGHT, _______, _______, _______, _______,
	_______, _______, _______, _______, _______, _______, _______,          _______, _______, _______, _______, _______, _______, _______,
	_______, _______, _______, _______, _______, _______,                            KC_UP  , KC_LEFT, _______, _______, _______, _______,
	_______, _______, _______, _______, _______,          _______,          _______,          _______, _______, _______, _______, _______,
	                                    _______, _______, _______,          _______, _______, _______
	),
};
// clang-format on

bool process_record_user(uint16_t keycode, keyrecord_t *record)
{
	return process_shared_record_user(keycode, record);
}
