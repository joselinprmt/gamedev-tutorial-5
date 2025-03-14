# Tutorial 5: Assets Creation & Integration 🎮

![Screenshot 2025-03-14 052340](https://github.com/user-attachments/assets/ac0f51fb-e920-4a55-b422-35956114167e)

## Polishing yang dilakukan

- Menambahkan 2 objek baru: Cherry dan Pineapple, beserta animasi idle dan ketika Player menyentuh objek tersebut
- Menambahkan sound effect (sfx) untuk Player ketika Jump dan Dash
- Menambahkan sound effect (sfx) untuk Cherry & Pineapple ketika Player menyentuh objek tersebut
- Menambahkan background music

## Menambahkan background music

Pertama, akan ditambahkan file bgm.wav pada folder assets/sound. Lalu, karena bgm akan selalu diputar ketika game berjalan, maka akan diatur agar sound selalu looping pada tab import > loop mode > Forward. Lalu setelahnya akan di reimport.

![image](https://github.com/user-attachments/assets/87b978d5-fdb4-4e86-b1b4-77f0215d6dd2)

Setelahnya, tambahkan child AudioStreamPlayer2D pada scene Main, lalu drag file bgm.wav ke bagian stream, dan set autoplay menjadi on agar sound akan langsung diplay saat scene Main pertama kali dibuka. Maka, background music telah berhasil ditambahkan.

![image](https://github.com/user-attachments/assets/4ead5e68-26a6-4b69-a8eb-bab8e6e29f8d)

## Menambahkan sound effect ketika Player melakukan Jump dan Dash

Seperti sebelumnya, akan ditambahkan child AudioStreamPlayer2D pada Player, untuk sfx_jump.wav dan sfx_dash.wav dari asset folder.

![image](https://github.com/user-attachments/assets/c88203ca-a2d9-4087-83bb-bdfa63918a31)

Lalu drag dan drop sambil menekan CTRL pada gdscript Player.gd. Hasilnya, akan ter-import sfx_jump dan sfx_dash seperti berikut.

![image](https://github.com/user-attachments/assets/077d560a-505a-4b66-8796-9222ec7992b5)

Selanjutnya, akan di-call sfx.jump.play() ketika player melakukan jump dan double jump pada fungsi _physics_process:

![image](https://github.com/user-attachments/assets/93851e09-5bd0-4bfd-971f-a952de241487)

Begitu juga dengan sfx_dash:

![image](https://github.com/user-attachments/assets/41ada1e1-f2a0-44ce-9832-918a2bce897e)

Hasilnya, akan muncul sound effect ketika pLayer melakukan Jump dan dash.

## Menambahkan objek baru: Cherry dan Pineapple dengan AnimatedSprite2D, disertai dengan sfx nya

Akan ditambahkan scene baru bernama Cherry.tscn, lalu buat rootnya menjadi Area2D. Tambahkan child CollisionShape, AnimatedSprite, dan AudioStreamPlayer. Lalu buat Collision Shapenya menjadi circle shape. Pada Animated Sprite, tambahkan Sprite Frame baru, dan pada animation default, tambahkan frame dari sprite sheet seperti yang telah dijelaskan pada tutorial:

![image](https://github.com/user-attachments/assets/408c0944-bfa6-4c85-9954-4749cbe4d054)

Tambahkan juga animasi collected yang akan dijalankan ketika player menyentuh objek.

![image](https://github.com/user-attachments/assets/fa907984-15cb-4707-b4cc-e2acc4d2d4b5)

Pada animasi default, karena animasi objek akan terus berjalan dan selalu dimulai ketika pertama kali scene di-load, aktifkan animation looping dan autoplay on load. Set juga framenya menjadi 15 FPS. Hasilnya, sprite frame menjadi sebagai berikut. 

![image](https://github.com/user-attachments/assets/003a55dc-217e-44e7-afd9-2f91fc3ff48d)

Lalu, akan ditambahkan gdscript yang akan men-handle sfx dan animasi ketika Player menyentuh objek, dengan mengaktifkan on_body_entered() node, dan mengecek jika body Mode2D adalah player, sebagai berikut. 

![image](https://github.com/user-attachments/assets/7ed32b9b-b08d-465c-8cbe-9fce38216d99)

Lalu, lakukan hal yang sama juga untuk scene Pineapple.

![image](https://github.com/user-attachments/assets/c2fc01ce-6dcd-4de3-9038-1ec170dcc9d5)

Hasilnya, telah dibuat dua objek items yang akan hilang ketika berinteraksi dengan Player, atau dengan kata lain, items yang dapat di-collect oleh Player, lengkap dengan animasi dan sfx ketika berinteraksi dengan Player 🎉

![image](https://github.com/user-attachments/assets/647102bf-8b81-4130-8355-5e8a94485080)

*Daftar asset sfx dan animasi yang digunakan terdapat pada section referensi di bawah.

# Tutorial 3: Introduction to Game Programming 🎮

![Screenshot 2025-02-28 184657](https://github.com/user-attachments/assets/e34e8029-3db4-4a81-9d28-96a1c5ebf04e)

## Polishing yang dilakukan

- Mengganti ground tile dan avatar Player
- Menambahkan tulisan dan background
- Menambahkan input map control WASD, Space, Shift, dan Right click Mouse
- Menambahkan animasi dengan AnimatedSprite2D untuk state Idle (Default), Dash, Running, Jump, Double Jump, dan Arah pergerakan

![image](https://github.com/user-attachments/assets/ee82932e-910c-4a8a-91dd-62d9015dbdfb)

## Eksplorasi Mekanika Pergerakan

Pada latihan ini, saya menambah 2 mekanika pergerakan yaitu double jump dan dash. Tombol pergerakan dibind pada Project > Project Settings > Input Map. Disini saya men-set input:
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

Terakhir, akan ditambahkan if condition, jika Player menekan dash button beserta arahnya, kecepatan Player akan dikalikan dengan `dash_speed`, atau dipercepat 4 kali.

![image](https://github.com/user-attachments/assets/5fc812b7-f82b-46f1-9df1-22ea09f85ae3)

Mekanika pergerakan berhasil diimplementasikan beserta animasinya 🎉

## Referensi & Asset

- swydev. (Juni, 2024). How To Dash & Double Jump - Godot 4 2D Tutorial [Video]. Youtube. https://youtu.be/NhHpDcpY8ok?si=ri9lwdq7SCnKXbH3
- Coco Code. (Oktober, 2023). Start Your Game Creation Journey Today! (Godot beginner tutorial), AnimatedSprite2D & Character Movement. [Video] https://youtu.be/5V9f3MT86M8?si=ibWDtyKeUZ5Mq9VQ

- Player, terrain, cherry, dan pineapple assets. https://pixelfrog-assets.itch.io/pixel-adventure-1
- Background music. https://gooseninja.itch.io/happy-loops
- Jump and dash sound effect. https://jalastram.itch.io/8-bit-jump-sound-effects
- Fruits collected sound effect. https://brackeysgames.itch.io/brackeys-platformer-bundle
