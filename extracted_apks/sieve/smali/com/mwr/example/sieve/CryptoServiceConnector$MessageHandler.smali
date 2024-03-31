.class Lcom/mwr/example/sieve/CryptoServiceConnector$MessageHandler;
.super Landroid/os/Handler;
.source "CryptoServiceConnector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mwr/example/sieve/CryptoServiceConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MessageHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mwr/example/sieve/CryptoServiceConnector;


# direct methods
.method public constructor <init>(Lcom/mwr/example/sieve/CryptoServiceConnector;)V
    .locals 0

    .prologue
    .line 128
    iput-object p1, p0, Lcom/mwr/example/sieve/CryptoServiceConnector$MessageHandler;->this$0:Lcom/mwr/example/sieve/CryptoServiceConnector;

    .line 129
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 131
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 136
    iget v0, p1, Landroid/os/Message;->what:I

    sparse-switch v0, :sswitch_data_0

    .line 152
    :goto_0
    return-void

    .line 138
    :sswitch_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 140
    :pswitch_0
    iget-object v0, p0, Lcom/mwr/example/sieve/CryptoServiceConnector$MessageHandler;->this$0:Lcom/mwr/example/sieve/CryptoServiceConnector;

    iget-object v0, v0, Lcom/mwr/example/sieve/CryptoServiceConnector;->activity:Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "com.mwr.example.sieve.RESULT"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0, v1, v2}, Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;->encryptionReturned([BI)V

    goto :goto_0

    .line 143
    :pswitch_1
    iget-object v0, p0, Lcom/mwr/example/sieve/CryptoServiceConnector$MessageHandler;->this$0:Lcom/mwr/example/sieve/CryptoServiceConnector;

    iget-object v0, v0, Lcom/mwr/example/sieve/CryptoServiceConnector;->activity:Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;

    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    const-string v2, "com.mwr.example.sieve.RESULT"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0, v1, v2}, Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;->decryptionReturned(Ljava/lang/String;I)V

    goto :goto_0

    .line 148
    :sswitch_1
    iget-object v0, p0, Lcom/mwr/example/sieve/CryptoServiceConnector$MessageHandler;->this$0:Lcom/mwr/example/sieve/CryptoServiceConnector;

    iget-object v0, v0, Lcom/mwr/example/sieve/CryptoServiceConnector;->activity:Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;

    invoke-interface {v0}, Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;->sendFailed()V

    goto :goto_0

    .line 136
    :sswitch_data_0
    .sparse-switch
        0x9 -> :sswitch_0
        0x1b207 -> :sswitch_1
    .end sparse-switch

    .line 138
    :pswitch_data_0
    .packed-switch 0x5b
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
