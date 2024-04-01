.class public Lcom/mwr/example/sieve/CryptoService;
.super Landroid/app/Service;
.source "CryptoService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mwr/example/sieve/CryptoService$MessageHandler;
    }
.end annotation


# static fields
.field public static final KEY:Ljava/lang/String; = "com.mwr.example.sieve.KEY"

.field public static final MSG_DECRYPT:I = 0x34a4

.field public static final MSG_ENCRYPT:I = 0xd7c

.field public static final PASSWORD:Ljava/lang/String; = "com.mwr.example.sieve.PASSWORD"

.field public static final RESULT:Ljava/lang/String; = "com.mwr.example.sieve.RESULT"

.field public static final STRING:Ljava/lang/String; = "com.mwr.example.sieve.STRING"

.field private static final TAG:Ljava/lang/String; = "m_CryptoService"


# instance fields
.field private responseHandler:Landroid/os/Messenger;

.field private serviceHandler:Landroid/os/Messenger;

.field private serviceLooper:Landroid/os/Looper;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    const-string v0, "encrypt"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 41
    const-string v0, "decrypt"

    invoke-static {v0}, Ljava/lang/System;->loadLibrary(Ljava/lang/String;)V

    .line 16
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    return-void
.end method

.method static synthetic access$0(Lcom/mwr/example/sieve/CryptoService;Landroid/os/Messenger;)V
    .locals 0

    .prologue
    .line 30
    iput-object p1, p0, Lcom/mwr/example/sieve/CryptoService;->responseHandler:Landroid/os/Messenger;

    return-void
.end method

.method static synthetic access$1(Lcom/mwr/example/sieve/CryptoService;Ljava/lang/String;Ljava/lang/String;)[B
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0, p1, p2}, Lcom/mwr/example/sieve/CryptoService;->encrypt(Ljava/lang/String;Ljava/lang/String;)[B

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$2(Lcom/mwr/example/sieve/CryptoService;Ljava/lang/String;[B)Ljava/lang/String;
    .locals 1

    .prologue
    .line 71
    invoke-direct {p0, p1, p2}, Lcom/mwr/example/sieve/CryptoService;->decrypt(Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$3(Lcom/mwr/example/sieve/CryptoService;)Landroid/os/Messenger;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/mwr/example/sieve/CryptoService;->responseHandler:Landroid/os/Messenger;

    return-object v0
.end method

.method private decrypt(Ljava/lang/String;[B)Ljava/lang/String;
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "string"    # [B

    .prologue
    .line 72
    const/4 v1, 0x0

    .line 74
    .local v1, "out":Ljava/lang/String;
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/mwr/example/sieve/CryptoService;->runNDKdecrypt(Ljava/lang/String;[B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 79
    :goto_0
    return-object v1

    .line 75
    :catch_0
    move-exception v0

    .line 76
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "m_CryptoService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ERROR: Error during decrytion: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private encrypt(Ljava/lang/String;Ljava/lang/String;)[B
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "string"    # Ljava/lang/String;

    .prologue
    .line 61
    const/4 v1, 0x0

    check-cast v1, [B

    .line 63
    .local v1, "out":[B
    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/mwr/example/sieve/CryptoService;->runNDKencrypt(Ljava/lang/String;Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 68
    :goto_0
    return-object v1

    .line 64
    :catch_0
    move-exception v0

    .line 65
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "m_CryptoService"

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "ERROR: Error during encrytion: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private native runNDKdecrypt(Ljava/lang/String;[B)Ljava/lang/String;
.end method

.method private native runNDKencrypt(Ljava/lang/String;Ljava/lang/String;)[B
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "arg0"    # Landroid/content/Intent;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/mwr/example/sieve/CryptoService;->serviceHandler:Landroid/os/Messenger;

    invoke-virtual {v0}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    move-result-object v0

    return-object v0
.end method

.method public onCreate()V
    .locals 4

    .prologue
    .line 46
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "m_CryptoService"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    .line 47
    .local v0, "thread":Landroid/os/HandlerThread;
    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 48
    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    iput-object v1, p0, Lcom/mwr/example/sieve/CryptoService;->serviceLooper:Landroid/os/Looper;

    .line 49
    new-instance v1, Landroid/os/Messenger;

    new-instance v2, Lcom/mwr/example/sieve/CryptoService$MessageHandler;

    iget-object v3, p0, Lcom/mwr/example/sieve/CryptoService;->serviceLooper:Landroid/os/Looper;

    invoke-direct {v2, p0, v3}, Lcom/mwr/example/sieve/CryptoService$MessageHandler;-><init>(Lcom/mwr/example/sieve/CryptoService;Landroid/os/Looper;)V

    invoke-direct {v1, v2}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    iput-object v1, p0, Lcom/mwr/example/sieve/CryptoService;->serviceHandler:Landroid/os/Messenger;

    .line 50
    return-void
.end method
