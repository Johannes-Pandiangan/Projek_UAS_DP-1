program PesanTiketKonser;
uses crt;

type konser = record //record untuk mengunmpulkan data pesanan
    Nama: string;
    Jenis: string;
    Harga: longint;
    Jumlah: longint;
    TotalHarga: longint;
  end;

var
  tiket: array[1..10] of konser;  // Array untuk menyimpan hingga 10 tiket
  JumlahTiket, TotalJumlahTiket: longint;
  Harga : longint;
  Ulang: char;

function TentukanHarga(JenisTiket: string): longint; //fungsi untuk menentukan harga setiap jenis tiket
begin
  case JenisTiket of
    '1': TentukanHarga := 1500000; // harga tiket untuk jenis VVIP
    '2': TentukanHarga := 1000000; // harga tiket untuk jenis VIP
    '3': TentukanHarga := 500000;  // harga tiket untuk jenis Regular
    '4': TentukanHarga := 250000;  // harga tiket untuk jenis Economy 
  else
    TentukanHarga := 0; //jika pilihan tidak valid
  end;
end;

procedure PilihTiket(var T: konser); //prosedur untuk memilih jenis tiket
begin
  write('Masukkan nama Anda: ');
  readln(T.Nama);
  writeln('Pilih jenis tiket:');
  writeln('1. VVIP    : 1.500.000');
  writeln('2. VIP     : 1.000.000'); 
  writeln('3. Regular : 500.000');
  writeln('4. Economy : 250.000');
  write('Masukkan pilihan tiket (1/2/3/4): ');
  readln(T.Jenis);
  T.Harga := TentukanHarga(T.Jenis); //memanggil prosedur
  
  case T.Jenis of  //untuk menyimpan nama tiket sesuai inputan user
    '1': T.Jenis := 'VVIP';
    '2': T.Jenis := 'VIP';
    '3': T.Jenis := 'Regular';
    '4': T.Jenis := 'Economy';
  else
    writeln('Pilihan tidak valid.'); //jika memasukkan diluar dari 1-4
    halt; //keluar dari program
  end;

  write('Masukkan jumlah tiket yang ingin dibeli: ');
  readln(T.Jumlah); 
  T.TotalHarga := T.Harga * T.Jumlah; //menghitung total harga tiket dan jumlahnya
end;

procedure TampilkanRincianTiket(const T: konser); //prosedur untuk output rincian pesanan dari 1 user saja 
begin
  writeln('Nama         : ', T.Nama);
  writeln('Jenis Tiket  : ', T.Jenis);
  writeln('Harga Tiket  : Rp.', T.Harga);
  writeln('Jumlah Tiket : ', T.Jumlah);
  writeln('Total Harga  : Rp.', T.TotalHarga);
end;

procedure TampilkanSemuaTiket; //prosedur untuk output keseluruhan rincian tiket dari semua data user 
var
  i: Integer;
  TotalSeluruh: longint;
begin
  writeln;
  writeln('=== Rincian Semua Tiket ===');
  TotalSeluruh := 0;
  for i := 1 to JumlahTiket do
  begin
    writeln('Pemesanan tiket ke-', i, ':');
    TampilkanRincianTiket(tiket[i]); //memanggil prosedur
    writeln;
    TotalSeluruh := TotalSeluruh + tiket[i].TotalHarga;
  end;
  writeln('Jumlah Tiket yang dipesan: ', TotalJumlahTiket);
  writeln('Total Harga Seluruh Tiket: Rp.', TotalSeluruh);
end;

begin //main program
  clrscr;
  writeln('=== Program Pemesanan Tiket Konser ===');
  writeln;
  JumlahTiket := 0; 
  TotalJumlahTiket := 0;
  repeat //perulangan jika user ingin menambah pesanan tiket
    JumlahTiket:=JumlahTiket+1;
    writeln('Pesan Tiket ke-', JumlahTiket);
    PilihTiket(tiket[JumlahTiket]); //memanggil prosedur
    TotalJumlahTiket := TotalJumlahTiket + tiket[JumlahTiket].Jumlah; //menghitung total jumlah tiket keseluruhan

    if JumlahTiket < 10 then //operasi kondisi untuk membatasi pesanan agar tidak lebih dari 10
    begin
      write('Apakah Anda ingin memesan tiket lagi? (y/n): ');
      readln(Ulang);
    end;
  until (Ulang <> 'y') or (JumlahTiket = 10); //pesan ulang jika user ingin tambah pesanan
  
  TampilkanSemuaTiket; //memanggil prosedur 
  writeln('Terima kasih telah memesan tiket! Selamat menikmati konser.');
  readln;
end.
