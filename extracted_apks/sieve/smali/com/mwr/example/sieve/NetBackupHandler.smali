.class public Lcom/mwr/example/sieve/NetBackupHandler;
.super Ljava/lang/Object;
.source "NetBackupHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/mwr/example/sieve/NetBackupHandler$NetBackup;,
        Lcom/mwr/example/sieve/NetBackupHandler$NetRestore;,
        Lcom/mwr/example/sieve/NetBackupHandler$ResultListener;
    }
.end annotation


# static fields
.field public static final BACKUP_SUCCESS:I = 0x7043b

.field private static final END_HEADER:Ljava/lang/String; = "\r\n\r\n"

.field private static final GET_REQUEST:Ljava/lang/String; = "GET /Backup.xml HTTP/1.1"

.field private static final NOT_RUNNING:I = 0x3b7c4

.field public static final OPERATION_FAILED:I = 0x5bbd

.field private static final POST_REQUEST:Ljava/lang/String; = "POST /Backup.xml HTTP/1.1"

.field public static final RESTORE_SUCCESS:I = 0xb6111

.field private static final RUNNING_BACKUP:I = 0x252c8b

.field private static final RUNNING_RESTORE:I = 0x4054cea

.field private static final TAG:Ljava/lang/String; = "m_NetBackup"


# instance fields
.field private port:Ljava/lang/String;

.field private result:I

.field private rl:Lcom/mwr/example/sieve/NetBackupHandler$ResultListener;

.field private state:I

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/mwr/example/sieve/NetBackupHandler$ResultListener;)V
    .locals 1
    .param p1, "iurl"    # Ljava/lang/String;
    .param p2, "iport"    # Ljava/lang/String;
    .param p3, "irl"    # Lcom/mwr/example/sieve/NetBackupHandler$ResultListener;

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    const v0, 0x3b7c4

    iput v0, p0, Lcom/mwr/example/sieve/NetBackupHandler;->state:I

    .line 37
    const/4 v0, -0x1

    iput v0, p0, Lcom/mwr/example/sieve/NetBackupHandler;->result:I

    .line 48
    const-string v0, "localhost"

    iput-object v0, p0, Lcom/mwr/example/sieve/NetBackupHandler;->url:Ljava/lang/String;

    .line 49
    const-string v0, "8000"

    iput-object v0, p0, Lcom/mwr/example/sieve/NetBackupHandler;->port:Ljava/lang/String;

    .line 92
    iput-object p1, p0, Lcom/mwr/example/sieve/NetBackupHandler;->url:Ljava/lang/String;

    .line 93
    iput-object p2, p0, Lcom/mwr/example/sieve/NetBackupHandler;->port:Ljava/lang/String;

    .line 95
    iput-object p3, p0, Lcom/mwr/example/sieve/NetBackupHandler;->rl:Lcom/mwr/example/sieve/NetBackupHandler$ResultListener;

    .line 96
    return-void
.end method

.method static synthetic access$0(Lcom/mwr/example/sieve/NetBackupHandler;)Ljava/net/Socket;
    .locals 1

    .prologue
    .line 60
    invoke-direct {p0}, Lcom/mwr/example/sieve/NetBackupHandler;->getNewHttpConnection()Ljava/net/Socket;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1(Lcom/mwr/example/sieve/NetBackupHandler;I)V
    .locals 0

    .prologue
    .line 37
    iput p1, p0, Lcom/mwr/example/sieve/NetBackupHandler;->result:I

    return-void
.end method

.method static synthetic access$2(Lcom/mwr/example/sieve/NetBackupHandler;I)V
    .locals 0

    .prologue
    .line 36
    iput p1, p0, Lcom/mwr/example/sieve/NetBackupHandler;->state:I

    return-void
.end method

