.MODEL SMALL
.CODE

ORG 100h

JMP Mulai

;Variabel
nama    DB 0dh, 0ah, 0dh, 0ah, "Masukan Nama Anda : ", '$'
id      DB 0dh, 0ah, "Masukan ID Anda : ", '$'
p1    DB "     PROGRAM BELI BARANG BEKAS", 0dh, 0ah, "-----------------------------------", '$' 
p2    DB 0dh, 0dh, 0dh, 0ah, 0dh, 0ah, "Selamat Datang DiBeli Barang Bekas.....", '$' 
p3    DB 0dh, 0ah, "Barang Yang tersedia saat ini : ", 0dh, 0ah 
        DB "==============================================================", 0dh, 0ah
        DB "=   1. gitar listirk merk gibson lesspaul       Rp.15.050.000", 0dh, 0ah
        DB "=   2. knalpot racing merk austin racing        Rp.775.000", 0dh, 0ah
        DB "=   3. set meja desktop gaming/kantor merk ikea Rp.989.000", 0dh, 0ah  
        DB "=   4. Amplifier multi efect merk MARSHALL      Rp.9.009.000" , 0dh, 0ah  
        DB "=   5. motor beat 2016 pajak hidup              Rp.11.500.000" , 0dh, 0ah  
        DB "==============================================================", 0dh, 0ah
        DB 0dh, 0ah, "Kode barang Yang Ingin Anda beli ? ", '$'
p4    DB 0dh, 0ah, "Silahkan lanjutkan ke proses pembayaran...", '$'
p5    DB 0dh, 0ah, "barang segera disiapkan oleh penjual, mohon tunggu, Terimakasih", '$'
p6    DB 0dh, 0ah, "Ingin Melakukan pembelian lainya ? (Y, N)", '$'
error   DB 0dh, 0ah, "Masukan Kode Dengan Benar", '$'
out1    DB 0dh, 0ah, 0dh, 0ah, "====== gitar listrik GIBSON ======", 0dh, 0ah,0dh, 0ah, "dengan harga Rp.15.050.000", 0dh, 0ah,0dh, 0ah, "silahkan melakukan pembayaran dengan transfer ke rekening dibawah", 0dh, 0ah,0dh, 0ah, "no rek  :348204******6" ,0dh, 0ah, '$'
out2    DB 0dh, 0ah, 0dh, 0ah, "====== Knalpot austin racing ======", 0dh, 0ah,0dh, 0ah, "dengan harga Rp. 775.000", 0dh, 0ah,0dh, 0ah, "silahkan melakukan pembayaran dengan transfer ke rekening dibawah", 0dh, 0ah,0dh, 0ah, "no rek  :348204******6 " ,0dh, 0ah, '$'
out3    DB 0dh, 0ah, 0dh, 0ah, "====== set meja desktop gaming/kantor ======", 0dh, 0ah,0dh, 0ah, "dengan harga Rp. 989.000", 0dh, 0ah,0dh, 0ah, "silahkan melakukan pembayaran dengan transfer ke rekening dibawah", 0dh, 0ah,0dh, 0ah, "no rek  :348204******6" ,0dh, 0ah, '$'
out4    DB 0dh, 0ah, 0dh, 0ah, "====== Amplifier multi efect merk MARSHALL======", 0dh, 0ah,0dh, 0ah, "dengan harga Rp. 9.009.000", 0dh, 0ah,0dh, 0ah, "silahkan melakukan pembayaran dengan transfer ke rekening dibawah", 0dh, 0ah,0dh, 0ah, "no rek  :348204******6" ,0dh, 0ah, '$'
out5    DB 0dh, 0ah, 0dh, 0ah, "====== motor beat 2016 pajak hidup ======", 0dh, 0ah,0dh, 0ah, "dengan harga Rp. 11.500.000", 0dh, 0ah,0dh, 0ah, "silahkan melakukan pembayaran dengan transfer ke rekening dibawah", 0dh, 0ah,0dh, 0ah, "no rek  :348204******6" ,0dh, 0ah, '$'

tampung_nama DB 30, ?, 30 dup(?)
tampung_id DB 30, ?, 30 dup(?)
        
        
Mulai:
    MOV ah, 09
    LEA dx, p1
    INT 21h
    
    MOV ah, 09
    LEA dx, nama
    INT 21h
    
    MOV ah, 0ah
    LEA dx, tampung_nama
    INT 21h
    PUSH dx
    
    MOV ah, 09
    LEA dx, id
    INT 21h
    
    MOV ah, 0ah
    LEA dx, tampung_id
    INT 21h
    PUSH dx
    
    MOV ah, 09
    LEA dx, p2
    INT 21h
    
Mulai2:
    MOV ah, 09
    LEA dx, p3
    INT 21h
    
Proses:
    MOV ah, 01
    INT 21h
    
    CMP al, '1'
    JE barang_1
    
    CMP al, '2'
    JE barang_2
    
    CMP al, '3'
    JE barang_3
    
    CMP al, '4'
    JE barang_4
    
    CMP al, '5'
    JE barang_5
    
    JNE input_error
    
Proses2:
    MOV ah, 09
    LEA dx, p6
    INT 21h
    MOV ah, 01
    INT 21h
    
    CMP al, 'Y'
    JE beli_lagi
    
    CMP al, 'y'
    JE beli_lagi
    
    CMP al, 'N'
    JE pembelian_selesai
    
    CMP al, 'n'
    JE pembelian_selesai
    
    JNE input_error

barang_1:
     MOV ah, 09
     LEA dx, p4
     INT 21h
     
     MOV ah, 09
     LEA dx, out1
     INT 21h   
     
     JMP Proses2
     
barang_2:
     MOV ah, 09
     LEA dx, p4
     INT 21h
     
     MOV ah, 09
     LEA dx, out2
     INT 21h   
     
     JMP Proses2

barang_3:
     MOV ah, 09
     LEA dx, p4
     INT 21h
     
     MOV ah, 09
     LEA dx, out3
     INT 21h   
     
     JMP Proses2 
     
barang_4:
     MOV ah, 09
     LEA dx, p4
     INT 21h
     
     MOV ah, 09
     LEA dx, out4
     INT 21h   
     
     JMP Proses2
     
barang_5:
     MOV ah, 09
     LEA dx, p4
     INT 21h
     
     MOV ah, 09
     LEA dx, out5
     INT 21h   
     
     JMP Proses2      

beli_lagi:
    JMP Mulai2

pembelian_selesai:
    MOV ah, 09
    LEA dx, p5
    INT 21h
    INT 20h
    JMP Exit

input_error:
    MOV ah, 09
    LEA dx, error
    INT 21h
    
    JMP Proses2

JMP Exit
Exit:
RET