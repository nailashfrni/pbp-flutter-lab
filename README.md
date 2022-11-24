# Tugas 7 PBP

## Questions

### **1. Stateless widget dan stateful widget**

Stateless Widget adalah widget yang pengaturannya sudah diatur saat awal inisiasi dan tidak bisa diubah.

Stateful Widget adalah widget yang dinamis dan dapat diperbarui tampilan atau komponennya ketika ada event yang terjadi atau data yang berubah.

|Stateless Widget|Stateful Widget|
|----------------|---------------|
|Bersifat statis, tidak dapat diubah lagi|Bersifat dinamis, dapat diubah tampilannya ketika terjadi event atau perubahan data|
|Subclass dari `StatelessWidget`|Subclass dari `StatefulWidget`|
|Tidak mempunyai State yang disimpan|Menyimpan informasi State pada `State` object, berisi nilai yang dapat berubah|

### **2. Widget yang digunakan beserta fungsinya**

- Scaffold: menerapkan struktur visual dari Material Design, di dalamnya terdapat banyak widget yang dapat digunakan seperti Drawer, SnackBar, dll.
- Column: menyusun beberapa widget children dalam bentuk kolom secara vertikal
- Text: menampilkan text atau string pada aplikasi
- Stack: widget yang berisi list widget dan disimpan secara bertumpukan. Widget ini memungkinkan adanya overlapping beberapa widget
- Visibility: mengatur visibilitas dari widget child-nya
- Container: mengatur beberapa widget children, termasuk mengatur padding, margin, dsb.
- FloatingActionButton: button yang dapat memicu terjadinya event di aplikasi
- Icon: menampilkan icon di aplikasi

### **3. Fungsi dari setState() dan variabel apa saja yang terdampak**

setState() berfungsi menginformasikan framework bahwa terdapat perubahan state internal, yang bisa saja mengubah tampilkan aplikasi. setState() akan memicu current widget dan turunannya digambar ulang sehingga perubahan dapat terlihat. 

### **4. Perbedaan const dengan final**

Const digunakan untuk deklarasi variabel immutable yang nilainya tak dapat berubah, dan harus diketahui saat compile time. Dengan kata lain, variabelnya harus diberi nilai secara langsung. Contoh: `const umur = 19;`

Final digunakan untuk mengatur variable yang inisiasi nilainya hanya sekali saat pertama kali dibuat. Final dapat digunakan untuk deklarasi variable immutable yang nilainya diketahui saat runtime. Contoh: `final waktu = new DateTime.now();`

### **5. Implementasi checklist**

- Membuat aplikasi baru dengan `flutter create counter_7`
- Menambah variable status pada class state untuk menyimpan informasi genap/ganjil
- Membuat 3 function baru: decrementCounter() untuk menurunkan nilai counter, updateStatus() untuk mengupdate genap/ganjilnya counter, serta getColor() untuk menentukan warna tulisan status yang akan ditampilkan
- Mengganti tulisan yang ditampilkan dengan variable status ganjil/genap
- Menambahkan widget FloatingActionButton baru yang disimpan di dalam widget Stack. Dua button tersebut berfungsi sebagai increment dan decrement counter, yang ditampilkan di sisi pojok bawah kiri dan kanan dari aplikasi.

## Referensi
- https://levelup.gitconnected.com/6-easy-tips-when-working-with-setstate-in-a-flutter-application-3d629bc77a16
- javatpoint.com
- api.flutter.dev/

# Tugas 8 PBP

## Questions

### **1. Perbedaan `Navigator.push` dan `Navigator.pushReplacement`**

Navigator.push akan menambahkan halaman baru pada top of Stack. Halaman yang sudah pernah diakses sebelumnya akan tetap berada pada stack dan dapat dikembalikan dengan method Navigator.pop

Berbeda dengan Navigator.pushReplacement, method ini akan mengganti sepenuhnya halaman yang sedang dikunjungi dengan halaman yang baru. Hal ini menyebabkan halaman saat ini sudah tidak ada pada stack dan tidak dapat dikunjungi dengan method Navigator.pop

### **2. Widget yang digunakan beserta fungsinya**

- Drawer: widget menu pada sisi app yang dapat digunakan sebagai navigasi halaman
- ListTile: widget yang menggambarkan 1 baris, berisi beberapa text dan disertai trailing dan leading icon
- MaterialPageRoute: modal route yang digunakan untuk mengganti halaman disertai transisi
- Form: membuat form pada aplikasi
- TextFormField: menampilkan input form berupa teks
- OutlineInputBorder: menambahkan border (garis luar) pada form input
- InputDecoration: menspesifikasikan dekorasi pada form input. Di dalamnya dapat didefinisikan label text, hint text, dll.
- DropdownButtonHideUnderline: menampilkan tombol dropdown tanpa underline
- DropdownButton: menampilkan tombol dropdown (pilihan) pada aplikasi 
- DropdownMenuItem: widget yang mendefinisikan satu buah item pilihan pada dropdown
- ElevatedButton: widget button dengan tampilan yang lebih berdimensi
- Dialog: widget pop-up yang muncul pada layar yang biasanya berisi informasi atau alert
- Material: widget penampung dimana widget-widget di dalamnya dapat diberikan efek tampilan seperti Clipping, Elevation, dan Ink Effects.

### **3. Jenis-jenis event pada Flutter**

