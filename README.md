# HITCON ZeroDay Telegram BOT

## 說明

一個會自動通知每天最新公開漏洞的Telegram BOT

## 使用方法

- 申請一個BOT
    - BotFather => `/newbot`
    - 拿到bot token
    - 傳訊息給BOT
    - 查看https://api.telegram.org/bot$TOKEN/getUpdates
    - 取得自己的UserID
- 把`UserID`和`Token`填入zero.rb
- 填寫log檔絕對路徑
- 設定crontab
    - `crontab -e`
    - e.g. `5 19 * * * /usr/bin/ruby /home/kaibro/bot/zero.rb`

## 截圖

![img](https://github.com/w181496/TG_Zeroday/blob/master/image.png)

