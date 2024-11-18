const admin = require("firebase-admin");
const express = require("express");
const bodyParser = require("body-parser");

// Initialize Express app
const app = express();

// Initialize Firebase Admin SDK
const serviceAccount = require("./serviceAccountKey.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
  // Add your database URL if needed
  // databaseURL: "YOUR_DATABASE_URL"
});

// Middleware for parsing JSON bodies
app.use(bodyParser.json());

// Route for sending a notification
app.post("/send-notification", async (req, res) => {
  const { token, title, body } = req.body;

  if (!token || !title || !body) {
    return res.status(400).json({ error: "Missing required fields" });
  }

  try {
    await admin.messaging().send({
      token: token,
      notification: {
        title: title,
        body: body
      }
    });
    console.log("Notification sent successfully.");
    return res.status(200).json({ message: "Notification sent successfully" });
  } catch (error) {
    console.error("Error sending notification:", error);
    return res.status(500).json({ error: "Failed to send notification" });
  }
});

// Start the Express server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
