<?php 

include 'db.php';

if (!isset($_GET['id'])) {
    echo json_encode(["status" => "error", "message" => "User ID is required"]);
    exit;
}

$user_id = intval($_GET['id']);  //  assign the GET id to a variable

// Fetch user from database
$sql = "SELECT id, name, email FROM admins WHERE id = $user_id";

$result = $conn->query($sql);

if ($result && $result->num_rows > 0) {
    $user = $result->fetch_assoc();
    echo json_encode([
        "status" => "success",
        "user" => $user
    ]);
} else {
    echo json_encode([
        "status" => "error",
        "message" => "User not found"
    ]);
}

?>
