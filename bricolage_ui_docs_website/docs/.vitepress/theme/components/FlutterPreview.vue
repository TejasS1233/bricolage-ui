<script setup>
defineProps({
  path: {
    type: String,
    required: true
  },
  height: {
    type: String,
    default: '500px'
  }
})

// TODO: Update this URL when the playground is actually deployed
const baseUrl = 'https://bricolage-ui.vercel.app'
</script>

<template>
  <div class="flutter-preview">
    <iframe
      :src="`${baseUrl}${path}`"
      :style="{ height: height }"
      class="preview-iframe"
      frameborder="0"
    ></iframe>
  </div>
</template>

<style scoped>
.flutter-preview {
  margin: 1rem 0;
  border: 1px solid var(--vp-c-divider);
  border-radius: 8px;
  overflow: hidden;
  background: var(--vp-c-bg-soft);
}

.preview-iframe {
  width: 100%;
  display: block;
}
</style>
