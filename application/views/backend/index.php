<?php
    $system_name = $this->db->get_where('settings' , array('key'=>'system_name'))->row()->value;
    $system_title = $this->db->get_where('settings' , array('key'=>'system_title'))->row()->value;
    $user_details = $this->user_model->get_all_user($this->session->userdata('user_id'))->row_array();
    $text_align     = $this->db->get_where('settings', array('key' => 'text_align'))->row()->value;
    $logged_in_user_role = strtolower($this->session->userdata('role'));
?>
<!DOCTYPE html>
<html>
<head>
    <title><?php echo get_phrase($page_title); ?> | <?php echo $system_title; ?></title>
    <!-- all the meta tags -->
    <?php include 'metas.php'; ?>
    <!-- all the css files -->
    <?php include 'includes_top.php'; ?>

    <!-- Leaflet library -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js" integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
</head>

<body data-layout="detached">
    <!-- HEADER -->
    <?php include 'header.php'; ?>
    <div class="container-fluid">
        <div class="wrapper">
            <!-- BEGIN CONTENT -->
            <!-- SIDEBAR -->
            <?php include $logged_in_user_role.'/'.'navigation.php' ?>
            <!-- PAGE CONTAINER-->
            <div class="content-page">
                <div class="content">
                    <!-- BEGIN PlACE PAGE CONTENT HERE -->
                    <?php include $logged_in_user_role.'/'.$page_name.'.php';?>
                    <!-- END PLACE PAGE CONTENT HERE -->
                </div>
            </div>
            <!-- END CONTENT -->
        </div>
    </div>
    <!-- all the js files -->
    <?php include 'includes_bottom.php'; ?>
    <?php include 'modal.php'; ?>
    <?php include 'common_scripts.php'; ?>
</body>

<!--
Ingat! ID peta kita adalah `slg-map`.
Kalau mau ganti ID, ganti juga yang di `\application\views\backend\admin\dashboard.php`.
-->
<style>#slg-map { height: 180px; }</style>
<script>
    var map = L.map('slg-map').setView([0, 120], 4);

    // Wajib dibaca buat pengguna OpenStreetMap:
    // https://operations.osmfoundation.org/policies/tiles/
    L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 64,
        attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
    }).addTo(map);

    // Contoh pin lokasi (bisa buat penanda lokasi SLG).
    // Nanti kalau ikon kastemnya sudah ada, bisa diset sesuai
    // `https://leafletjs.com/examples/custom-icons/`.
    const locations = [
        {year: 2025, location: [0, 120]}, 
        {year: 2025, location: [6, 120]}, 
        {year: 2025, location: [6, 126]}, 
        {year: 2024, location: [0, 126]}, 
        {year: 2024, location: [-6, 126]}, 
        {year: 2024, location: [-6, 120]},
        {year: 2023, location: [-6, 114]}, 
        {year: 2023, location: [0, 114]}, 
        {year: 2023, location: [6, 114]}
    ];
    var year = $('#year').find(":selected").val();
    locations.filter(n => year === "all" ? true : n.year === Number(year)
    ).map(n => n.location).forEach(n => {
        L.marker(n)
        .bindPopup("<b>Judul</b><br>Menunggu metadata…")
        .addTo(map);
    });
</script>
</html>
