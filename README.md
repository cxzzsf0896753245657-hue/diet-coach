# 減重教練

## 最簡單：用 GitHub 雲端打包 APK（不用裝任何開發工具）
1. 註冊／登入 github.com，建立一個新的 **Private** repository。
2. 把這個資料夾的所有檔案（包含隱藏的 `.github` 資料夾）上傳到 repository 的 main 分支。
3. 到 repository 的 **Actions** 分頁 → 選 **Build APK** → **Run workflow**。
4. 約 5～10 分鐘後，點進完成的那次執行，在頁面底部 **Artifacts** 下載 `diet-coach-apk`，解壓縮得到 `app-debug.apk`。
5. 把 APK 傳到手機，開啟安裝（需允許「安裝未知來源應用程式」）。
6. 打開 App：設定頁填目標與 API Key → 在「提醒時間」設定想要的時間後按「套用提醒時間」→ 同步 Health Connect。

以下是進階手動建置方式：

## 建置步驟
1. 安裝 Node.js 20+ 與 Android Studio。
2. `npm install`
3. `npx cap add android && npx cap sync`
4. 編輯 `android/app/src/main/AndroidManifest.xml`，加入：
   `<uses-permission android:name="android.permission.CAMERA" />`
   並用 `tools:node="remove"` 移除用不到的 Health Connect 權限（只留 steps、totalCalories、weight 的讀取，以及 READ_HEALTH_DATA_HISTORY）。
5. `npx cap open android`，接上手機按 Run。
6. 手機端：Android 14+ 內建 Health Connect；較舊版本請到 Play 商店安裝。並確認你的手錶/運動 App（Fitbit、Samsung Health 等）已開啟寫入 Health Connect。

## 使用
設定頁填入目標與 Anthropic API Key → 同步 Health Connect → 拍照記錄每餐 → 按「今日總結／本週檢討／本月檢討」。
週、月檢討會帶入上一次的建議，檢查是否落實並調整方向。

## 注意
- API Key 存在手機本機，僅適合個人自用；若要給別人使用，請改成透過自己的後端轉發。
- 資料都在本機 localStorage，照片會縮圖；若要跨裝置或長期保存，需另加後端。
