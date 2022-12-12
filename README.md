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

## Soal 4
**(Anova satu arah)** Seorang Peneliti sedang meneliti spesies dari kucing di ITS . Dalam penelitiannya ia mengumpulkan data  tiga spesies kucing yaitu kucing oren, kucing hitam dan kucing putih dengan panjangnya masing-masing. 
Jika : 
* diketahui dataset  https://intip.in/datasetprobstat1 
* H0 : Tidak ada perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama  
Maka buatlah : 
---------------------------------------------------------------------------------------------------------------------
### a) 
Buatlah masing masing jenis spesies menjadi  3 subjek "Grup" (grup 1,grup 2,grup 3). Lalu Gambarkan plot kuantil normal untuk setiap kelompok dan lihat apakah ada outlier utama dalam homogenitas varians.
----
Karena setiap **grup nya berdistribusi normal maka tidak ada outlier utama.** Untuk membuat grup tiap jenis nya, bisa menggunakan factor kemudian memberikan label dan subset setiap grup. Group1 adalah kucing oren, Group2 adalah kucing hitam dan Group3 adalah kucing putih.


```R
ANOVA4 = read.table("onewayanova.txt",h=T)
ANOVA4    

# set group ->  Faktor
ANOVA4$Group <- as.factor(ANOVA4$Group)

# labelling
ANOVA4$Group = factor(ANOVA4$Group,labels = c("kucing oren", "kucing hitam", "kucing putih"))

Group1 <- subset(ANOVA4, Group == "kucing oren")
Group2 <- subset(ANOVA4, Group == "kucing hitam")
Group3 <- subset(ANOVA4, Group == "kucing putih")
```

kemudian digambarkan plot kuantil normal pada tiap grup

