.class public Lcom/mwr/example/sieve/ShortLoginActivity;
.super Landroid/app/Activity;
.source "ShortLoginActivity.java"

# interfaces
.implements Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;


# static fields
.field public static final PASSWORD:Ljava/lang/String; = "com.mwr.example.sieve.PASSWORD"

.field public static final PIN:Ljava/lang/String; = "com.mwr.example.sieve.PIN"

.field public static final TAG:Ljava/lang/String; = "m_ShortLogin"


# instance fields
.field private connectionError:Landroid/app/AlertDialog$Builder;

.field private mainKey:Ljava/lang/String;

.field private prompt:Landroid/widget/TextView;

.field private pwEntry:Landroid/widget/EditText;

.field private serviceConnection:Lcom/mwr/example/sieve/AuthServiceConnector;

.field private submitButton:Landroid/widget/Button;

.field private workingPIN:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 17
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 36
    iput-object v0, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->workingPIN:Ljava/lang/String;

    .line 37
    iput-object v0, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->mainKey:Ljava/lang/String;

    .line 17
    return-void
.end method

.method private unbind()V
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->serviceConnection:Lcom/mwr/example/sieve/AuthServiceConnector;

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/ShortLoginActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 45
    return-void
.end method


# virtual methods
.method public checkKeyResult(Z)V
    .locals 2
    .param p1, "status"    # Z

    .prologue
    .line 152
    const-string v0, "m_ShortLogin"

    const-string v1, "called checkKeyResult?"

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 154
    return-void
.end method

.method public checkPinResult(Z)V
    .locals 0
    .param p1, "status"    # Z

    .prologue
    .line 158
    if-eqz p1, :cond_0

    .line 159
    invoke-virtual {p0}, Lcom/mwr/example/sieve/ShortLoginActivity;->loginSuccessful()V

    .line 165
    :goto_0
    return-void

    .line 162
    :cond_0
    invoke-virtual {p0}, Lcom/mwr/example/sieve/ShortLoginActivity;->loginFailed()V

    goto :goto_0
.end method

.method public connected()V
    .locals 2

    .prologue
    .line 134
    iget-object v0, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->submitButton:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 136
    return-void
.end method

.method public firstLaunchResult(I)V
    .locals 2
    .param p1, "status"    # I

    .prologue
    .line 169
    const-string v0, "m_ShortLogin"

    const-string v1, "called firstLaunchResult?"

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 171
    return-void
.end method

.method public loginFailed()V
    .locals 2

    .prologue
    .line 127
    iget-object v0, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->prompt:Landroid/widget/TextView;

    const v1, 0x7f050040

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 129
    iget-object v0, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->submitButton:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 130
    return-void
.end method

.method public loginSuccessful()V
    .locals 3

    .prologue
    .line 118
    iget-object v1, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->submitButton:Landroid/widget/Button;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 120
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/PWList;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 121
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.mwr.example.sieve.KEY"

    iget-object v2, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->mainKey:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 122
    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/ShortLoginActivity;->startActivity(Landroid/content/Intent;)V

    .line 123
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 111
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 112
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "android.intent.category.HOME"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 113
    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/ShortLoginActivity;->startActivity(Landroid/content/Intent;)V

    .line 114
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 50
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 51
    const v1, 0x7f030006

    invoke-virtual {p0, v1}, Lcom/mwr/example/sieve/ShortLoginActivity;->setContentView(I)V

    .line 52
    new-instance v1, Lcom/mwr/example/sieve/AuthServiceConnector;

    invoke-direct {v1, p0}, Lcom/mwr/example/sieve/AuthServiceConnector;-><init>(Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;)V

    iput-object v1, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->serviceConnection:Lcom/mwr/example/sieve/AuthServiceConnector;

    .line 54
    invoke-virtual {p0}, Lcom/mwr/example/sieve/ShortLoginActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 55
    .local v0, "callingIntent":Landroid/content/Intent;
    const-string v1, "com.mwr.example.sieve.PASSWORD"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->mainKey:Ljava/lang/String;

    .line 57
    const v1, 0x7f080027

    invoke-virtual {p0, v1}, Lcom/mwr/example/sieve/ShortLoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    iput-object v1, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->pwEntry:Landroid/widget/EditText;

    .line 58
    const v1, 0x7f080029

    invoke-virtual {p0, v1}, Lcom/mwr/example/sieve/ShortLoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->prompt:Landroid/widget/TextView;

    .line 59
    const v1, 0x7f080028

    invoke-virtual {p0, v1}, Lcom/mwr/example/sieve/ShortLoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    iput-object v1, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->submitButton:Landroid/widget/Button;

    .line 60
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->connectionError:Landroid/app/AlertDialog$Builder;

    .line 61
    iget-object v1, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->connectionError:Landroid/app/AlertDialog$Builder;

    const v2, 0x7f050008

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 62
    const-string v2, "Error"

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 63
    iget-object v1, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->connectionError:Landroid/app/AlertDialog$Builder;

    const-string v2, "OK"

    new-instance v3, Lcom/mwr/example/sieve/ShortLoginActivity$1;

    invoke-direct {v3, p0}, Lcom/mwr/example/sieve/ShortLoginActivity$1;-><init>(Lcom/mwr/example/sieve/ShortLoginActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 71
    iget-object v1, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->connectionError:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 74
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 93
    invoke-virtual {p0}, Lcom/mwr/example/sieve/ShortLoginActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f070007

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 94
    const/4 v0, 0x1

    return v0
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 78
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 79
    invoke-direct {p0}, Lcom/mwr/example/sieve/ShortLoginActivity;->unbind()V

    .line 80
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 84
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 85
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/AuthService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->serviceConnection:Lcom/mwr/example/sieve/AuthServiceConnector;

    .line 86
    const/4 v2, 0x1

    .line 85
    invoke-virtual {p0, v0, v1, v2}, Lcom/mwr/example/sieve/ShortLoginActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 87
    return-void
.end method

.method public sendFailed()V
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->connectionError:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 179
    return-void
.end method

.method public setKeyResult(Z)V
    .locals 2
    .param p1, "stauts"    # Z

    .prologue
    .line 140
    const-string v0, "m_ShortLogin"

    const-string v1, "called setKeyResult?"

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    return-void
.end method

.method public setPinResult(Z)V
    .locals 2
    .param p1, "status"    # Z

    .prologue
    .line 146
    const-string v0, "m_ShortLogin"

    const-string v1, "called setPinResult?"

    invoke-static {v0, v1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    return-void
.end method

.method public submit(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 99
    iget-object v0, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->pwEntry:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->workingPIN:Ljava/lang/String;

    .line 100
    const-string v0, "m_ShortLogin"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "user has entered a pin: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->workingPIN:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    iget-object v0, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->serviceConnection:Lcom/mwr/example/sieve/AuthServiceConnector;

    iget-object v1, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->workingPIN:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mwr/example/sieve/AuthServiceConnector;->checkPin(Ljava/lang/String;)V

    .line 103
    iget-object v0, p0, Lcom/mwr/example/sieve/ShortLoginActivity;->submitButton:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 105
    return-void
.end method
