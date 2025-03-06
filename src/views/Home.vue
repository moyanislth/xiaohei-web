<script setup>
import { RouterLink, useRoute } from 'vue-router';
import { Search } from '@element-plus/icons-vue'
import LeftBar from './LeftBar.vue';
import RightBar from './RightBar.vue';
import DefaultView from './DefaultView.vue';

</script>

<template>
    <el-container id="topct">
        <!-- 顶栏 -->
        <el-header id="topbar">   
            <div class="topitem" id="logo">
                <img src="@\assets\img\logo.png" alt="Logo">
            </div>
            <div class="topitem" id="search-bar">
                <el-input
                    v-model="SearchInput"
                    clearable style="width: 550px"
                    placeholder="热门搜索"
                    :prefix-icon="Search"
                    align-items="center"
                />  
            </div>
            <div class="topitem" id="user-info">
                <el-avatar> user </el-avatar>
                <span>不喜欢起名</span>
                <el-icon :size="30"><ChatDotSquare/></el-icon>
            </div>
        </el-header>

        <el-container id="bl">
            <!-- 左侧边栏 -->
            <el-aside width="22%">
                <LeftBar />
            </el-aside>
            <!-- 内容展示 -->
            <el-main style="padding: 0px !important;">
                <DefaultView />
            </el-main>
            <!-- 右侧边栏 -->
            <el-aside width="38%">
                <RightBar />
            </el-aside>
        </el-container>

    </el-container>

</template>

<style scoped>
body {
    margin: 0;
    font-family: Arial, sans-serif;
}
#topct {
    height: 100vh;
}
#bl {
    height: 100% - 10px;
    position: relative;
    top: 10px;
}
#topbar {
    box-shadow: 0px 10px 1cqh rgba(0, 0, 0, 0.046);
    border-bottom: solid rgba(255, 255, 255, 0.646);
    display: flex;
    position: relative;
    justify-content: center; /*  水平居中 */
    align-items: center; /* 垂直居中 */
    background-color: #ffffff;
    width: 100%;
    height: 64px;
    padding: 0 26px;
}
.topitem {
    height: 100%; /* 方块高度 */
    align-items: center; /* 垂直居中 */
}
#logo {
    display: flex;
    justify-content: center;
    width: 50px;
}

#search-bar {
    display: flex;
    position: relative;
    width: 486px;
    height: 64px;
    margin: 0px 300px;
}

#search-bar input {
    border: none;
    outline: none;
    width: 100%;
    flex: 1;
}

#user-info {
    display: flex;
    align-items: center;
}

#user-info img {
    height: 40px;
    border-radius: 50%;
    margin-right: 10px;
}

#user-info span {
    margin-right: 10px;
}

#user-info button {
    background: none;
    border: none;
    cursor: pointer;
}
</style>
