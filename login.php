<?php
header('Content-Type: application/json');
include 'db.php';

$email = $_POST['email'] ?? '';
$password = $_POST['password'] ?? '';
$role = $_POST['role'] ?? '';

if (!$email || !$password || !$role) {
    echo json_encode(['status' => 'error', 'message' => 'All fields are required']);
    exit();
}

switch ($role) {
    case 'user': $table = 'users'; break;
    case 'admin': $table = 'admins'; break;
    case 'subadmin': $table = 'subadmins'; break;
    default:
        echo json_encode(['status' => 'error', 'message' => 'Invalid role']);
        exit();
}

$sql = "SELECT * FROM $table WHERE email = ?";
$stmt = $conn->prepare($sql);

if (!$stmt) {
    echo json_encode(['status' => 'error', 'message' => 'Prepare failed: ' . $conn->error]);
    exit();
}

$stmt->bind_param("s", $email);
$stmt->execute();
$result = $stmt->get_result();

if ($user = $result->fetch_assoc()) {
    if (password_verify($password, $user['password'])) {
        // Remove password before returning user data
        unset($user['password']);
        echo json_encode(['status' => 'success', 'user' => $user, 'role' => $role]);
    } else {
        echo json_encode(['status' => 'error', 'message' => 'Invalid password']);
    }
} else {
    echo json_encode(['status' => 'error', 'message' => 'User not found']);
}
?>
