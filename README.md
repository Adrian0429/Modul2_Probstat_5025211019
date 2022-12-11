# Modul2_Probstat_5025211019
Praktikum modul 2 untuk mata kuliah Probabilitas dan Statistika dikerjakan oleh Adrian Karuna Soetikno NRP : 5025211019

</br> 

## Soal 1

Seorang peneliti melakukan penelitian mengenai pengaruh aktivitas 𝐴 terhadap kadar saturasi oksigen pada manusia. Peneliti tersebut mengambil sampel sebanyak 9 responden. Pertama, sebelum melakukan aktivitas 𝐴, peneliti mencatat kadar saturasi oksigen dari 9 responden tersebut. Kemudian, 9 responden tersebut diminta melakukan aktivitas 𝐴. Setelah 15 menit, peneliti tersebut mencatat kembali kadar saturasi oksigen dari 9 responden tersebut. Berikut data dari 9 responden mengenai kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas 𝐴 

| Responden | X | Y |
|----------|---|---|
| 1 | 78 | 100 |
| 2 | 75 | 95 |
| 3 | 67 | 70 |
| 4 | 77 | 90 |
| 5 | 70 | 90 |
| 6 | 72 | 90 |
| 7 | 78 | 89 |
| 8 | 74 | 90 |
| 9 | 77 | 100|

Berdasarkan data pada tabel diatas, diketahui kadar saturasi oksigen  dari responden ke-3 ketika belum melakukan aktivitas 𝐴 sebanyak 67, dan setelah melakukan aktivitas 𝐴 sebanyak 70.

--------------------------------------------------------------------------

### *Plotting data pada tabel*

```R
responden = c(seq(1:9))
X = c(78, 75, 67, 77, 70, 72, 78, 74, 77)
Y = c(100, 95, 70, 90, 90, 90, 89, 90, 100)
table = data.frame(responden, X, Y)
n = 9
```

