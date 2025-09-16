<script lang="ts">
  import { invoke } from "@tauri-apps/api/core";
  import { CirclePlus, Monitor, Pencil } from "lucide-svelte";
  import { songs, type Song } from "../lib/stores/songs";

  let name = $state("");
  let songSearch = $state("");
  let songSelected: Song | null = $state(null);

  async function greet(event: Event) {
    event.preventDefault();
    // Learn more about Tauri commands at https://tauri.app/develop/calling-rust/
    songSearch = await invoke("greet", { name: name });
  }

  function selectSong(song: Song) {
    songSelected = song;
  }
</script>

<main class="min-h-screen flex">
  <!-- Left Area -->
  <div class="w-1/3 bg-slate-800 flex flex-col px-2">
    <!-- Form Section -->
    <div class="pt-6">
      <input
        id="greet-input"
        type="text"
        placeholder="Enter a name..."
        bind:value={name}
        oninput={greet}
        class="w-full px-3 py-2 bg-slate-700 text-white border border-slate-600 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-transparent"
      />
    </div>
    <div>
      <div class="rounded-lg max-h-full overflow-y-auto">
        {#if songSearch}
          <div class="mt-4 mb-4 p-3 bg-slate-700 rounded-lg">
            <p class="text-green-400">{songSearch}</p>
          </div>

          {#each $songs as song}
            <button
              class="mb-2 bg-slate-700 border border-slate-600 rounded-lg shadow-sm cursor-pointer hover:bg-slate-600 transition-colors {songSelected?.title ===
              song.title
                ? 'ring-2 bg-green-600 hover:bg-green-500'
                : ''}"
              onclick={() => selectSong(song)}
              aria-label="Select {song.title}"
              type="button"
            >
              <div class="flex justify-between items-start">
                <div class="flex-1">
                  <div class="flex items-center gap-4 mb-2">
                    <h3 class="text-lg font-semibold text-white">
                      {song.title}
                    </h3>
                    {#if song.number}
                      <span
                        class="bg-blue-900 text-blue-200 px-2 py-1 rounded text-sm"
                      >
                        #{song.number}
                      </span>
                    {/if}
                    <span
                      class="bg-green-900 text-green-200 px-2 py-1 rounded text-sm"
                    >
                      Key: {song.key_signature}
                    </span>
                    <span
                      class="bg-purple-900 text-purple-200 px-2 py-1 rounded text-sm"
                    >
                      {song.category}
                    </span>
                  </div>
                  <p class="text-gray-300 text-sm">
                    {JSON.parse(song.verses).length} verses
                  </p>
                </div>
              </div>
            </button>
          {/each}
        {/if}
      </div>
    </div>
  </div>

  <!-- Main Content Area -->
  <div class="w-2/3 bg-stone-900 p-6">
    <div class="max-w-4xl mx-auto">
      <div class="flex justify-end space-x-4 mb-4">
        <button
          type="submit"
          class="bg-blue-600 text-white rounded-lg hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 focus:ring-offset-slate-800 transition-colors"
          disabled={!songSelected}
        >
          <Pencil class="inline mr-2" size="16" />
          Edit Song
        </button>
        <button
          type="submit"
          class="bg-blue-600 text-white rounded-lg hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:ring-offset-2 focus:ring-offset-slate-800 transition-colors"
        >
          <CirclePlus class="inline mr-2" size="16" />
          Add Song
        </button>
      </div>

      <!-- Song Display Area -->
      <div class="text-white">
        {#if songSelected}
          <div class="mb-6">
            <div class="flex items-center gap-4 mb-4">
              <h1 class="text-3xl font-bold">{songSelected.title}</h1>
              {#if songSelected.number}
                <span
                  class="bg-blue-900 text-blue-200 px-3 py-2 rounded text-lg"
                >
                  #{songSelected.number}
                </span>
              {/if}
            </div>

            <div class="flex gap-4 mb-6">
              <span class="bg-green-900 text-green-200 px-3 py-2 rounded">
                Key: {songSelected.key_signature}
              </span>
              <span class="bg-purple-900 text-purple-200 px-3 py-2 rounded">
                {songSelected.category}
              </span>
            </div>
          </div>

          <!-- Song Verses -->
          <div class="space-y-6">
            {#each JSON.parse(songSelected.verses) as verse, index}
              <div class="bg-slate-800 rounded-lg p-4">
                {verse}
              </div>
            {/each}
          </div>
        {:else}
          <div class="text-center text-gray-400 mt-20">
            <p class="text-xl">Select a song to view its content</p>
            <p class="mt-2">Choose a song from the list on the left</p>
          </div>
        {/if}
      </div>
    </div>
  </div>
</main>

<style lang="postcss">
  :global(html) {
    background-color: theme(colors.gray.100);
  }

  button {
    padding: 1rem;
    text-align: left;
    width: 100%;
  }

  @media (prefers-color-scheme: dark) {
    :root {
      background-color: #2f2f2f;
    }
  }
</style>