.method static synthetic access$3(Lcom/mwr/example/sieve/NetBackupHandler;)Lcom/mwr/example/sieve/NetBackupHandler$ResultListener;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/mwr/example/sieve/NetBackupHandler;->rl:Lcom/mwr/example/sieve/NetBackupHandler$ResultListener;

    return-object v0
.end method

.method static synthetic access$4(Lcom/mwr/example/sieve/NetBackupHandler;)I
    .locals 1

    .prologue
    .line 37
    iget v0, p0, Lcom/mwr/example/sieve/NetBackupHandler;->result:I

    return v0
.end method

.method private getNewHttpConnection()Ljava/net/Socket;
    .locals 6

    .prologue
    .line 63
    new-instance v2, Lcom/mwr/example/sieve/NetBackupHandler$1;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/NetBackupHandler$1;-><init>(Lcom/mwr/example/sieve/NetBackupHandler;)V

    .line 77
    .local v2, "tm":Ljavax/net/ssl/TrustManager;
    :try_start_0
    const-string v3, "TLS"

    invoke-static {v3}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v0

    .line 78
    .local v0, "context":Ljavax/net/ssl/SSLContext;
    const/4 v3, 0x0

    new-array v3, v3, [Ljavax/net/ssl/KeyManager;

    const/4 v4, 0x1

    new-array v4, v4, [Ljavax/net/ssl/TrustManager;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    new-instance v5, Ljava/security/SecureRandom;

    invoke-direct {v5}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v0, v3, v4, v5}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 79
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v3

    iget-object v4, p0, Lcom/mwr/example/sieve/NetBackupHandler;->url:Ljava/lang/String;

    iget-object v5, p0, Lcom/mwr/example/sieve/NetBackupHandler;->port:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v3, v4, v5}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 86
    .end local v0    # "context":Ljavax/net/ssl/SSLContext;
    :goto_0
    return-object v3

    .line 82
    :catch_0
    move-exception v1

    .line 83
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "m_NetBackup"

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "ERROR: Socket createion error: "

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    const/4 v3, 0x0

    goto :goto_0
.end method


# virtual methods
.method public declared-synchronized performNetBackup(Ljava/lang/String;)V
    .locals 3
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 100
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/mwr/example/sieve/NetBackupHandler;->state:I

    const v1, 0x3b7c4

    if-ne v0, v1, :cond_0

    .line 101
    const v0, 0x252c8b

    iput v0, p0, Lcom/mwr/example/sieve/NetBackupHandler;->state:I

    .line 102
    new-instance v0, Lcom/mwr/example/sieve/NetBackupHandler$NetBackup;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mwr/example/sieve/NetBackupHandler$NetBackup;-><init>(Lcom/mwr/example/sieve/NetBackupHandler;Lcom/mwr/example/sieve/NetBackupHandler$NetBackup;)V

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-virtual {v0, v1}, Lcom/mwr/example/sieve/NetBackupHandler$NetBackup;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    :cond_0
    monitor-exit p0

    return-void

    .line 100
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized performNetRestore()V
    .locals 2

    .prologue
    .line 110
    monitor-enter p0

    :try_start_0
    const-string v0, "m_NetBackup"

    const-string v1, "performNetRestore"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    iget v0, p0, Lcom/mwr/example/sieve/NetBackupHandler;->state:I

    const v1, 0x3b7c4

    if-ne v0, v1, :cond_0

    .line 112
    const v0, 0x4054cea

    iput v0, p0, Lcom/mwr/example/sieve/NetBackupHandler;->state:I

    .line 113
    new-instance v0, Lcom/mwr/example/sieve/NetBackupHandler$NetRestore;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/mwr/example/sieve/NetBackupHandler$NetRestore;-><init>(Lcom/mwr/example/sieve/NetBackupHandler;Lcom/mwr/example/sieve/NetBackupHandler$NetRestore;)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-virtual {v0, v1}, Lcom/mwr/example/sieve/NetBackupHandler$NetRestore;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    :cond_0
    monitor-exit p0

    return-void

    .line 110
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
