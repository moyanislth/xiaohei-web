<template>
    <div class="carousel-container">
      <!-- 左按钮 -->
      <button
        v-if="showButtons"
        class="carousel-button prev"
        @click="scroll('left')"
        :disabled="isScrollLeftDisabled"
      >
        &#10094;
      </button>
  
      <!-- 轮播内容 -->
      <div class="carousel" ref="carousel">
        <div class="carousel-items" :style="{ transform: `translateX(${offset}px)` }">
          <div
            class="carousel-item"
            v-for="(item, index) in items"
            :key="index"
            ref="carouselItem"
          >
            {{ item }}
          </div>
        </div>
      </div>
  
      <!-- 右按钮 -->
      <button
        v-if="showButtons"
        class="carousel-button next"
        @click="scroll('right')"
        :disabled="isScrollRightDisabled"
      >
        &#10095;
      </button>
    </div>
  </template>
  
  <script>
  import { ref, onMounted, onUpdated } from "vue";
  
  export default {
    setup() {
      const items = ref(["Item 1", "Item 2", "Item 3", "Item 4", "Item 5", "Item 6", "Item 7"]);
      const carousel = ref(null); // 轮播容器
      const carouselItem = ref([]); // 轮播项目
      const offset = ref(0); // 当前偏移量
      const showButtons = ref(false); // 是否显示按钮
      const isScrollLeftDisabled = ref(true); // 左按钮是否禁用
      const isScrollRightDisabled = ref(false); // 右按钮是否禁用
  
      // 计算是否需要显示按钮
      const checkShowButtons = () => {
        if (carousel.value) {
          const containerWidth = carousel.value.clientWidth;
          const totalWidth = carouselItem.value.reduce(
            (sum, item) => sum + item.clientWidth,
            0
          );
          showButtons.value = totalWidth > containerWidth;
        }
      };
  
      // 翻页逻辑
      const scroll = (direction) => {
        const containerWidth = carousel.value.clientWidth;
        const totalWidth = carouselItem.value.reduce(
          (sum, item) => sum + item.clientWidth,
          0
        );
  
        if (direction === "left") {
          offset.value = Math.min(offset.value + containerWidth, 0);
        } else if (direction === "right") {
          offset.value = Math.max(
            offset.value - containerWidth,
            -(totalWidth - containerWidth)
          );
        }
  
        // 更新按钮状态
        isScrollLeftDisabled.value = offset.value >= 0;
        isScrollRightDisabled.value = offset.value <= -(totalWidth - containerWidth);
      };
  
      // 初始化时检测是否需要显示按钮
      onMounted(() => {
        checkShowButtons();
        window.addEventListener("resize", checkShowButtons);
      });
  
      // 更新时检测是否需要显示按钮
      onUpdated(() => {
        checkShowButtons();
      });
  
      return {
        items,
        carousel,
        carouselItem,
        offset,
        showButtons,
        isScrollLeftDisabled,
        isScrollRightDisabled,
        scroll,
      };
    },
  };
  </script>
  
  <style scoped>
  .carousel-container {
    position: relative;
    width: 100%;
    overflow: hidden;
  }
  
  .carousel {
    overflow: hidden;
  }
  
  .carousel-items {
    display: flex;
    transition: transform 0.5s ease;
  }
  
  .carousel-item {
    flex: 0 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    margin-right: 10px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1.5em;
    min-width: 150px; /* 设置项目最小宽度 */
  }
  
  .carousel-button {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    background-color: rgba(0, 0, 0, 0.5);
    color: white;
    border: none;
    padding: 10px;
    cursor: pointer;
    z-index: 10;
  }
  
  .carousel-button:disabled {
    background-color: rgba(0, 0, 0, 0.2);
    cursor: not-allowed;
  }
  
  .prev {
    left: 0;
  }
  
  .next {
    right: 0;
  }
  </style>