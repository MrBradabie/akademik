<h2>Tambah Data Mahasiswa</h2>
<hr>
<form action="mhs-insert.php" method="post">
<table border="0" width="100%">
<tr>
 <td width="120">NIM</td>
 <td>: <input type="text" name="nim" required></td>
</tr>
<tr>
 <td width="120">Nama Lengkap</td>
 <td>: <input type="text" name="nama" required></td>
</tr>
<tr>
 <td width="120">Jenis Kelaminr</td>
 <td>: <input type="radio" name="jenis_kelamin" value="L" checked> Laki-laki 
    <input type="radio" name="jenis_kelamin" value="P"> Perempuan 
 </td>
</tr>
<tr>
 <td width="120">Matkul</td>
 <td>: <select name="kode_mk">
    <?php
    $q=mysql_query("SELECT * FROM matkul");
    while($d=mysql_fetch_array($q))
    {
     echo "<option value='$d[kode_mk]'> $d[nama_matkul] </option>";
    }
    ?>
    </select>
 </td>
</tr>
<tr>
 <td width="120">Perkuliahan</td>
 <td>: <select name="kode_matkul">
    <?php
    $q=mysql_query("SELECT * FROM perkuliahan");
    while($d=mysql_fetch_array($q))
    {
     echo "<option value='$d[kode_matkul]'> $d[nilai] </option>";
    }
    ?>
    </select>
 </td>
</tr>
<tr>
 <td width="120"></td>
 <td>&nbsp; <input type="submit" value="Simpan Data"></td>
</tr>
</table>
</form>