<script lang="js" setup>
import FenquLunbo from './FenquLunbo.vue'
import { ref } from 'vue'

const count = ref(0)
const load = () => {
  count.value += 2
}
</script>

<template>
    <el-container id="main">
        <div id="fenqu">
            <div id="fenqu-item">
                <FenquLunbo />
            </div>
        </div>
        <div id="content">
            <ul id="ct-items" v-infinite-scroll="load" class="infinite-list" style="overflow: auto">
                <li v-for="i in count" :key="i" class="infinite-list-item">{{ i }}</li>
            </ul>
        </div>
    </el-container>
   
</template>

<style scoped>
#main {
    display: flex;
    flex-direction: column;
    justify-content: center; /*  水平居中 */
    align-items: center; /* 垂直居中 */
    width: 100%;
    height: 100%;
    position: relative;
}
#ct-items {
    height: 100vh;
    justify-content: center; /*  水平居中 */
    align-items: center; /* 垂直居中 */
}
#fenqu {
    display: flex;
    width: 100%;
    position: relative;
    justify-content: center; /*  水平居中 */
    margin: 10px;
}
#fenqu-item {
    display: flex;
    width: 96%;
    height: 80px;
    background-color: rgb(255, 255, 255);
    border-radius: 5px;

}
#content {
    flex: 1;
    width: 96%;
    height: 100%;
    position: relative;
    background-color: rgb(255, 255, 255);
    border-radius: 5px;
}
.infinite-list {
  height: 300px;
  padding: 0;
  margin: 0;
  list-style: none;
}
.infinite-list .infinite-list-item {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 50px;
  background: var(--el-color-primary-light-9);
  margin: 10px;
  color: var(--el-color-primary);
}
.infinite-list .infinite-list-item + .list-item {
  margin-top: 10px;
}
</style>