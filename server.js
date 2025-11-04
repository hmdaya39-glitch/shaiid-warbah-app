const fetch = require('node-fetch');
const { Firestore } = require('@google-cloud/firestore');

const YT_API_KEY = process.env.YT_API_KEY;
const CHANNEL_ID = process.env.CHANNEL_ID;

if (!YT_API_KEY || !CHANNEL_ID) {
  console.error("Set YT_API_KEY and CHANNEL_ID");
  process.exit(1);
}

const firestore = new Firestore();

async function fetchLatest() {
  const url = `https://www.googleapis.com/youtube/v3/search?key=${YT_API_KEY}&channelId=${CHANNEL_ID}&part=snippet,id&order=date&maxResults=10`;
  const res = await fetch(url);
  const data = await res.json();
  for (const item of data.items || []) {
    if (!item.id || !item.id.videoId) continue;
    const videoId = item.id.videoId;
    const title = item.snippet.title;
    const thumb = item.snippet.thumbnails?.high?.url || item.snippet.thumbnails?.default?.url;
    const docRef = firestore.collection('videos').doc(videoId);
    const doc = await docRef.get();
    if (!doc.exists) {
      await docRef.set({ videoId, title, thumbnail: thumb, active: true, createdAt: new Date() });
      console.log('Added', videoId);
    }
  }
}

fetchLatest().catch(console.error);