```R
qqnorm(Group1$Length)
qqline(Group1$Length)
```
![QQPlot1](https://user-images.githubusercontent.com/86884506/206993020-19f1ac90-ffa9-438b-b6f1-cc08949a6df2.png)

```R
qqnorm(Group2$Length)
qqline(Group2$Length)
```
![QQ plot 2](https://user-images.githubusercontent.com/86884506/206993158-90d22b2b-fef4-441e-a2fe-114a78e4a0de.png)

```R
qqnorm(Group3$Length)
qqline(Group3$Length)
```
![QQ plot 3](https://user-images.githubusercontent.com/86884506/206993245-73fce8d6-4a9e-4d06-bd0e-5a630a1c1d24.png)
  
### b)
carilah atau periksalah Homogeneity of variances nya , Berapa nilai p yang didapatkan? , Apa hipotesis dan kesimpulan yang dapat diambil ?
----
Homogenity of Variances dapat dicek dengan fungsi berikut : 
```R
bartlett.test(Length ~ Group, data = ANOVA4)
```
![image](https://user-images.githubusercontent.com/86884506/206993877-3a7baf93-a330-417c-a2ca-e0b413c5c60e.png)

Didapatkan p-value sebesar 0.8054, p-value berada diatas 0.05 yang artinya varians dari ketiga kelompok sama dan kesimpulannya terdapat homogenitas varians untuk melakukan anova satu arah (one way).

### c)
Untuk uji ANOVA, buatlah model linier dengan Panjang versus Grup dan beri nama model tersebut model 1.
----
```R
model1 = lm(Length ~ Group, data = ANOVA4)
anova(model1)
```
![image](https://user-images.githubusercontent.com/86884506/206995142-5bbbed2c-4832-4d43-bb1f-d25a3a1232e7.png)

### d)
Dari Hasil Poin C , Berapakah nilai-p ? ,  Apa yang dapat Anda simpulkan dari H0?
----
Didapatkan p adalah 0.0013, yang berarti nilai P-value lebih kecil dari 0.05. Kesimpulannya kita menolak null hypotesis (H0), maka menunjukkan adanya perbedaan panjang antara ketiga spesies atau rata-rata panjangnya sama.

### e) 
Verifikasilah jawaban model 1 dengan Post-hooc test TukeyHSD ,  dari nilai p yang didapatkan apakah satu jenis kucing lebih panjang dari yang lain? Jelaskan.
----
```R
TukeyHSD(aov(model1))
```
![image](https://user-images.githubusercontent.com/86884506/206995818-4cd69572-7d6d-4258-97ef-1693c878a8d1.png)

Dari hasil diatas dapat diketahui p-value tiap 2 jenis grup. Jika p-value lebih kecil dari 0.05, maka panjang kedua grup berbeda, jika p-value lebih dari 0.05 maka panjangnya sama. Maka berdasarkan hasil diatas dapat disimpulkan kucing putih dan kucing oren memiliki ukuran atau panjang yang sama.


### f) 
Visualisasikan data dengan ggplot2
----
```R
#import library ggplot
library("ggplot2")
ggplot(ANOVA4, aes(x = Group, y = Length)) +
geom_boxplot(color = c("#00AFBB", "#E7B800", "#FC4E07"), fill = "green") +
scale_x_discrete() + xlab("Group") + ylab("Length (cm)")
```


## Soal 5
**(Anova dua arah)** Data yang digunakan merupakan hasil eksperimen yang dilakukan untuk mengetahui pengaruh suhu operasi (100˚C, 125˚C dan 150˚C) dan tiga jenis kaca pelat muka (A, B dan C) pada keluaran cahaya tabung osiloskop. Percobaan dilakukan sebanyak 27 kali dan didapat data sebagai berikut: Data Hasil Eksperimen. Dengan data tersebut: 
---------------------------------------------------------------------------------------------------------------------
### a)
Buatlah plot sederhana untuk visualisasi data 
----
digunakan beberapa library untuk membaca file csv
```R
install.packages("multcompView")
library(readr)
library(ggplot2)
library(multcompView)
library(dplyr)
```

input dataset soal
```R
GlassData = read_csv("GTL.csv")
head(GlassData)
```
![image](https://user-images.githubusercontent.com/86884506/207001312-4af3848b-7225-4a5f-a112-688d0abf8e11.png)

Observasi struktur dataset
```R
str(GlassData)
```
![image](https://user-images.githubusercontent.com/86884506/207001621-d3a42f6e-abd5-4ad0-8b0d-10f84a321c41.png)

Plotting tabel 
```R
qplot(x = Temp, y = Light, geom = "point", data = GTL) + 
  facet_grid(.~Glass, labeller = label_both)
```

  ![Plot 5](https://user-images.githubusercontent.com/86884506/207002038-258ae9c8-2528-4ea6-914f-db1fa0bf17a4.png)

### b)
Lakukan uji ANOVA dua arah untuk 2 faktor
----
```
GlassData$Glass = as.factor(GlassData$Glass)
GlassData$Temp = as.factor(GlassData$Temp)

anova = aov(Light ~ Glass*Temp, data = GlassData)
summary(anova)
```
![image](https://user-images.githubusercontent.com/86884506/207002695-1dec9b10-cf4b-43c3-b036-5a2d9f3c4cff.png)

### c)
Tampilkan tabel dengan mean dan standar deviasi keluaran cahaya untuk setiap perlakuan (kombinasi kaca pelat muka dan suhu operasi)
----
```R
data_summary = group_by(GlassData, Glass, Temp) %>%
  summarise(mean = mean(Light), sd = sd(Light)) %>%
  arrange(desc(mean))
print(data_summary)
```
![image](https://user-images.githubusercontent.com/86884506/207003526-362b7845-3c8b-4f49-a2eb-7d074eb2593e.png)

### d)
Lakukan uji Tukey
----
```R
tukey = TukeyHSD(anova)
print(tukey)
```

![image](https://user-images.githubusercontent.com/86884506/207004600-7f191f3f-c90a-42a6-a667-cc21acfcd2d7.png)

![image](https://user-images.githubusercontent.com/86884506/207004697-f71c29ff-a482-4919-87cf-4dc6d9fa0af9.png)

### e)
Gunakan compact letter display untuk menunjukkan perbedaan signifikan antara uji Anova dan uji Tukey
----
membuat Compact Letter Display
```R
tukey.CLD = multcompLetters4(anova, tukey)
print(tukey.CLD)
```
![image](https://user-images.githubusercontent.com/86884506/207005211-1004cc29-76fd-4e6c-b04f-e080bbc733ec.png)

tambahkan Compact Letter Display ke tabel sebelumnya
```R
cld = as.data.frame.list(tukey.cld$`Glass:Temp_Factor`)
dataSum$Tukey <- cld$Letters
print(dataSum)
```
![image](https://user-images.githubusercontent.com/86884506/207009191-1579091d-ceb8-475f-852a-36c924810e4e.png)
