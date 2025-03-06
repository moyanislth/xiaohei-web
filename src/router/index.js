import {createRouter,createWebHistory} from 'vue-router'

//导入组件
import Home from '@/views/Home.vue'
import DefaultView from '@/views/main/DefaultView.vue'

//定义路由关系
const routes = [

    {path:'/', component:Home, 
        
        redirect:'/app/bbs/home', 
        
        children:[
        {
            path:'/app/bbs/home',component: DefaultView}
        ]
    }
]

//创建路由实例
const router = createRouter({
    history:createWebHistory(),
    routes:routes
})

export default router