// SPDX-License-Identifier: GPL-3.0-or-later
/*
 * keymap.h -- shared keymap
 * Copyright (C) 2024  Jacob Koziej <jacobkoziej@gmail.com>
 */

#pragma once

#include QMK_KEYBOARD_H

#include <stdbool.h>
#include <stdint.h>

bool process_shared_record_user(const uint16_t keycode, const keyrecord_t * const record);
