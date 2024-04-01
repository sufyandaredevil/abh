.class public Lcom/mwr/example/sieve/AuthService;
.super Landroid/app/Service;
.source "AuthService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mwr/example/sieve/AuthService$MessageHandler;
    }
.end annotation


# static fields
.field static final MSG_CHECK:I = 0x932

.field static final MSG_CHECK_IF_INITALISED:I = 0x2

.field static final MSG_FIRST_LAUNCH:I = 0x4

.field static final MSG_SAY_HELLO:I = 0x1

.field static final MSG_SET:I = 0x18c9

.field static final MSG_UNREGISTER:I = -0x1

.field public static final PASSWORD:Ljava/lang/String; = "com.mwr.example.sieve.PASSWORD"

.field public static final PIN:Ljava/lang/String; = "com.mwr.example.sieve.PIN"

.field private static final TAG:Ljava/lang/String; = "m_AuthService"

.field static final TYPE_KEY:I = 0x1d1c

.field static final TYPE_PIN:I = 0x2412


# instance fields
.field private NOTIFICATION:I

.field private nManager:Landroid/app/NotificationManager;

.field private responseHandler:Landroid/os/Messenger;

.field private serviceHandler:Landroid/os/Messenger;

.field private serviceLooper:Landroid/os/Looper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 34
    const/high16 v0, 0x7f050000

    iput v0, p0, Lcom/mwr/example/sieve/AuthService;->NOTIFICATION:I

    .line 23
    return-void
.end method

.method static synthetic access$0(Lcom/mwr/example/sieve/AuthService;Landroid/os/Messenger;)V
    .locals 0

    .prologue
    .line 39
    iput-object p1, p0, Lcom/mwr/example/sieve/AuthService;->responseHandler:Landroid/os/Messenger;

    return-void
.end method

