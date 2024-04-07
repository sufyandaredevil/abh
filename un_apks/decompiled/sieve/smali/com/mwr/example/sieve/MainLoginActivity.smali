.class public Lcom/mwr/example/sieve/MainLoginActivity;
.super Landroid/app/Activity;
.source "MainLoginActivity.java"

# interfaces
.implements Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;


# static fields
.field private static final IS_AUTHENTICATED:I = 0x44fdab

.field public static final MAIN_PIN:I = 0x2

.field public static final MAIN_SETTINGS:I = 0x3

.field public static final MAIN_WELCOME:I = 0x1

.field private static final NOT_AUTHENTICATED:I = 0x9fe8b

.field private static final NOT_INITALISED:I = 0xe1750

.field public static final PASSWORD:Ljava/lang/String; = "com.mwr.example.sieve.PASSWORD"

.field public static final PIN:Ljava/lang/String; = "com.mwr.example.sieve.PIN"

.field private static final TAG:Ljava/lang/String; = "m_MainLogin"


# instance fields
.field entry:Landroid/widget/EditText;

.field login_button:Landroid/widget/Button;

.field prompt:Landroid/widget/TextView;

.field private serviceConnection:Lcom/mwr/example/sieve/AuthServiceConnector;

.field private state:I

.field private workingIntent:Landroid/content/Intent;

.field private workingPassword:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 28
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 57
    const v0, 0xe1750

    iput v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->state:I

    .line 60
    iput-object v1, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingPassword:Ljava/lang/String;

    .line 61
    iput-object v1, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingIntent:Landroid/content/Intent;

    .line 28
    return-void
.end method

.method private initaliseActivity()V
    .locals 1

    .prologue
    .line 97
    const v0, 0x7f030002

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/MainLoginActivity;->setContentView(I)V

    .line 99
    const v0, 0x7f080011

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/MainLoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->entry:Landroid/widget/EditText;

    .line 100
    const v0, 0x7f080010

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/MainLoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->login_button:Landroid/widget/Button;

    .line 101
    const v0, 0x7f080013

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/MainLoginActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->prompt:Landroid/widget/TextView;

    .line 102
    return-void
.end method

.method private loginFailed()V
    .locals 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->prompt:Landroid/widget/TextView;

    const v1, 0x7f050040

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 128
    iget-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->login_button:Landroid/widget/Button;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 129
    return-void
.end method

.method private loginSuccessful()V
    .locals 3

    .prologue
    .line 115
    iget-object v1, p0, Lcom/mwr/example/sieve/MainLoginActivity;->login_button:Landroid/widget/Button;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setEnabled(Z)V

    .line 117
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/PWList;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 118
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.mwr.example.sieve.KEY"

    iget-object v2, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingPassword:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 119
    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 121
    const v1, 0x44fdab

    iput v1, p0, Lcom/mwr/example/sieve/MainLoginActivity;->state:I

    .line 122
    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/MainLoginActivity;->startActivity(Landroid/content/Intent;)V

    .line 123
    return-void
.end method

.method private openSettings()V
    .locals 2

    .prologue
    .line 225
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/SettingsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/mwr/example/sieve/MainLoginActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 226
    return-void
.end method

.method private setPin()V
    .locals 3

    .prologue
    .line 249
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/PINActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 250
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.mwr.example.sieve.REQUEST"

    const v2, 0x69b5b

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 252
    const/4 v1, 0x2

    invoke-virtual {p0, v0, v1}, Lcom/mwr/example/sieve/MainLoginActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 253
    return-void
.end method

.method private unbind()V
    .locals 1

    .prologue
    .line 262
    iget-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->serviceConnection:Lcom/mwr/example/sieve/AuthServiceConnector;

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/MainLoginActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 263
    return-void
.end method

.method private welcomeUser()V
    .locals 2

    .prologue
    .line 266
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/WelcomeActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/mwr/example/sieve/MainLoginActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 267
    return-void
.end method


# virtual methods
.method public checkKeyResult(Z)V
    .locals 0
    .param p1, "status"    # Z

    .prologue
    .line 65
    if-eqz p1, :cond_0

    .line 66
    invoke-direct {p0}, Lcom/mwr/example/sieve/MainLoginActivity;->loginSuccessful()V

    .line 69
    :goto_0
    return-void

    .line 68
    :cond_0
    invoke-direct {p0}, Lcom/mwr/example/sieve/MainLoginActivity;->loginFailed()V

    goto :goto_0
.end method

.method public checkPinResult(Z)V
    .locals 0
    .param p1, "status"    # Z

    .prologue
    .line 72
    return-void
.end method

.method public connected()V
    .locals 1

    .prologue
    .line 76
    iget-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->serviceConnection:Lcom/mwr/example/sieve/AuthServiceConnector;

    invoke-virtual {v0}, Lcom/mwr/example/sieve/AuthServiceConnector;->checkFirstLaunch()V

    .line 77
    return-void
.end method