- onPressed: event yang terjadi ketika suatu button ditekan
- onChange: event yang terjadi ketika terjadi perubahan nilai pada suatu widget, biasanya pada widget yang menerima input
- onTap: event yang terjadi ketika suatu widget diclick

### **4. Cara kerja Navigator dalam mengganti halaman aplikasi**

Navigator merupakan widget yang cara kerjanya mengikuti aturan Stack. Halaman yang sedang dikunjungi akan berada pada top of stack, dengan halaman-halaman sebelumnya akan berada di bawahnya. Untuk mengunjungi halaman baru, cukup menggunakan method Navigator.push, dengan syntax kurang lebih seperti ini.

```
Navigator.push(
    context, 
   	MaterialPageRoute(builder: (context) {
  		return newPage()
  	})
);
```

Ketika dipush, halaman baru tersebut akan disimpan di top of stack dan tampilan aplikasi pun ikut berganti. Halaman sebelumnya dapat dikunjungi kembali dengan method Navigator.pop(). Navigator juga dapat digunakan untuk menampilkan pop-up atau dialog.

### **5. Implementasi checklist**

- Membuat 2 halaman baru: tambah_budget.dart yang berisi halaman form untuk menambahkan budget dan data_budget.dart yang berisi halaman untuk menampilkan data-data budget
- Menambahkan drawer pada setiap halaman
- Membuat class Budget yang merepresentasikan object Budget, yang memiliki atribut judul, nominal, dan jenis budget (atribut tambahan date untuk bonus)
- Membuat list yang berisi budget sebagai penampung object Budget yang sudah ditambahkan pada main.dart
- Membuat form dengan input-input sesuai permintaan soal pada tambah_budget.dart, serta tombol untuk menyimpan data
- Membuat function addBudget() yang akan dieksekusi ketika ingin menambahkan budget baru. Function tersebut akan membuat object Budget baru dan menambahkannya pada list Budget, kemudian menampilkan pop up berhasil menambahkan data
- Pada halaman data_budget.dart, ditambahkan suatu kolom untuk menampilkan data-data budget pada list. Data-data tersebut diiterasi dan ditampilkan menggunakan widget Material dan ListTile.

## Referensi
https://belajarflutter.com/memahami-navigasi-routing-di-flutter/
https://medium.com/flutter-community/flutter-push-pop-push-1bb718b13c31

# Tugas 9 PBP

## Questions

### **1. Apakah bisa mengambil data JSON tanpa membuat model terlebih dahulu?**

Bisa, kita dapat mengambil data JSON tanpa membuat model. Namun, data tersebut akan sulit ditampilkan atau diakses karena tidak diubah ke dalam bentuk class

### **2. Widget yang digunakan beserta fungsinya**

- FutureBuider: widget yang akan menampilkan konten sesuai dengan interaksi snapshot terakhir dengan class Future
- Column: widget yang menampilkan beberapa widget dalam 1 kolom
- Text: widget untuk menampilkan teks
- SizedBox: widget yang menampilkan kotak dengan ukuran tertentu (bisa pula digunakan sebagai penjarak antar-widget)
- InkWell: widget yang membuat suatu area dapat merespon ketika ditekan
- BoxDecoration: widget untuk menspesifikasi style atau dekorasi untuk sebuah kotak/container
- BoxShadow: widget untuk menambahkan bayangan pada kotak/container
- TextStyle: widget untuk menspesifikasikan style pada teks
- RichText: widget yang memungkinkan menampilkan teks dengan style yang berbeda-beda
- TextButton: widget button yang terdapat teks di dalamnya

### **3. Mekanisme pengambilan data dari JSON hingga dapat ditampilkan di Flutter**

- Menambah dependency http agar dapat mengirim request ke internet
- Membuat model yang bersesuaian dengan struktur JSON agar dapat mudah ditampilkan nantinya (opsional)
- Mengirim request HTTP Get untuk mendapatkan data JSON
- Data tersebut diparse atau didecode menjadi instance dari model yang dibuat sebelumnya
- Data yang telah didecode kemudian diproses oleh FutureBuilder untuk ditampilkan dalam aplikasi Flutter

### **4. Implementasi checklist**

- Menambah dependency http
- Membuat model WatchList berdasarkan data JSON dari heroku, memanfaatkan web https://app.quicktype.io/
- Struktur model yang didapat kemudian disimpan dalam watch_list.dart pada folder model
- Membuat halaman mywatchlist.dart untuk menampilkan daftar judul film pada watch list
- Membuat function fecthWatchList() yang berfungsi untuk mengambil data JSON dari link heroku dan di-decode menjadi list dari class WatchList
- Pada method build, body Scaffold diisi dengan widget FutureBuilder, dengan parameter future merupakan hasil pemanggilan fetchWatchList(). 
- Pada parameter builder di FutureBuilder, apabila hasil snapshot masih belum mendapatkan apa-apa, tampilan pada aplikasi akan terus loading. Apabila fetchWatchList sudah mengembalikan list of WatchList, barulah dibuat list yang masing-masing berisi judul film dari watchlist
- Masing-masing item list diwrap dalam Widget InkWell, yang apabila ditekan akan mengganti variabel global showedWatchList dan mengganti ke halaman detail
- Pada halaman detail, body Scaffold berisi container yang di dalamnya menampilkan informasi dari variabel global showedWatchList
- Ditambahkan juga button untuk kembali ke halaman sebelumnya