.method static synthetic access$1(Lcom/mwr/example/sieve/AuthService;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 256
    invoke-direct {p0, p1}, Lcom/mwr/example/sieve/AuthService;->verifyKey(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$2(Lcom/mwr/example/sieve/AuthService;)V
    .locals 0

    .prologue
    .line 94
    invoke-direct {p0}, Lcom/mwr/example/sieve/AuthService;->showNotification()V

    return-void
.end method

.method static synthetic access$3(Lcom/mwr/example/sieve/AuthService;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 265
    invoke-direct {p0, p1}, Lcom/mwr/example/sieve/AuthService;->verifyPin(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$4(Lcom/mwr/example/sieve/AuthService;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 300
    invoke-direct {p0}, Lcom/mwr/example/sieve/AuthService;->getKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$5(Lcom/mwr/example/sieve/AuthService;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 274
    invoke-direct {p0, p1}, Lcom/mwr/example/sieve/AuthService;->setKey(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$6(Lcom/mwr/example/sieve/AuthService;Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 285
    invoke-direct {p0, p1}, Lcom/mwr/example/sieve/AuthService;->setPin(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$7(Lcom/mwr/example/sieve/AuthService;)Landroid/os/Messenger;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/mwr/example/sieve/AuthService;->responseHandler:Landroid/os/Messenger;

    return-object v0
.end method

.method private getKey()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v4, 0x0

    .line 301
    const/4 v0, 0x1

    new-array v3, v0, [Ljava/lang/String;

    const/4 v0, 0x0

    const-string v1, "Password"

    aput-object v1, v3, v0

    .line 302
    .local v3, "projection":[Ljava/lang/String;
    new-instance v0, Landroid/content/CursorLoader;

    sget-object v2, Lcom/mwr/example/sieve/DBContentProvider;->KEYS_URI:Landroid/net/Uri;

    move-object v1, p0

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/CursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v7

    .line 303
    .local v7, "c":Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 304
    const-string v0, "Password"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private setKey(Ljava/lang/String;)Z
    .locals 4
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 276
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 277
    .local v0, "out":Landroid/content/ContentValues;
    const-string v2, "Password"

    invoke-virtual {v0, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    invoke-virtual {p0}, Lcom/mwr/example/sieve/AuthService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/mwr/example/sieve/DBContentProvider;->KEYS_URI:Landroid/net/Uri;

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    .line 281
    .local v1, "result":Landroid/net/Uri;
    if-eqz v1, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private setPin(Ljava/lang/String;)Z
    .locals 6
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 289
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 290
    .local v0, "out":Landroid/content/ContentValues;
    const-string v3, "pin"

    invoke-virtual {v0, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    const-string v2, "pin IS NULL"

    .line 295
    .local v2, "selection":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/mwr/example/sieve/AuthService;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Lcom/mwr/example/sieve/DBContentProvider;->KEYS_URI:Landroid/net/Uri;

    const/4 v5, 0x0

    invoke-virtual {v3, v4, v0, v2, v5}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 297
    .local v1, "r":I
    if-lez v1, :cond_0

    const/4 v3, 0x1

    :goto_0
    return v3

    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method private showNotification()V
    .locals 6

    .prologue
    .line 98
    new-instance v3, Landroid/support/v4/app/NotificationCompat$Builder;

    invoke-direct {v3, p0}, Landroid/support/v4/app/NotificationCompat$Builder;-><init>(Landroid/content/Context;)V

    .line 99
    const/high16 v4, 0x7f020000

    invoke-virtual {v3, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setSmallIcon(I)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v3

    .line 100
    const/high16 v4, 0x7f050000

    invoke-virtual {p0, v4}, Lcom/mwr/example/sieve/AuthService;->getText(I)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v3

    .line 101
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setOngoing(Z)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v3

    .line 102
    const-string v4, "Click to access your passwords"

    invoke-virtual {v3, v4}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/support/v4/app/NotificationCompat$Builder;

    move-result-object v0

    .line 104
    .local v0, "builder":Landroid/support/v4/app/NotificationCompat$Builder;
    new-instance v1, Landroid/content/Intent;

    const-class v3, Lcom/mwr/example/sieve/MainLoginActivity;

    invoke-direct {v1, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 105
    .local v1, "resultIntent":Landroid/content/Intent;
    const/high16 v3, 0x100000

    invoke-virtual {v1, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 108
    invoke-virtual {p0}, Lcom/mwr/example/sieve/AuthService;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    .line 109
    const/4 v4, 0x0

    .line 111
    const/high16 v5, 0x10000000

    .line 107
    invoke-static {v3, v4, v1, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    .line 114
    .local v2, "resultPendingIntent":Landroid/app/PendingIntent;
    invoke-virtual {v0, v2}, Landroid/support/v4/app/NotificationCompat$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/support/v4/app/NotificationCompat$Builder;

    .line 117
    iget-object v3, p0, Lcom/mwr/example/sieve/AuthService;->nManager:Landroid/app/NotificationManager;

    iget v4, p0, Lcom/mwr/example/sieve/AuthService;->NOTIFICATION:I

    invoke-virtual {v0}, Landroid/support/v4/app/NotificationCompat$Builder;->build()Landroid/app/Notification;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    .line 118
    return-void
.end method

.method private verifyKey(Ljava/lang/String;)Z
    .locals 10
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 257
    new-array v3, v8, [Ljava/lang/String;

    const-string v0, "Password"

    aput-object v0, v3, v9

    .line 258
    .local v3, "projection":[Ljava/lang/String;
    const-string v4, "Password = ?"

    .line 259
    .local v4, "selection":Ljava/lang/String;
    new-array v5, v8, [Ljava/lang/String;

    aput-object p1, v5, v9

    .line 260
    .local v5, "selectionArgs":[Ljava/lang/String;
    new-instance v0, Landroid/content/CursorLoader;

    sget-object v2, Lcom/mwr/example/sieve/DBContentProvider;->KEYS_URI:Landroid/net/Uri;

    const/4 v6, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/CursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v7

    .line 261
    .local v7, "c":Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ne v0, v8, :cond_0

    move v0, v8

    :goto_0
    return v0

    :cond_0
    move v0, v9

    goto :goto_0
.end method

.method private verifyPin(Ljava/lang/String;)Z
    .locals 10
    .param p1, "PIN"    # Ljava/lang/String;

    .prologue
    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 266
    new-array v3, v8, [Ljava/lang/String;

    const-string v0, "pin"

    aput-object v0, v3, v9

    .line 267
    .local v3, "projection":[Ljava/lang/String;
    const-string v4, "pin = ?"

    .line 268
    .local v4, "selection":Ljava/lang/String;
    new-array v5, v8, [Ljava/lang/String;

    aput-object p1, v5, v9

    .line 269
    .local v5, "selectionArgs":[Ljava/lang/String;
    new-instance v0, Landroid/content/CursorLoader;

    sget-object v2, Lcom/mwr/example/sieve/DBContentProvider;->KEYS_URI:Landroid/net/Uri;

    const/4 v6, 0x0

    move-object v1, p0

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/CursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v7

    .line 270
    .local v7, "c":Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-ne v0, v8, :cond_0

    move v0, v8

    :goto_0
    return v0

    :cond_0
    move v0, v9

    goto :goto_0
.end method


# virtual methods
.method public checkKeyExists()Z
    .locals 10

    .prologue
    const/4 v8, 0x1

    const/4 v9, 0x0

    const/4 v4, 0x0

    .line 308
    new-array v3, v8, [Ljava/lang/String;

    const-string v0, "Password"

    aput-object v0, v3, v9

    .line 309
    .local v3, "projection":[Ljava/lang/String;
    new-instance v0, Landroid/content/CursorLoader;

    sget-object v2, Lcom/mwr/example/sieve/DBContentProvider;->KEYS_URI:Landroid/net/Uri;

    move-object v1, p0

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/CursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v7

    .line 310
    .local v7, "c":Landroid/database/Cursor;
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    move v0, v8

    :goto_0
    return v0

    :cond_0
    move v0, v9

    goto :goto_0
.end method

.method public checkPinExists()Z
    .locals 12

    .prologue
    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v4, 0x0

    .line 314
    new-array v3, v10, [Ljava/lang/String;

    const-string v0, "pin"

    aput-object v0, v3, v11

    .line 315
    .local v3, "projection":[Ljava/lang/String;
    new-instance v0, Landroid/content/CursorLoader;

    sget-object v2, Lcom/mwr/example/sieve/DBContentProvider;->KEYS_URI:Landroid/net/Uri;

    move-object v1, p0

    move-object v5, v4

    move-object v6, v4

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/CursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v7

    .line 317
    .local v7, "c":Landroid/database/Cursor;
    const/4 v8, 0x0

    .line 318
    .local v8, "exists":Z
    invoke-interface {v7}, Landroid/database/Cursor;->moveToFirst()Z

    .line 319
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_0
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lt v9, v0, :cond_0

    .line 322
    return v8

    .line 320
    :cond_0
    const-string v0, "pin"

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v7, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    move v8, v10

    .line 319
    :goto_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_1
    move v8, v11

    .line 320
    goto :goto_1
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "arg0"    # Landroid/content/Intent;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/mwr/example/sieve/AuthService;->serviceHandler:Landroid/os/Messenger;

    invoke-virtual {v0}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method

.method public onCreate()V
    .locals 4

    .prologue
    .line 63
    const-string v1, "notification"

    invoke-virtual {p0, v1}, Lcom/mwr/example/sieve/AuthService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    iput-object v1, p0, Lcom/mwr/example/sieve/AuthService;->nManager:Landroid/app/NotificationManager;

    .line 67
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "m_AuthService"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 68
    .local v0, "thread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 69
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    iput-object v1, p0, Lcom/mwr/example/sieve/AuthService;->serviceLooper:Landroid/os/Looper;

    .line 70
    new-instance v1, Landroid/os/Messenger;

    new-instance v2, Lcom/mwr/example/sieve/AuthService$MessageHandler;

    iget-object v3, p0, Lcom/mwr/example/sieve/AuthService;->serviceLooper:Landroid/os/Looper;

    invoke-direct {v2, p0, v3}, Lcom/mwr/example/sieve/AuthService$MessageHandler;-><init>(Lcom/mwr/example/sieve/AuthService;Landroid/os/Looper;)V

    invoke-direct {v1, v2}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/mwr/example/sieve/AuthService;->serviceHandler:Landroid/os/Messenger;

    .line 71
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/mwr/example/sieve/AuthService;->nManager:Landroid/app/NotificationManager;

    invoke-virtual {v0}, Landroid/app/NotificationManager;->cancelAll()V

    .line 91
    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    .line 84
    const/4 v0, 0x1

    return v0
.end method