.method public firstLaunchResult(I)V
    .locals 0
    .param p1, "status"    # I

    .prologue
    .line 81
    packed-switch p1, :pswitch_data_0

    .line 94
    :goto_0
    return-void

    .line 83
    :pswitch_0
    invoke-direct {p0}, Lcom/mwr/example/sieve/MainLoginActivity;->welcomeUser()V

    goto :goto_0

    .line 87
    :pswitch_1
    invoke-direct {p0}, Lcom/mwr/example/sieve/MainLoginActivity;->setPin()V

    goto :goto_0

    .line 91
    :pswitch_2
    invoke-direct {p0}, Lcom/mwr/example/sieve/MainLoginActivity;->initaliseActivity()V

    goto :goto_0

    .line 81
    :pswitch_data_0
    .packed-switch 0x1f
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public login(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 105
    iget-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->entry:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-interface {v0}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingPassword:Ljava/lang/String;

    .line 107
    const-string v0, "m_MainLogin"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "String enetered: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingPassword:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    iget-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->serviceConnection:Lcom/mwr/example/sieve/AuthServiceConnector;

    iget-object v1, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingPassword:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/mwr/example/sieve/AuthServiceConnector;->checkKey(Ljava/lang/String;)V

    .line 111
    iget-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->login_button:Landroid/widget/Button;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setEnabled(Z)V

    .line 112
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v0, -0x1

    .line 133
    packed-switch p1, :pswitch_data_0

    .line 144
    :cond_0
    :goto_0
    return-void

    .line 135
    :pswitch_0
    if-ne p2, v0, :cond_0

    .line 136
    iput-object p3, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingIntent:Landroid/content/Intent;

    goto :goto_0

    .line 140
    :pswitch_1
    if-ne p2, v0, :cond_0

    .line 141
    iput-object p3, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingIntent:Landroid/content/Intent;

    goto :goto_0

    .line 133
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 148
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 149
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "android.intent.category.HOME"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 151
    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/MainLoginActivity;->startActivity(Landroid/content/Intent;)V

    .line 152
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 156
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 158
    new-instance v0, Lcom/mwr/example/sieve/AuthServiceConnector;

    invoke-direct {v0, p0}, Lcom/mwr/example/sieve/AuthServiceConnector;-><init>(Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->serviceConnection:Lcom/mwr/example/sieve/AuthServiceConnector;

    .line 160
    const v0, 0x9fe8b

    iput v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->state:I

    .line 161
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 165
    invoke-virtual {p0}, Lcom/mwr/example/sieve/MainLoginActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f070003

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 166
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 171
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 181
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 173
    :sswitch_0
    invoke-virtual {p0}, Lcom/mwr/example/sieve/MainLoginActivity;->onBackPressed()V

    goto :goto_0

    .line 177
    :sswitch_1
    invoke-direct {p0}, Lcom/mwr/example/sieve/MainLoginActivity;->openSettings()V

    goto :goto_0

    .line 171
    nop

    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_0
        0x7f080033 -> :sswitch_1
    .end sparse-switch
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 187
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 188
    invoke-direct {p0}, Lcom/mwr/example/sieve/MainLoginActivity;->unbind()V

    .line 189
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 193
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 195
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/AuthService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/mwr/example/sieve/MainLoginActivity;->serviceConnection:Lcom/mwr/example/sieve/AuthServiceConnector;

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/mwr/example/sieve/MainLoginActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 197
    iget v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->state:I

    sparse-switch v0, :sswitch_data_0

    .line 215
    :cond_0
    :goto_0
    return-void

    .line 200
    :sswitch_0
    iget-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingIntent:Landroid/content/Intent;

    if-eqz v0, :cond_0

    .line 201
    iget-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingIntent:Landroid/content/Intent;

    const-string v1, "com.mwr.example.sieve.PASS"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 202
    iget-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->serviceConnection:Lcom/mwr/example/sieve/AuthServiceConnector;

    iget-object v1, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingIntent:Landroid/content/Intent;

    const-string v2, "com.mwr.example.sieve.PASS"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mwr/example/sieve/AuthServiceConnector;->setKey(Ljava/lang/String;)V

    .line 207
    :cond_1
    :goto_1
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingIntent:Landroid/content/Intent;

    goto :goto_0

    .line 204
    :cond_2
    iget-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingIntent:Landroid/content/Intent;

    const-string v1, "com.mwr.example.sieve.PIN"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 205
    iget-object v0, p0, Lcom/mwr/example/sieve/MainLoginActivity;->serviceConnection:Lcom/mwr/example/sieve/AuthServiceConnector;

    iget-object v1, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingIntent:Landroid/content/Intent;

    const-string v2, "com.mwr.example.sieve.PIN"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mwr/example/sieve/AuthServiceConnector;->setPin(Ljava/lang/String;)V

    goto :goto_1

    .line 211
    :sswitch_1
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/ShortLoginActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "com.mwr.example.sieve.PASSWORD"

    iget-object v2, p0, Lcom/mwr/example/sieve/MainLoginActivity;->workingPassword:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/MainLoginActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 197
    :sswitch_data_0
    .sparse-switch
        0x9fe8b -> :sswitch_0
        0xe1750 -> :sswitch_0
        0x44fdab -> :sswitch_1
    .end sparse-switch
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 219
    invoke-super {p0}, Landroid/app/Activity;->onStart()V

    .line 221
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/AuthService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/MainLoginActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 222
    return-void
.end method

.method public sendFailed()V
    .locals 3

    .prologue
    .line 229
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 230
    const v1, 0x7f050008

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 231
    const-string v1, "Error"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 232
    const-string v1, "OK"

    new-instance v2, Lcom/mwr/example/sieve/MainLoginActivity$1;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/MainLoginActivity$1;-><init>(Lcom/mwr/example/sieve/MainLoginActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 238
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 239
    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    .line 240
    return-void
.end method

.method public setKeyResult(Z)V
    .locals 0
    .param p1, "status"    # Z

    .prologue
    .line 244
    if-nez p1, :cond_0

    .line 245
    invoke-virtual {p0}, Lcom/mwr/example/sieve/MainLoginActivity;->sendFailed()V

    .line 246
    :cond_0
    return-void
.end method

.method public setPinResult(Z)V
    .locals 0
    .param p1, "status"    # Z

    .prologue
    .line 257
    if-nez p1, :cond_0

    .line 258
    invoke-virtual {p0}, Lcom/mwr/example/sieve/MainLoginActivity;->sendFailed()V

    .line 259
    :cond_0
    return-void
.end method
