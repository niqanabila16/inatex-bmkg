<?php
defined('BASEPATH') OR exit('No direct script access allowed');


class DummySeeder extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->database(); // ✅ Ini yang penting
    }

    public function index()
    {
        // Insert Roles
        $roles = [
            ['role_id' => 1, 'name' => 'GeneralUser'],
            ['role_id' => 2, 'name' => 'GovernmentUser'],
            ['role_id' => 3, 'name' => 'Instructor'],
            ['role_id' => 4, 'name' => 'Admin']
        ];
        $this->db->insert_batch('roles', $roles);

        // Insert Regions
        $regions = [
            ['region_id' => 1, 'name' => 'Jakarta'],
            ['region_id' => 2, 'name' => 'Bandung']
        ];
        $this->db->insert_batch('regions', $regions);

        // Insert Users
        $users = [
            [
                'user_id' => 1,
                'first_name' => 'Alice',
                'last_name' => 'Anderson',
                'username' => 'alice01',
                'email' => 'alice@example.com',
                'password' => password_hash('password', PASSWORD_DEFAULT),
                'role_id' => 1,
                'is_verified' => true,
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s'),
                'region_id' => 1
            ],
            [
                'user_id' => 2,
                'first_name' => 'Bob',
                'last_name' => 'Brown',
                'username' => 'bobgov',
                'email' => 'bob@gov.id',
                'password' => password_hash('password', PASSWORD_DEFAULT),
                'role_id' => 2,
                'is_verified' => true,
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s'),
                'region_id' => 2
            ],
            [
                'user_id' => 3,
                'first_name' => 'Charlie',
                'last_name' => 'Clark',
                'username' => 'charlieins',
                'email' => 'charlie@edu.id',
                'password' => password_hash('password', PASSWORD_DEFAULT),
                'role_id' => 3,
                'is_verified' => true,
                'created_at' => date('Y-m-d H:i:s'),
                'updated_at' => date('Y-m-d H:i:s'),
                'region_id' => 1
            ]
        ];
        $this->db->insert_batch('users', $users);

        // Insert Courses
        $courses = [
            [
                'course_id' => 1,
                'title' => 'Intro to Mitigation',
                'short_description' => 'Basic earthquake awareness',
                'long_description' => 'Full course on earthquakes',
                'outcomes' => 'Understand earthquakes',
                'language' => 'English',
                'requirements' => 'None',
                'creator_id' => 1,
                'type_course' => 'general',
                'price' => 0.00,
                'region_id' => 1
            ]
        ];
        $this->db->insert_batch('courses', $courses);

        // Insert Sections
        $sections = [
            ['section_id' => 1, 'course_id' => 1, 'title' => 'Section 1', 'position' => 1]
        ];
        $this->db->insert_batch('sections', $sections);

        // Insert Lessons with YouTube content URLs
        $lessons = [
            [
                'lesson_id' => 1,
                'section_id' => 1,
                'title' => 'Earthquake Awareness Video',
                'content_type' => 'video',
                'content_url' => 'https://www.youtube.com/embed/vlKrdpwpP9o?si=esQPldAL-ZELCsvy',
                'position' => 1
            ],
            [
                'lesson_id' => 2,
                'section_id' => 1,
                'title' => 'Tsunami Awareness Video',
                'content_type' => 'video',
                'content_url' => 'https://www.youtube.com/embed/OdSzcafb8L0?si=cE_StkUnvQYw8Tri',
                'position' => 2
            ]
        ];
        $this->db->insert_batch('lessons', $lessons);

        echo "✅ Dummy data inserted successfully.";
    }
}
