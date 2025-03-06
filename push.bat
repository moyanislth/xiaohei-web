@echo off
REM 脚本用于将当前目录的更改推送到 GitHub 仓库

REM 设置仓库 URL 和分支
set REPO_URL=https://github.com/moyanislth/xiaohei-web.git
set BRANCH=main

REM 添加所有更改到暂存区
git add .

REM 提交更改
git commit -m "更新"

REM 推送到远程仓库
git push %REPO_URL% %BRANCH%

REM 检查推送是否成功
if %errorlevel% equ 0 (
    echo 推送成功！
) else (
    echo 推送失败，请检查错误信息。
)

pause