/*
 *  Copyright (C) 2022  Jacob Koziej <jacobkoziej@gmail.com>
 *  Copyright (C) 2021  System76
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <https://www.gnu.org/licenses/>.
 */

/*
 * Layout
 *  _________________________________________________________________________________________________________________________________  ________
 * |        |        |        |        |        |        |        |        |        |        |        |        |        |            ||        |
 * |  CAPS  |   F1   |   F2   |   F3   |   F4   |   F5   |   F6   |   F7   |   F8   |   F9   |  F10   |  F11   |  F12   |   DELETE   ||  HOME  |
 * |________|________|________|________|________|________|________|________|________|________|________|________|________|____________||________|
 * |   ~    |   !    |   @    |   #    |   $    |   %    |   ^    |   &    |   *    |   (    |   )    |   _    |   +    |            ||        |
 * |   `    |   1    |   2    |   3    |   4    |   5    |   6    |   7    |   8    |   9    |   0    |   -    |   =    | BACKSPACE  ||  PGUP  |
 * |________|________|________|________|________|________|________|________|________|________|________|________|________|____________||________|
 * |            |        |        |        |        |        |        |        |        |        |        |   [    |   ]    |   |    ||        |
 * |    TAB     |   Q    |   W    |   E    |   R    |   T    |   Y    |   U    |   I    |   O    |   P    |   {    |   }    |   \    ||  PGDN  |
 * |____________|________|________|________|________|________|________|________|________|________|________|________|________|________||________|
 *   |            |        |        |        |        |        |        |        |        |        |   :    |   "    |            |   |        |
 *   |    ESC     |   A    |   S    |   D    |   F    |   G    |   H    |   J    |   K    |   L    |   ;    |   '    |    ENTER   |   |  END   |
 *   |____________|________|________|________|________|________|________|________|________|________|________|________|____________|___|________|
 *   |                |        |        |        |        |        |        |        |   <    |   >    |   ?    |            |        |
 *   |     SHIFT      |   Z    |   X    |   C    |   V    |   B    |   N    |   M    |   ,    |   .    |   /    |   SHIFT    |   UP   |
 *   |________________|________|________|________|________|________|________|________|________|________|________|____________|________|________
 *   |            |        |       |        |                 |                 |        |        |             |   |        |        |        |
 *   |    CTRL    |  LGUI  | LALT  |  FN2   |      SPACE      |       FN1       |  RALT  | RCTRL  |     FN3     |   |  LEFT  |  DOWN  | RIGHT  |
 *   |____________|________|_______|________|_________________|_________________|________|________|_____________|   |________|________|________|
 */

#include QMK_KEYBOARD_H


#define TMUX_LAYER         1
#define TMUX_PREFIX_STRING SS_LCTL(" ")

#define VIM_WINDOW_LAYER         2
#define VIM_WINDOW_PREFIX_STRING SS_LCTL("w")


const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
	[0] = LAYOUT(
	KC_CAPS, KC_F1,   KC_F2,   KC_F3,   KC_F4,   KC_F5,   KC_F6,   KC_F7,   KC_F8,   KC_F9,   KC_F10,  KC_F11,  KC_F12,  KC_DEL,  KC_HOME,
	KC_GRV,  KC_1,    KC_2,    KC_3,    KC_4,    KC_5,    KC_6,    KC_7,    KC_8,    KC_9,    KC_0,    KC_MINS, KC_EQL,  KC_BSPC, KC_PGUP,
	KC_TAB,  KC_Q,    KC_W,    KC_E,    KC_R,    KC_T,    KC_Y,    KC_U,    KC_I,    KC_O,    KC_P,    KC_LBRC, KC_RBRC, KC_BSLS, KC_PGDN,
	KC_ESC,  KC_A,    KC_S,    KC_D,    KC_F,    KC_G,    KC_H,    KC_J,    KC_K,    KC_L,    KC_SCLN, KC_QUOT, KC_ENT,           KC_END,
	KC_LSFT, KC_Z,    KC_X,    KC_C,    KC_V,    KC_B,    KC_N,    KC_M,    KC_COMM, KC_DOT,  KC_SLSH, KC_RSFT,          KC_UP,
	KC_LCTL, KC_LGUI, KC_LALT, MO(2),            KC_SPC,  MO(1),            KC_RALT, KC_RCTL, MO(3),            KC_LEFT, KC_DOWN, KC_RGHT
	),

	[1] = LAYOUT(
	_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
	_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
	_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
	_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,          _______,
	KC_LSFT, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_RSFT,          _______,
	KC_LCTL, KC_LGUI, KC_LALT, XXXXXXX,          _______, XXXXXXX,          KC_RALT, KC_RCTL, XXXXXXX,          _______, _______, _______
	),

	[2] = LAYOUT(
	_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_MPLY,
	_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_VOLU,
	_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_VOLD,
	_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,          KC_MUTE,
	KC_LSFT, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, KC_RSFT,          KC_MFFD,
	KC_LCTL, KC_LGUI, KC_LALT, XXXXXXX,          _______, XXXXXXX,          KC_RALT, KC_RCTL, XXXXXXX,          KC_MPRV, KC_MRWD, KC_MNXT
	),

	[3] = LAYOUT(
	_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,
	_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, RGB_TOG, RGB_VAD, RGB_VAI, _______, _______,
	KC_PSCR, _______, _______, _______, _______, _______, KC_HOME, KC_PGDN, KC_PGUP, KC_END,  _______, _______, _______, _______, _______,
	_______, _______, _______, _______, _______, _______, KC_LEFT, KC_DOWN, KC_UP,   KC_RGHT, _______, _______, _______,          _______,
	_______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______, _______,          KC_PGUP,
	_______, _______, _______, _______,          _______, _______,          _______, _______, _______,          KC_HOME, KC_PGDN, KC_END
	),
};


bool process_record_user(uint16_t keycode, keyrecord_t *record)
{
	static action_t action;
	static uint8_t  mods;
	
	if (IS_LAYER_ON(TMUX_LAYER)) {
		action = action_for_key(TMUX_LAYER, record->event.key);

		if (action.code == ACTION_TRANSPARENT) {
			if (record->event.pressed) {
				// we want to only send the prefix so
				// we'll need to clear and restore
				// the held modifier keys
				mods = get_mods();
				clear_mods();
				SEND_STRING(TMUX_PREFIX_STRING);
				set_mods(mods);
			}
		}
	}

	if (IS_LAYER_ON(VIM_WINDOW_LAYER)) {
		action = action_for_key(VIM_WINDOW_LAYER, record->event.key);

		if (action.code == ACTION_TRANSPARENT) {
			if (record->event.pressed) {
				// we want to only send the window
				// prefix so we'll need to clear and
				// restore the held modifier keys
				mods = get_mods();
				clear_mods();
				SEND_STRING(VIM_WINDOW_PREFIX_STRING);
				set_mods(mods);
			}
		}
	}

	return true;
}
