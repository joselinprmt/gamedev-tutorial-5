# Tutorial 3: Introduction to Game Programming 🎮

![Screenshot 2025-02-28 184657](https://github.com/user-attachments/assets/e34e8029-3db4-4a81-9d28-96a1c5ebf04e)

## Polishing yang dilakukan

- Mengganti ground tile dan avatar Player
- Menambahkan tulisan dan background
- Menambahkan input map control WASD, Space, Shift, dan Right click Mouse
- Menambahkan animasi dengan AnimatedSprite2D untuk state Idle (Default), Dash, Running, Jump, dan Double Jump, dan Arah pergerakan

![image](https://github.com/user-attachments/assets/ee82932e-910c-4a8a-91dd-62d9015dbdfb)

## Eksplorasi Mekanika Pergerakan

Pada latihan ini, saya menambah 2 mekanika pergerakan yaitu double jump dan dash. Pastikan tombol telah dibind pada Project > Project Settings > Input Map. Disini saya men-set input:
- WASD & arrow keys untuk bergerak
- W, Space, dan up arrow untuk jump
- Right click & shift untuk dash

![image](https://github.com/user-attachments/assets/4c5b25b5-273a-4a5c-82a6-6d06b50c5c96)
![image](https://github.com/user-attachments/assets/fe940882-db6d-46ec-b22f-c7307552daa7)


### Double Jump

Pertama, akan dinisialisasi variabel `jump_count`, yang nantinya digunakan untuk menyimpan berapa kali jump button telah ditekan oleh player. Jump count akan direset menjadi 0 jika Player tidak menekan jump button dan Player sedang berada di floor (ground).

![image](https://github.com/user-attachments/assets/fb722f7b-bcf6-49b2-bb49-a4e4a9a9d5c4)

Lalu, dibuat 2 if condition. Pertama (if di posisi bawah), jika Player baru pertama kali menekan tombol jump dan posisinya sedang difloor, akan memutar animasi jump once, dan men-set variabel `jump_count` menjadi 1. Lalu, if yang kedua akan mengecek jika `jump_count` sudah 1, dan Player menekan tombol jump lagi, akan diputar animasi double jump.

![image](https://github.com/user-attachments/assets/5a0933d5-54fa-44fe-a2f2-b5b1f2638944)


### Dashing

Untuk dash, akan dinisialisasi variable `dash_speed = 4`, dan `is_dashing = false`. Lalu dibuat if condition jika dash button ditekan beserta arahnya, dan jika sebelumnya belum ada di dalam dashing state, akan masuk ke dashing state dengan `start_dash()`.

![image](https://github.com/user-attachments/assets/c510afab-5e45-4531-8924-ff4d4ed4d6fb)

Selain itu, diinisialisasi juga fungsi `start_dash()` dan `stop_dash()`,

![image](https://github.com/user-attachments/assets/428030f1-671b-4416-a9ee-171fa833bcfa)

Dan ditambahkan juga Timer bernama `DashTimer` untuk mengatur durasi dash. `DashTimer` adalah child dari Player.

![image](https://github.com/user-attachments/assets/5ab3eb22-2765-441f-a977-dfe9bfb27eb9)

Terakhir, akan ditambahkan if condition, jika Player menekan dash button beserta arahnya, kecepatan Player akan dikalikan dengan `dash_speed`, atau dipercepatn 4 kali.

![image](https://github.com/user-attachments/assets/5fc812b7-f82b-46f1-9df1-22ea09f85ae3)

Mekanika pergerakan berhasil diimplementasikan beserta animasinya 🎉

### Referensi

- swydev. (Juni, 2024). How To Dash & Double Jump - Godot 4 2D Tutorial [Video]. Youtube. https://youtu.be/NhHpDcpY8ok?si=ri9lwdq7SCnKXbH3
- Coco Code. (Oktober, 2023). Start Your Game Creation Journey Today! (Godot beginner tutorial), AnimatedSprite2D & Character Movement. [Video] https://youtu.be/5V9f3MT86M8?si=ibWDtyKeUZ5Mq9VQ
