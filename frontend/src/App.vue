<template>
  <div class="app">
    <h1>{{ header }}</h1>
    <button @click="toggleLang">
      {{ lang === 'en' ? 'Switch to 日本語' : '英語に切り替え' }}
    </button>

    <ul>
      <li v-for="course in courses" :key="course.title">
        <strong>{{ course.title }}</strong>: {{ course.desc }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {
      lang: 'en',
      header: 'Courses',
      courses: [],
    };
  },
  methods: {
    async fetchCourses() {
      const res = await fetch(`http://localhost:4567/courses/${this.lang}`);
      this.courses = await res.json();
    },
    toggleLang() {
      this.lang = this.lang === 'en' ? 'jp' : 'en';
      this.header = this.lang === 'en' ? 'Courses' : 'コース';
      this.fetchCourses();
    },
  },
  mounted() {
    this.fetchCourses();
  },
};
</script>

<style>
.app {
  max-width: 600px;
  margin: auto;
  padding: 30px;
  font-family: Arial, sans-serif;
}
</style>
