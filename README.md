## 📝 Judul Aplikasi

**ToDoList App - Laravel API + Flutter UI**

---

## 📄 Deskripsi Aplikasi

Aplikasi ini adalah **To-Do List sederhana** berbasis **Flutter (Frontend)** dan **Laravel REST API (Backend)**.

### ✨ Fitur Halaman (Flutter)

* **Login / Register** Pengguna
* **Dashboard** daftar to-do
* **Tambah / Edit / Hapus** to-do
* **Profile**
* **Logout**

### 📦 Backend Laravel (API)

* REST API dengan autentikasi Laravel Sanctum
* Endpoint:

  * `POST /api/register` - Register user
  * `POST /api/login` - Login
  * `GET /api/profile` - Profile
  * `GET /api/todos` - List semua to-do user
  * `POST /api/todos` - Tambah to-do
  * `PUT /api/todos/{id}` - Edit to-do
  * `DELETE /api/todos/{id}` - Hapus to-do

### Database

* Menggunakan **MySQL**
* Tabel:

  * `to_list`
  * `pengguna` 

---

## 🧰 Software yang Digunakan

* **Flutter Terbaru**
* **Laravel 11**
* **PHP 8.2**
* **MySQL**
* **Postman (untuk testing API)**
* **Laragon**
* **VS Code**

---

## ⚙️ Cara Instalasi

### 📅 1. Clone Repository

```bash
git clone https://github.com/rafiibnugroho/todolist_flutter.git
```

### 📆 2. Setup Laravel API

```bash
cd todolist_flutter/laravel_api_todo
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
```

Import database :

```bash
mysql -u root -p todolist_db < ../database/todolist_api_db.sql
```

### ▶️ 3. Jalankan Laravel

```bash
php artisan serve
```

### 📱 4. Jalankan Flutter

```bash
cd ../flutter_todolist
flutter pub get
flutter run
```

---

## 🚀 Cara Menjalankan

1. Pastikan backend Laravel aktif (`php artisan serve`)
2. Jalankan aplikasi Flutter (`flutter run`)
3. Login / register lalu mulai menambahkan To-Do
4. Cek hasil To-Do yang tersimpan di database

---

## 🎥 Demo Video (Simulasi)



https://github.com/user-attachments/assets/4bcc4bcc-033b-4345-b80f-f1d782f7c88c




## 👤 Identitas Pembuat

|              Nama             |    Kelas     |   No   |
| ----------------------------- | ------------ | ------ |
| **Rafi Ibnugroho Wicaksono**  | **XI RPL 2** | **27** |


