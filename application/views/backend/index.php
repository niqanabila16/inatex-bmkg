<?php
$system_name = $this->db->get_where('settings', array('key' => 'system_name'))->row()->value;
$system_title = $this->db->get_where('settings', array('key' => 'system_title'))->row()->value;
$user_details = $this->user_model->get_all_user($this->session->userdata('user_id'))->row_array();
$text_align = $this->db->get_where('settings', array('key' => 'text_align'))->row()->value;
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
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css"
        integrity="sha256-p4NxAoJBhIIN+hmNHrzRCf9tD/miZyoHS5obTRR9BMY=" crossorigin="" />
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"
        integrity="sha256-20nQCchB9co0qIjJZRGuk2/Z9VM+kNiyxNV1lvTlZBo=" crossorigin=""></script>
</head>

<body data-layout="detached">
    <!-- HEADER -->
    <?php include 'header.php'; ?>
    <div class="container-fluid">
        <div class="wrapper">
            <!-- BEGIN CONTENT -->
            <!-- SIDEBAR -->
            <?php include $logged_in_user_role . '/' . 'navigation.php' ?>
            <!-- PAGE CONTAINER-->
            <div class="content-page">
                <div class="content">
                    <!-- BEGIN PlACE PAGE CONTENT HERE -->
                    <?php include $logged_in_user_role . '/' . $page_name . '.php'; ?>
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
<style>
    #slg-map {
        height: 180px;
    }
</style>
<script type="text/javascript">
    $(document).ready(function () {
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
        const locationsCon = JSON.parse('<?= $locations ?>');
        const locationsVie = locationsCon.map(n => {
            return {
                year: n.year,
                location: L
                    .marker(n.location)
                    .bindPopup("<b>Judul</b><br>Menunggu metadata… ")
                    .addTo(map)
            }
        });
        
        $('#year_vie').on('change', function () {
            var year = $("#year_vie option:selected").val();
            if (year != "all") {
                locationsVie.forEach(n => {
                    if (n.year != Number(year)) n.location.remove()
                });
                while (locationsVie.some((n) => n.year != Number(year))) {
                    locationsVie.splice(locationsVie.findIndex((n) => n.year != Number(year)), 1);
                }
                if (locationsVie.length === 0) locationsCon.forEach(n => {
                    if (n.year === Number(year)) locationsVie.push({
                        year: n.year,
                        location: L
                            .marker(n.location)
                            .bindPopup("<b>Judul</b><br>Menunggu metadata… ")
                            .addTo(map)
                    })
                })
            } else locationsCon.forEach(n => {
                if (n.year != locationsVie[0].year) locationsVie.push({
                    year: n.year,
                    location: L
                        .marker(n.location)
                        .bindPopup("<b>Judul</b><br>Menunggu metadata… ")
                        .addTo(map)
                })
            })
        });
    });

</script>

</html>