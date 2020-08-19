<?php

$act = isset($_GET['act'])?$_GET['act']:'';
if($act == "tambah") { include "mhs-tambah.php"; }
else if($act == "edit") { include "mhs-edit.php"; }
else {
?>
<h2>Daftar Data Mahasiswa </h2>
<hr>
<a href="index.php?p=mahasiswa&act=tambah">Tambah Data</a>
<hr>
<table width="100%" cellpadding="4" cellspacing="1" bgcolor="#ccc">
<tr>
 <th bgcolor="#eee" width="100">NIM</th>
 <th bgcolor="#eee">Nama</th>
 <th bgcolor="#eee" width="100">Tanggal Lahir</th>
 <th bgcolor="#eee" width="120">Alamat</th>
 <th bgcolor="#eee" width="120">Jenis Kelamin</th>
 <th bgcolor="#eee" width="120">Matkul</th>
 <th bgcolor="#eee" width="50">Edit</th>
 <th bgcolor="#eee" width="50">Hapus</th>
</tr>
<?php
$sql   = "SELECT data_mahasiswa.*,  FROM data_mahasiswa
   LEFT JOIN matkul ON data_mahasiswa.nim=data_mahasiswa_nama
   LEFT JOIN kelas ON data_mahasiswa.nim = data_mahasiswa.jenis_kelamin ORDER BY nim ASC";
$query = mysqli_query($sql);
$total = mysqli_num_rows($query);

$no = 1;
while ($data=mysqli_fetch_array($query))
{
 if($data[jenis_kelamin] == "L") { $jenis_kelamin = "Laki-laki";}
  else { $jenis_kelamin = "Perempuan";}

 echo "<tr>
   <td bgcolor='#fff'>$data[nim]</td>
   <td bgcolor='#fff'>$data[nama]</td>
   <td bgcolor='#fff'>$data[tanggal_lahir]</td>
   <td bgcolor='#fff'>$alamat</td>
   <td bgcolor='#fff'>$data[jenis_kelamin]</td>
   <td bgcolor='#fff'>$data[matkul]</td>
   <td bgcolor='#fff'>
   <a href='index.php?p=data_mahasiswa&act=edit&nim=$data[nim]'>Edit</a>
   </td>
   <td bgcolor='#fff'>
   <a href='mhs-delete.php?nim=$data[nim]'>Hapus</a>
   </td>
    </tr>	";
$no++;
}
?>
<tr>
 <td colspan=8 bgcolor="#999" style="color: #fff;" >
  Total : <?php echo "$total Data"?>
 </td>
</tr>
</table>
<?php
} 
?>