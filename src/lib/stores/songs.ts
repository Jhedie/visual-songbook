import { writable } from "svelte/store";
export interface Song {
  id: number;
  title: string;
  number?: string;
  key_signature: string;
  category: string;
  verses: string; // JSON string from database
  created_at: string;
  updated_at: string;
}

export const songs = writable<Song[]>([
  {
    id: 1,
    title: "Sample Song",
    key_signature: "C",
    category: "Worship",
    verses: JSON.stringify([
      "This is the first verse.",
      "This is the second verse.",
    ]),
    created_at: new Date().toISOString(),
    updated_at: new Date().toISOString(),
  },
  {
    id: 2,
    title: "Another Song",
    key_signature: "G",
    category: "Hymn",
    verses: JSON.stringify(["Verse one.", "Verse two."]),
    created_at: new Date().toISOString(),
    updated_at: new Date().toISOString(),
  },
  {
    id: 3,
    title: "Third Song",
    key_signature: "D",
    category: "Praise",
    verses: JSON.stringify([
      "First verse of third song.",
      "Second verse of third song.",
    ]),
    created_at: new Date().toISOString(),
    updated_at: new Date().toISOString(),
  },
]);
