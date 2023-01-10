.model small
.code
org 100h
start:
	jmp mulai
nama	  db 13,10,'Nama Anda	: $'
nim	  db 13,10,'NIM	: $'
lanjut  db 13,10,'LANJUT Tekan y untuk lanjut >>>>>>>>>>>>> $'
tampung_nama  db 30,?,30 dup(?)
tampung_nim   db 13,?,13 dup(?)

a db 01
b db 02
c db 03
j dw 15

daftar  db 13,10,'+-----------------------------------------------+'
	 db 13,10,'|	      DAFTAR FASILITAS KAMPUS               |'
	 db 13,10,'+---+--------------------------------------+-----+'
	 db 13,10,'|N0 |       Jenis       |   Hari |     Jam       |'
 	 db 13,10,'+---+-------------------+----------------+-------+'
	 db 13,10,'|01 |    RUANGAN LAB    | 1 HARI | 10.00 - 13.00 |'
	 db 13,10,'+---+-------------------+----------------+-------+'
	 db 13,10,'|02 |    PC             | 1 HARI | 10.00 - 13.00 |'
	 db 13,10,'+---+-------------------+----------------+-----+--'
	 db 13,10,'|03 |    TABLET         | 1 HARI | 10.00 - 13.00 |','$'



error	    db 13,10,'KODE YANG ANDA MASUKKAN SALAH $'
pilih_tkt  db 13,10,'Silahkan Masukkan No/Kode Yang Anda Pilih: $'
Success    db 13,10,'Selamat Anda Berhasil $'

	 mulai:
	 mov ah,09h
	 lea dx,nama
	 int 21h
	 mov ah,0ah
	 lea dx,tampung_nama
	 int 21h
	 push dx

	 mov ah,09h
	 lea dx,nim
	 int 21h
	 mov ah,0ah
	 lea dx,tampung_nim
	 int 21h
	 push dx

	 mov ah,09h
	 mov dx,offset daftar
	 int 21h
	 mov ah,09h
	 mov dx,offset lanjut
	 int 21h
	 mov ah,01h
	 int 21h
	 mov ah,01h
	 int 21h
	 cmp al,'y'
	 jmp proses
	 jne error_msg

error_msg:
	  mov ah,09h
	  mov dx,offset error
	  int 21h
	  int 20h

proses:
	 mov ah,09h
	 mov dx,offset pilih_tkt
	 int 21h

	 mov ah,1
	 int 21h
	 mov bh,al
	 mov ah,1
	 int 21h
	 mov bl,al
	 cmp bh,'0'
	 cmp bl,'1'
	 je hasil1

	 cmp bh,'0'
	 cmp bl,'2'
	 je hasil2

	 cmp bh,'0'
	 cmp bl,'3'
	 je hasil3

	 jne error_msg

;-----------------------------------------------

hasil1:
	 mov ah,09h
	 lea dx, teks1
	 int 21h
	 int 20h

hasil2:
	 mov ah,09h
	 lea dx, teks2
	 int 21h
	 int 20h

hasil3:
	 mov ah,09h
	 lea dx, teks3
	 int 21h
	 int 20h


;-----------------------------------------------

teks1	 db 13,10,'Anda Memilih RUANGAN LAB 1 HARI JAM 10.00 - 13.00'
	 db 13,10,'Terima Kasih $'

teks2	 db 13,10,'Anda Memilih PC 1 HARI JAM 10.00 - 13.00'
	 db 13,10,'Terima Kasih $'

teks3	 db 13,10,'Anda Memilih TABLET 1 HARI JAM 10.00 - 13.00'
	 db 13,10,'Terima Kasih $'
	int 20h
end start
