// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * keymap.c -- launch_1 keymap
 * Copyright (C) 2022--2024  Jacob Koziej <jacobkoziej@gmail.com>
 */

#include QMK_KEYBOARD_H

#include <shared/keycodes.h>
#include <shared/keymap.h>

enum layers {
	QWERTY,
	QWERTY_NORMAL,
	LAYERS,
};

#define TG_NORM TG(QWERTY_NORMAL)

// clang-format off
const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	[QWERTY] = LAYOUT(
	KC_CAPS, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  KC_DEL,  KC_HOME,
	KC_GRV,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS, KC_EQL,  KC_BSPC, KC_PGUP,
	KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC, KC_RBRC, KC_BSLS, KC_PGDN,
	KC_ESC,  MT_A,    MT_S,    MT_D,    MT_F,    KC_G,    KC_H,    MT_J,    MT_K,    MT_L,    MT_SCLN, KC_QUOT, KC_ENT,           KC_END,
	KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT,          KC_UP,
	KC_LCTL, KC_LGUI, KC_LALT, KC_NVIM,          KC_SPC,  KC_TMUX,          KC_RALT, KC_RCTL, TG_NORM,          KC_LEFT, KC_DOWN, KC_RGHT
	),
	[QWERTY_NORMAL] = LAYOUT(
	KC_CAPS, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  KC_DEL,  KC_HOME,
	KC_GRV,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS, KC_EQL,  KC_BSPC, KC_PGUP,
	KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC, KC_RBRC, KC_BSLS, KC_PGDN,
	KC_ESC,  KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT, KC_ENT,           KC_END,
	KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT,          KC_UP,
	KC_LCTL, KC_LGUI, KC_LALT, KC_NO,            KC_SPC,  KC_NO,            KC_RALT, KC_RCTL, TG_NORM,          KC_LEFT, KC_DOWN, KC_RGHT
	),
};
// clang-format on

bool process_record_user(uint16_t keycode, keyrecord_t *record)
{
	return process_shared_record_user(keycode, record);
}
