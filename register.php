<?php
header('Content-Type: application/json');
include 'db.php';

$name = $_POST['name'] ?? '';
$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';
$role = $_POST['role'] ?? '';

if (!$name || !$email || !$password || !$role) {
    echo json_encode(['status' => 'error', 'message' => 'All fields are required']);
    exit();
}

$passwordHash = password_hash($password, PASSWORD_DEFAULT);

// if the role matches input to the specific table
switch ($role) {
    case 'user': $table = 'users'; break;
    case 'admin': $table = 'admins'; break;
    case 'subadmin':$table = 'subadmins';break;
    default:
        echo json_encode(['status' => 'error', 'message' => 'Invalid role']);
        exit();
}

$sql = "INSERT INTO $table (name, email, password) VALUES (?, ?, ?)";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    echo json_encode(['status' => 'error', 'message' => 'Prepare failed: ' . $conn->error]);
    exit();
}

$stmt->bind_param("sss", $name, $email, $passwordHash);

if ($stmt->execute()) {
    echo json_encode(['status' => 'success', 'message' => 'User registered']);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Email already exists or other error']);
}
?>
