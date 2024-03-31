.class public Lcom/mwr/example/sieve/CryptoServiceConnector;
.super Landroid/os/Handler;
.source "CryptoServiceConnector.java"

# interfaces
.implements Landroid/content/ServiceConnection;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mwr/example/sieve/CryptoServiceConnector$MessageHandler;,
        Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;
    }
.end annotation


# static fields
.field static final MSG_ERROR:I = 0x1b207

.field static final MSG_RESULT:I = 0x9

.field private static final TAG:Ljava/lang/String; = "m_CryptoServiceConnector"

.field static final TYPE_DECRYPT:I = 0x5c

.field static final TYPE_ENCRYPT:I = 0x5b


# instance fields
.field activity:Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;

.field private bound:Z

.field private responseHandler:Landroid/os/Messenger;

.field private serviceMessenger:Landroid/os/Messenger;


# direct methods
.method public constructor <init>(Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;)V
    .locals 0
    .param p1, "activity"    # Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;

    .prologue
    .line 46
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 47
    iput-object p1, p0, Lcom/mwr/example/sieve/CryptoServiceConnector;->activity:Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;

    .line 48
    return-void
.end method

.method private sendToServer(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 71
    iget-boolean v1, p0, Lcom/mwr/example/sieve/CryptoServiceConnector;->bound:Z

    if-eqz v1, :cond_0

    .line 73
    :try_start_0
    iget-object v1, p0, Lcom/mwr/example/sieve/CryptoServiceConnector;->responseHandler:Landroid/os/Messenger;

    iput-object v1, p1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    .line 74
    iget-object v1, p0, Lcom/mwr/example/sieve/CryptoServiceConnector;->serviceMessenger:Landroid/os/Messenger;

    invoke-virtual {v1, p1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    :goto_0
    return-void

    .line 77
    :catch_0
    move-exception v0

    .line 78
    .local v0, "e":Landroid/os/RemoteException;
    const-string v1, "m_CryptoServiceConnector"

    const-string v2, "Unable to send message to Service"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    iget-object v1, p0, Lcom/mwr/example/sieve/CryptoServiceConnector;->activity:Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;

    invoke-interface {v1}, Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;->sendFailed()V

    .line 81
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/mwr/example/sieve/CryptoServiceConnector;->bound:Z

    goto :goto_0

    .line 85
    .end local v0    # "e":Landroid/os/RemoteException;
    :cond_0
    const-string v1, "m_CryptoServiceConnector"

    const-string v2, "ERROR: We are not bound to Crypto!"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    iget-object v1, p0, Lcom/mwr/example/sieve/CryptoServiceConnector;->activity:Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;

    invoke-interface {v1}, Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;->sendFailed()V

    goto :goto_0
.end method


# virtual methods
.method public onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 2
    .param p1, "className"    # Landroid/content/ComponentName;
    .param p2, "service"    # Landroid/os/IBinder;

    .prologue
    .line 53
    new-instance v0, Landroid/os/Messenger;

    invoke-direct {v0, p2}, Landroid/os/Messenger;-><init>(Landroid/os/IBinder;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/CryptoServiceConnector;->serviceMessenger:Landroid/os/Messenger;

    .line 54
    new-instance v0, Landroid/os/Messenger;

    new-instance v1, Lcom/mwr/example/sieve/CryptoServiceConnector$MessageHandler;

    invoke-direct {v1, p0}, Lcom/mwr/example/sieve/CryptoServiceConnector$MessageHandler;-><init>(Lcom/mwr/example/sieve/CryptoServiceConnector;)V

    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/CryptoServiceConnector;->responseHandler:Landroid/os/Messenger;

    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/mwr/example/sieve/CryptoServiceConnector;->bound:Z

    .line 57
    iget-object v0, p0, Lcom/mwr/example/sieve/CryptoServiceConnector;->activity:Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;

    invoke-interface {v0}, Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;->connected()V

    .line 59
    return-void
.end method

.method public onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 1
    .param p1, "className"    # Landroid/content/ComponentName;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/mwr/example/sieve/CryptoServiceConnector;->activity:Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;

    invoke-interface {v0}, Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;->sendFailed()V

    .line 66
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/mwr/example/sieve/CryptoServiceConnector;->bound:Z

    .line 67
    return-void
.end method

.method public sendForDecryption(Ljava/lang/String;[BI)V
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "string"    # [B
    .param p3, "code"    # I

    .prologue
    .line 103
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 104
    .local v0, "data":Landroid/os/Bundle;
    const-string v2, "com.mwr.example.sieve.KEY"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    const-string v2, "com.mwr.example.sieve.PASSWORD"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putByteArray(Ljava/lang/String;[B)V

    .line 107
    const/4 v2, 0x0

    const/16 v3, 0x34a4

    const/4 v4, 0x0

    invoke-static {v2, v3, p3, v4, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 109
    .local v1, "msg":Landroid/os/Message;
    invoke-direct {p0, v1}, Lcom/mwr/example/sieve/CryptoServiceConnector;->sendToServer(Landroid/os/Message;)V

    .line 110
    return-void
.end method

.method public sendForEncryption(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "password"    # Ljava/lang/String;
    .param p3, "code"    # I

    .prologue
    .line 93
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 94
    .local v0, "data":Landroid/os/Bundle;
    const-string v2, "com.mwr.example.sieve.KEY"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    const-string v2, "com.mwr.example.sieve.STRING"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    const/4 v2, 0x0

    const/16 v3, 0xd7c

    const/4 v4, 0x0

    invoke-static {v2, v3, p3, v4, v0}, Landroid/os/Message;->obtain(Landroid/os/Handler;IIILjava/lang/Object;)Landroid/os/Message;

    move-result-object v1

    .line 99
    .local v1, "msg":Landroid/os/Message;
    invoke-direct {p0, v1}, Lcom/mwr/example/sieve/CryptoServiceConnector;->sendToServer(Landroid/os/Message;)V

    .line 100
    return-void
.end method
