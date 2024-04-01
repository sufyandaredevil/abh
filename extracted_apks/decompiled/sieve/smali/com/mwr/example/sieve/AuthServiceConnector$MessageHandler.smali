.class Lcom/mwr/example/sieve/AuthServiceConnector$MessageHandler;
.super Landroid/os/Handler;
.source "AuthServiceConnector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mwr/example/sieve/AuthServiceConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MessageHandler"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mwr/example/sieve/AuthServiceConnector;


# direct methods
.method public constructor <init>(Lcom/mwr/example/sieve/AuthServiceConnector;)V
    .locals 0

    .prologue
    .line 139
    iput-object p1, p0, Lcom/mwr/example/sieve/AuthServiceConnector$MessageHandler;->this$0:Lcom/mwr/example/sieve/AuthServiceConnector;

    .line 140
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 142
    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 4
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 147
    iget v2, p1, Landroid/os/Message;->what:I

    sparse-switch v2, :sswitch_data_0

    .line 175
    :goto_0
    const-string v0, "m_AuthServiceConnector"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error: Recieved unrecognised Message, what: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p1, Landroid/os/Message;->what:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ", arg1: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Landroid/os/Message;->arg1:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 178
    :goto_1
    return-void

    .line 149
    :sswitch_0
    iget-object v0, p0, Lcom/mwr/example/sieve/AuthServiceConnector$MessageHandler;->this$0:Lcom/mwr/example/sieve/AuthServiceConnector;

    iget-object v0, v0, Lcom/mwr/example/sieve/AuthServiceConnector;->activity:Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;

    iget v1, p1, Landroid/os/Message;->arg1:I

    invoke-interface {v0, v1}, Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;->firstLaunchResult(I)V

    goto :goto_1

    .line 152
    :sswitch_1
    iget v2, p1, Landroid/os/Message;->arg1:I

    packed-switch v2, :pswitch_data_0

    goto :goto_1

    .line 157
    :pswitch_0
    iget-object v2, p0, Lcom/mwr/example/sieve/AuthServiceConnector$MessageHandler;->this$0:Lcom/mwr/example/sieve/AuthServiceConnector;

    iget-object v2, v2, Lcom/mwr/example/sieve/AuthServiceConnector;->activity:Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;

    iget v3, p1, Landroid/os/Message;->arg2:I

    if-nez v3, :cond_1

    :goto_2
    invoke-interface {v2, v0}, Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;->setPinResult(Z)V

    goto :goto_1

    .line 154
    :pswitch_1
    iget-object v2, p0, Lcom/mwr/example/sieve/AuthServiceConnector$MessageHandler;->this$0:Lcom/mwr/example/sieve/AuthServiceConnector;

    iget-object v2, v2, Lcom/mwr/example/sieve/AuthServiceConnector;->activity:Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;

    iget v3, p1, Landroid/os/Message;->arg2:I

    if-nez v3, :cond_0

    :goto_3
    invoke-interface {v2, v0}, Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;->setKeyResult(Z)V

    goto :goto_1

    :cond_0
    move v0, v1

    goto :goto_3

    :cond_1
    move v0, v1

    .line 157
    goto :goto_2

    .line 162
    :sswitch_2
    iget v2, p1, Landroid/os/Message;->arg1:I

    packed-switch v2, :pswitch_data_1

    goto :goto_1

    .line 167
    :pswitch_2
    iget-object v2, p0, Lcom/mwr/example/sieve/AuthServiceConnector$MessageHandler;->this$0:Lcom/mwr/example/sieve/AuthServiceConnector;

    iget-object v2, v2, Lcom/mwr/example/sieve/AuthServiceConnector;->activity:Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;

    iget v3, p1, Landroid/os/Message;->arg2:I

    if-nez v3, :cond_3

    :goto_4
    invoke-interface {v2, v0}, Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;->checkPinResult(Z)V

    goto :goto_1

    .line 164
    :pswitch_3
    iget-object v2, p0, Lcom/mwr/example/sieve/AuthServiceConnector$MessageHandler;->this$0:Lcom/mwr/example/sieve/AuthServiceConnector;

    iget-object v2, v2, Lcom/mwr/example/sieve/AuthServiceConnector;->activity:Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;

    iget v3, p1, Landroid/os/Message;->arg2:I

    if-nez v3, :cond_2

    :goto_5
    invoke-interface {v2, v0}, Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;->checkKeyResult(Z)V

    goto :goto_1

    :cond_2
    move v0, v1

    goto :goto_5

    :cond_3
    move v0, v1

    .line 167
    goto :goto_4

    .line 172
    :sswitch_3
    iget-object v0, p0, Lcom/mwr/example/sieve/AuthServiceConnector$MessageHandler;->this$0:Lcom/mwr/example/sieve/AuthServiceConnector;

    iget-object v0, v0, Lcom/mwr/example/sieve/AuthServiceConnector;->activity:Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;

    invoke-interface {v0}, Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;->sendFailed()V

    goto :goto_0

    .line 147
    :sswitch_data_0
    .sparse-switch
        0x3 -> :sswitch_0
        0x4 -> :sswitch_1
        0x5 -> :sswitch_2
        0x1b207 -> :sswitch_3
    .end sparse-switch

    .line 152
    :pswitch_data_0
    .packed-switch 0x29
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 162
    :pswitch_data_1
    .packed-switch 0x29
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
