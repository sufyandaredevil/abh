.class public Lcom/mwr/example/sieve/AuthServiceConnector;
.super Landroid/os/Handler;
.source "AuthServiceConnector.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mwr/example/sieve/AuthServiceConnector$MessageHandler;,
        Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;
    }
.end annotation


# static fields
.field static final MSG_CHECK:I = 0x5

.field static final MSG_ERROR:I = 0x1b207

.field static final MSG_FIRST_LAUNCH:I = 0x3

.field static final MSG_SET:I = 0x4

.field private static final TAG:Ljava/lang/String; = "m_AuthServiceConnector"

.field static final TYPE_HAS_KEY_HAS_PIN:I = 0x1f

.field static final TYPE_HAS_KEY_NO_PIN:I = 0x20

.field static final TYPE_KEY:I = 0x2a

.field static final TYPE_MSG_UNDEFINED:I = 0x1dd6e

.field static final TYPE_NO_KEY_NO_PIN:I = 0x21

.field static final TYPE_PIN:I = 0x29


# instance fields
.field activity:Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;

.field private bound:Z

.field private responseHandler:Landroid/os/Messenger;

.field private serviceMessenger:Landroid/os/Messenger;


# direct methods
.method public constructor <init>(Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;)V
    .locals 0
    .param p1, "activity"    # Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;

    .prologue
    .line 38
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 39
    iput-object p1, p0, Lcom/mwr/example/sieve/AuthServiceConnector;->activity:Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;

    .line 40
    return-void
.end method

.method private sendToServer(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 59
    iget-boolean v1, p0, Lcom/mwr/example/sieve/AuthServiceConnector;->bound:Z

    if-eqz v1, :cond_0

    .line 61
    :try_start_0
    iget-object v1, p0, Lcom/mwr/example/sieve/AuthServiceConnector;->responseHandler:Landroid/os/Messenger;

    iput-object v1, p1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 62
    iget-object v1, p0, Lcom/mwr/example/sieve/AuthServiceConnector;->serviceMessenger:Landroid/os/Messenger;

    invoke-virtual {v1, p1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    :goto_0
    return-void

    .line 65
    :catch_0
    move-exception v0

    .line 66
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "m_AuthServiceConnector"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Unable to send message: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p1, Landroid/os/Message;->what:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    iget-object v1, p0, Lcom/mwr/example/sieve/AuthServiceConnector;->activity:Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;

    invoke-interface {v1}, Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;->sendFailed()V

    goto :goto_0

    .line 71
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_0
    const-string v1, "m_AuthServiceConnector"

    const-string v2, "ERROR: We are not bound to Crypto!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method


# virtual methods
.method public checkFirstLaunch()V
    .locals 3

    .prologue
    .line 77
    const/4 v1, 0x0

    const/4 v2, 0x4

    invoke-static {v1, v2}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v0

    .line 79
    .local v0, "msg":Landroid/os/Message;
    invoke-direct {p0, v0}, Lcom/mwr/example/sieve/AuthServiceConnector;->sendToServer(Landroid/os/Message;)V

    .line 80
    return-void
.end method

.method public checkKey(Ljava/lang/String;)V
    .locals 6
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 84
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 85
    .local v0, "data":Landroid/os/Bundle;
    const-string v2, "com.mwr.example.sieve.PASSWORD"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    const/4 v2, 0x0

    const/16 v3, 0x932

    const/16 v4, 0x1d1c

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v5, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 89
    .local v1, "msg":Landroid/os/Message;
    invoke-direct {p0, v1}, Lcom/mwr/example/sieve/AuthServiceConnector;->sendToServer(Landroid/os/Message;)V

    .line 90
    return-void
.end method

.method public checkPin(Ljava/lang/String;)V
    .locals 6
    .param p1, "pin"    # Ljava/lang/String;

    .prologue
    .line 93
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 94
    .local v0, "data":Landroid/os/Bundle;
    const-string v2, "com.mwr.example.sieve.PIN"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    const/4 v2, 0x0

    const/16 v3, 0x932

    const/16 v4, 0x2412

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v5, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 98
    .local v1, "msg":Landroid/os/Message;
    invoke-direct {p0, v1}, Lcom/mwr/example/sieve/AuthServiceConnector;->sendToServer(Landroid/os/Message;)V

    .line 99
    return-void
.end method

.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .param p1, "className"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 44
    new-instance v0, Landroid/os/Messenger;

    invoke-direct {v0, p2}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/AuthServiceConnector;->serviceMessenger:Landroid/os/Messenger;

    .line 45
    new-instance v0, Landroid/os/Messenger;

    new-instance v1, Lcom/mwr/example/sieve/AuthServiceConnector$MessageHandler;

    invoke-direct {v1, p0}, Lcom/mwr/example/sieve/AuthServiceConnector$MessageHandler;-><init>(Lcom/mwr/example/sieve/AuthServiceConnector;)V

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/AuthServiceConnector;->responseHandler:Landroid/os/Messenger;

    .line 47
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mwr/example/sieve/AuthServiceConnector;->bound:Z

    .line 48
    iget-object v0, p0, Lcom/mwr/example/sieve/AuthServiceConnector;->activity:Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;

    invoke-interface {v0}, Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;->connected()V

    .line 50
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1
    .param p1, "className"    # Landroid/content/ComponentName;

    .prologue
    .line 53
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mwr/example/sieve/AuthServiceConnector;->bound:Z

    .line 54
    iget-object v0, p0, Lcom/mwr/example/sieve/AuthServiceConnector;->activity:Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;

    invoke-interface {v0}, Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;->sendFailed()V

    .line 55
    return-void
.end method

.method public setKey(Ljava/lang/String;)V
    .locals 6
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 102
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 103
    .local v0, "data":Landroid/os/Bundle;
    const-string v2, "com.mwr.example.sieve.PASSWORD"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    const/4 v2, 0x0

    const/16 v3, 0x18c9

    const/16 v4, 0x1d1c

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v5, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 107
    .local v1, "msg":Landroid/os/Message;
    invoke-direct {p0, v1}, Lcom/mwr/example/sieve/AuthServiceConnector;->sendToServer(Landroid/os/Message;)V

    .line 108
    return-void
.end method

.method public setPin(Ljava/lang/String;)V
    .locals 6
    .param p1, "pin"    # Ljava/lang/String;

    .prologue
    .line 111
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 112
    .local v0, "data":Landroid/os/Bundle;
    const-string v2, "com.mwr.example.sieve.PIN"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    const/4 v2, 0x0

    const/16 v3, 0x18c9

    const/16 v4, 0x2412

    const/4 v5, 0x0

    invoke-static {v2, v3, v4, v5, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 116
    .local v1, "msg":Landroid/os/Message;
    invoke-direct {p0, v1}, Lcom/mwr/example/sieve/AuthServiceConnector;->sendToServer(Landroid/os/Message;)V

    .line 117
    return-void
.end method
