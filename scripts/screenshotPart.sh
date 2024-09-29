#!/bin/bash
  
flameshot gui -r | wl-copy

sleep 1

pkill flameshot
