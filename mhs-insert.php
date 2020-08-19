<?php
include "koneksi.php";

$nim  = trim($_POST[nim]);
$nama  = trim($_POST[nama]);
$jenis_kelamin = trim($_POST[jenis_kelamin]);
$kode_mk  = trim($_POST[kode_mk]);
$kode_matkul  = trim($_POST[kode_matkul]);

$cek = mysql_num_rows(mysql_query("SELECT * FROM data_mahasiswa WHERE nim='$nim' "));
if ($cek == 0)
{
 $sql = "INSERT INTO mahasiswa (nim, nama, jenis_kelamin, kode_mk, kode_matkul) VALUES 
    ('$nim', '$nama', '$jenis_kelamin', '$kode_mk', '$kode_matkul') ";
 mysql_query($sql);
 $pesan = "Data berhasil tersimpan";
}
else { $pesan = "Maaf NIM telah terdaftar"; }
?>
<script>
 alert('<?php echo $pesan;?>');
 location='index.php?p=mahasiswa';
</script>