### a)
-> Carilah Standar Deviasi dari data selisih pasangan pengamatan tabel diatas
---------
```R
dif = table$Y - table$X
cat("Standart Deviasi dari selisih pengamatan adalah = ")
SD = sd(dif)
SD
```
![image](https://user-images.githubusercontent.com/86884506/206897661-86ad222b-f5a4-4074-b2cd-7e71fefda0d6.png)

### b)
-----------
-> carilah nilai t (p-value)
```R
cat("nilai p value dapat dicari menggunakan t.test : ")
t.test(before, after, alternative = "greater", var.equal = FALSE)
```
![image](https://user-images.githubusercontent.com/86884506/206898143-43c14944-c3fd-46b7-a4c1-7ca6424d6d7b.png)

dari uji t.test didapatkan hasil t = 7.6525, derajat bebas/degree of freedom (df) = 8, dan p-value = 6.003e-05.

###  c)
----------
tentukanlah apakah terdapat pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴 jika diketahui tingkat signifikansi 𝛼 = 5% serta H0 : “tidak ada pengaruh yang signifikan secara statistika dalam hal kadar saturasi oksigen , sebelum dan sesudah melakukan aktivitas 𝐴”

*jawab*

berdasarkan hasil dari poin b, didapatkan nilai probabilitas (p-value) yaitu 6.003e-05. Dapat disimpulkan bahwa, nilai p-value lebih kecil dibandingkan tingkat signifikansi 𝛼=0,05, maka **null hypotesis ditolak dan alternative hypotesis diterima.** Hal ini berarti terdapat pengaruh pada jumlah kadar saturasi oksigen sebelum dan sesudah melakukan aktivitas A dengan tingkat signifikansi 5%.

</br>

## Soal 2 (Hipotesa 1 sampel)
Diketahui bahwa mobil dikemudikan rata-rata lebih dari 20.000 kilometer per tahun. Untuk menguji klaim ini, 100 pemilik mobil yang dipilih secara acak diminta untuk mencatat jarak yang mereka tempuh. Jika sampel acak menunjukkan rata-rata 23.500 kilometer dan standar deviasi 3900 kilometer. (Kerjakan menggunakan library seperti referensi pada modul). 

```R
install.packages("BSDA")
library(BSDA)
```

------------------------------------------------------------------------------
* Null hypotesis / H0 = miu <= 20.000
* Alternative hypotesis / H1 = miu > 20.000
* n >= 30, gunakan Z distribution


```R
zsum.test(mean.x=23500, sigma.x = 3900, n.x = 100,  
          alternative = "greater", mu = 20000,
          conf.level = 0.95)
```
![image](https://user-images.githubusercontent.com/86884506/206899872-71778851-9c6b-481c-93f3-119c74a20f39.png)
-----------------------------------------------------------------------------

### a) 
Apakah Anda setuju dengan klaim tersebut?
----------
*Setuju*, rata-rata mobil dikemudikan lebih dari 20.000 km pertahunnya.

### b) 
Jelaskan maksud dari output yang dihasilkan! 
--------
setelah dilakukan uji Z menggunakan data mean, SD, dan jumlah sampel. Maka didapatkan hasil berupa z = 8.9744, p-value < 2.2e-16 atau p-value < 2.2e-16 atau p-value = p(z > 8.97) = 1-p(z < 8.97) = 0. Maka null hypotesis (H0) salah.

### c)
Buatlah kesimpulan berdasarkan P-Value yang dihasilkan!
-------
P-value dari uji tes z adalah 2.2e-16 atau mendekati 0, dari hasil p-value tersebut Null Hipotesis (H0) dapat ditolak dan H1 diterima.


## Soal 3
Diketahui perusahaan memiliki seorang data analyst ingin memecahkan permasalahan pengambilan keputusan dalam perusahaan tersebut. Selanjutnya didapatkanlah data berikut dari perusahaan saham tersebut.
-----------------------------------------------------------------------------

|     Nama Kota/Atribut     | Bandung | Bali |
|---------------------------|---------|------|
| Jumlah Saham              |   19    |  27  |
| Sampel Mean               |   3.64  | 2.79 |
| Sampel Standar Deviasi    |   1.67  | 1.32 |

Dari data diatas berilah keputusan serta kesimpulan yang didapatkan dari hasil diatas. Asumsikan nilai variancenya sama, apakah ada perbedaan pada rata-ratanya (α= 0.05)? Buatlah :

### a)
H0 dan H1(3)
----
Berdasarkan deskripsi dan data yang terlampir, maka dapat disusun hipotesis H0 dan H1 sebagai berikut.

* H0 : μ1 = μ2 (rata-rata saham di Bandung sama dengan di Bali)
* H1 : μ1 ≠ μ2 (rata-rata saham di Bandung tidak sama dengan di Bali)

### b) 
Hitung Sampel Statistik(3)
----
```R
tsum.test(mean.x = 3.63, s.x = 1.67, n.x = 19,
          mean.y = 2.79, s.y = 1.32, n.y = 27,
          alternative = "greater", var.equal = TRUE, conf.level = 0.90)
```

  ![image](https://user-images.githubusercontent.com/86884506/206902035-f41a7cce-43fb-42e7-9a5e-c77d84f029ac.png)

### c)
Lakukan Uji Statistik (df = 2)(5)
----
Sebelum melakukan uji statistik, maka diperlukan instalasi modul mosaic
```R
install.packages("mosaic")
library(mosaic)
```
lalu dijalankan program : 
```R
plotDist(dist = 't', df = 2, col = "blue")
```

![3C](https://user-images.githubusercontent.com/86884506/206902547-f4f586b9-9630-4122-b63f-5f470bb408b3.png)

### d) 
Nilai Kritikal (3)
----
untuk mencari nilai kritikal, dapat digunakan fungsi chi-squared, dimana lower tail nya adalah false.
```R
qchisq(p = 0.05, df = 2, lower.tail=FALSE)
```

![image](https://user-images.githubusercontent.com/86884506/206902681-50cd5706-0a62-4891-ba27-dbfeb9697300.png)

### e)
Keputusan(3)
----
Dari hasil t-test didapatkan p-value = 0.03024, berada dibawah 0.05. Maka null hypotesis / H0 ditolak.

### f) 
Kesimpulan 
----
Kesimpulannya terdapat perbedaan antara rata-rata saham bandung dengan rata-rata saham bali.


