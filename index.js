const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

const ADMIN_EMAIL = "hmdaya38@gmail.com";

exports.setWithdrawalStatus = functions.https.onCall(async (data, context) => {
  if (!context.auth) throw new functions.https.HttpsError("unauthenticated");
  const callerEmail = context.auth.token.email || "";
  if (callerEmail !== ADMIN_EMAIL) throw new functions.https.HttpsError("permission-denied");
  const { withdrawalId, status, adminNote } = data;
  if (!withdrawalId || !status) throw new functions.https.HttpsError("invalid-argument");
  const ref = admin.firestore().collection("withdrawals").doc(withdrawalId);
  await ref.update({ status, adminNote: admin.firestore.FieldValue.serverTimestamp() });
  return { success: true };
});

exports.addVideo = functions.https.onCall(async (data, context) => {
  if (!context.auth) throw new functions.https.HttpsError("unauthenticated");
  const callerEmail = context.auth.token.email || "";
  if (callerEmail !== ADMIN_EMAIL) throw new functions.https.HttpsError("permission-denied");
  const { videoId, title, thumbnail } = data;
  if (!videoId) throw new functions.https.HttpsError("invalid-argument");
  const ref = admin.firestore().collection("videos").doc(videoId);
  await ref.set({ videoId, title: title || "", thumbnail: thumbnail || `https://img.youtube.com/vi/${videoId}/0.jpg`, active: true, createdAt: admin.firestore.FieldValue.serverTimestamp() });
  return { success: true };
});