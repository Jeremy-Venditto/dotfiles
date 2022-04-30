#!/bin/bash
#sed "1s/themes[[]13[]]/NEWFUCKINGLINE-BITCH/g" ohman --> ohman2

sed "s/^local\ chosen_theme.*/local chosen_theme = themes[13]/g" ohman
