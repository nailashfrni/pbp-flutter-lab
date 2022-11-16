# Tugas 7 PBP

## Questions

### **1. Stateless widget dan stateful widget**<br><br>

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

### **1. Perbedaan `Navigator.push` dan `Navigator.pushReplacement`**<br><br>



### **2. Widget yang digunakan beserta fungsinya**

- Scaffold: menerapkan struktur visual dari Material Design, di dalamnya terdapat banyak widget yang dapat digunakan seperti Drawer, SnackBar, dll.
- Column: menyusun beberapa widget children dalam bentuk kolom secara vertikal
- Text: menampilkan text atau string pada aplikasi
- Container: mengatur beberapa widget children, termasuk mengatur padding, margin, dsb.
- FloatingActionButton: button yang dapat memicu terjadinya event di aplikasi
- Icon: menampilkan icon di aplikasi

### **3. Jenis-jenis event pada Flutter**



### **4. Cara kerja Navigator dalam mengganti halaman aplikasi**



### **5. Implementasi checklist**



## Referensi