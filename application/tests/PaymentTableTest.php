<?php
// Bootstrap CodeIgniter
define('ENVIRONMENT', 'testing');
require_once __DIR__ . '/../../index.php'; // atau sesuaikan dengan path index.php kamu

use PHPUnit\Framework\TestCase;

class PaymentTableTest extends TestCase
{
    public function testPaymentTableIsEmptyOrNotExists()
    {
        $CI =& get_instance();
        $CI->load->database();

        // Check if the table exists
        $tables = $CI->db->list_tables();
        $this->assertNotContains('payment', $tables, 'The payment table still exists in the database.');
    }
}