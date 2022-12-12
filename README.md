[![Build status](https://build.appcenter.ms/v0.1/apps/479a053c-1ee0-4a63-a23d-50d97b31308d/branches/main/badge)](https://appcenter.ms)

[Link Aplikasi Heroku](https://start-in.herokuapp.com/) 

## Anggota Kelompok
1. Uttsada Jason
2. Rahfi Alyendra Gibran
3. Muhammad Fauzan Rizky Ramadhan
4. Rafi Rasendrya Favian
5. Muhammad Raihan
6. Mahmud Asrul

## Kegunaan Aplikasi
Aplikasi StartIn bertujuan memajukan inovasi teknologi di Indonesia. StartIn memberikan sarana bagi semua orang yang memiliki ide inovasi teknologi untuk mendapatkan donasi dari orang lain untuk funding terhadap projek mereka. Dengan begini, harapannya StartIn dapat mendukung pertumbuhan teknologi Indonesia dan meningkatkan jumlah tech startup.
StartIn juga memberikan sarana bagi siswa dan mahasiswa untuk belajar segala hal mengenai teknologi dan cara memulai startup mereka sendiri dengan mengikuti workshop, talkshow, dan courses yang ada di StartIn.
StartIn juga menampilkan berita-berita terbaru seputar tech startup dan teknologi terbaru yang paling berpotensi. Dengan begini, masyarakat Indonesia tidak akan ketinggalan berita mengenai teknologi yang saat ini sedang dikembangkan.

## Daftar Modul
### Project Tech Startup & Donation - Uttsada Jason
Menampilkan project tech startup yang sudah pernah diusulkan dan progress project tersebut. User juga dapat melakukan project proposal jika memiliki ide inovasi dan menerima donasi dari user lain sebagai funding untuk project mereka.
Peran user:
- Admin melakukan verifikasi terhadap proposal project yang dilakukan oleh User.
- User dapat melihat project yang mereka dukung, melihat project yang sedang berlangsung dan progressnya, memberikan proposal untuk project tech startup, dan dapat memberikan dukungan ke project yang ada melalui donasi dan dapat melihat list User lain yang sudah memberikan donasi.

### Tech News - Muhammad Raihan
Menampilkan berita mengenai tech terbaru.
Peran user:
- Admin memasukkan berita yang telah diseleksi secara berkala.
- User dapat melihat news yang ditampilkan.

### Workshop & Talkshow - Rafi Rasendrya Favian
Menampilkan workshop dan talkshow mengenai teknologi dan startup yang sedang berlangsung. Bisa juga mendaftarkan workshop dan talkshow untuk dilaksanakan melalui aplikasi ini.
Peran user:
- Admin memasukkan workshop dan talkshow ke dalam list yang bisa dipantau.
- User dapat melihat list workshop dan talkshow yang sedang berlaku.

### Courses - Mahmud Asrul
Memberikan kursus gratis dan berbayar mengenai teknologi seperti programming dan entrepreneurship.
Peran user:
- Admin memasukkan courses yang bisa diikuti User.
- User dapat mengikuti courses yang ada.

### Souvenir Shop - Muhammad Fauzan Rizky Ramadhan
Tempat user dapat membeli souvenir dari StartIn. Tujuannya sebagai salah satu sumber penghasilan agar bisa melakukan maintainance website.
Peran user:
- Admin memasukkan barang-barang souvenir yang dapat dibeli oleh User.
- User dapat membeli barang dari souvenir dan meninggalkan review terhadap barang yang mereka beli.

### Forum - Rahfi Alyendra Gibran
User dapat berbagi ide, tips, dan melakukan tanya jawab dengan user lain.
Peran user:
- User dapat membuat post baru dan mereply user lain.

## Alur Pengintegrasian
Aplikasi mobile akan menggunakan bantuan server Django tugas kelompok tengah semester sebelumnya. Dengan kata lain, Flutter app yang kami buat akan melakukan HTTP request seperti GET dan POST ke server Django yang sudah kami buat sebelumnya untuk mendukung fitur-fitur yang ada. Contohnya, fitur like project tetap akan melakukan POST request ke server Django sama seperti tugas tengah semester.
