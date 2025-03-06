<script setup>
import { RouterLink, useRoute } from 'vue-router';
import { Search } from '@element-plus/icons-vue'
import LeftBar from './aside/LeftBar.vue';
import RightBar from './aside/RightBar.vue';
import DefaultView from './main/DefaultView.vue';
import { ref } from 'vue';

const activeIndex = ref('1')
</script>

<template>
    <el-container id="topct">
        <!-- 顶栏 -->
        <el-header id="topbar">  
            <el-container id="tpcontainer">
                <div class="topitem" id="logo">
                    <img src="@\assets\img\logo.png" alt="Logo" style="size: 26cm;">
                </div>
                <div class="topitem" id="search-bar">
                    <el-input
                        v-model="SearchInput"
                        clearable style="width: 100%"
                        placeholder="热门搜索"
                        :prefix-icon="Search"
                        align-items="center"
                    />  
                </div>
                <div class="topitem" id="user-info">
                    <el-menu
                    :default-active="activeIndex"
                    class="el-menu"
                    mode="horizontal"
                    :ellipsis="false"
                    >
                    <!-- 用户头像和菜单 -->
                    <el-sub-menu index="1" popper-class="avatar-menu" popper-append-to-body >
                        <!-- 头像作为触发按钮 -->
                        <template #title>
                        <el-avatar>user</el-avatar>
                        <span>不喜欢起名</span>
                        </template>
                        <!-- 菜单项 -->
                        <el-menu-item index="2-1">item one</el-menu-item>
                        <el-menu-item index="2-2">item two</el-menu-item>
                        <el-menu-item index="2-3">item three</el-menu-item>
                    </el-sub-menu>
                    </el-menu>

                    <el-icon :size="26"><ChatDotSquare /></el-icon>
                </div>
            </el-container> 
            
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

/* 隐藏 el-menu 的边框 */
.el-menu {
  border-bottom: none;
}

/* 隐藏 el-sub-menu 的箭头 */
.el-sub-menu ::v-deep(.el-sub-menu__title)::after {
  display: none;
}

/* 自定义菜单样式 */
.avatar-menu {
  margin-top: 10px;
  border: none; /* 移除菜单边框 */
  box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1); /* 添加阴影 */
}

/* 隐藏 el-menu-item 的边框 */
.el-menu-item {
  border-bottom: none;
}
#topct {
    height: 100vh;
}
#bl {
    height: 100% - 10px;
    position: relative;
    top: 10px;
}
#tpcontainer {
    height: 100%;
    width: 100%;
    display: flex;
    position: relative;
    justify-content: center; /*  水平居中 */
    align-items: center; /* 垂直居中 */
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
    margin: 0px 400px;
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
    width: 38%;
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
