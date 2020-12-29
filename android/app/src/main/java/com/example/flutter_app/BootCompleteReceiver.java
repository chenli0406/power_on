package com.example.flutter_app;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;

public class BootCompleteReceiver extends BroadcastReceiver {
     /**
     * 接收广播消息后进入 onReceive 方法，对相应的消息做出处理
     *
     * @param context 表示广播接收器所运行的上下文
     * @param intent  表示广播接收器收到的Intent
     */
    @Override
    public void onReceive(Context context, Intent intent) {
        if(Intent.ACTION_BOOT_COMPLETED.equals(intent.getAction())){
            Intent thisIntent = new Intent(context, MainActivity.class);
            thisIntent.setAction("android.intent.action.MAIN");
            thisIntent.addCategory("android.intent.category.LAUNCHER");
            thisIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
            context.startActivity(thisIntent);
        }
    }
}