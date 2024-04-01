.class public Lcom/mwr/example/sieve/AddEntryActivity;
.super Landroid/app/Activity;
.source "AddEntryActivity.java"


# static fields
.field public static final ENTRY:Ljava/lang/String; = "com.mwr.example.sieve.ENTRY"

.field public static final REQUEST:Ljava/lang/String; = "com.mwr.example.sieve.REQUEST"

.field public static final REQUEST_ADD:I = 0x110d

.field public static final REQUEST_EDIT:I = 0x92a

.field private static final TAG:Ljava/lang/String; = "m_AddEntry"


# instance fields
.field ausDelete:Landroid/app/AlertDialog$Builder;

.field private editEmail:Landroid/widget/EditText;

.field private editPassword:Landroid/widget/EditText;

.field private editPasswordAgain:Landroid/widget/EditText;

.field private editService:Landroid/widget/EditText;

.field private editUsername:Landroid/widget/EditText;

.field private prompt:Landroid/widget/TextView;

.field private requestCode:I

.field resultIntent:Landroid/content/Intent;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 16
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->requestCode:I

    .line 16
    return-void
.end method

.method static synthetic access$0(Lcom/mwr/example/sieve/AddEntryActivity;)V
    .locals 0

    .prologue
    .line 166
    invoke-direct {p0}, Lcom/mwr/example/sieve/AddEntryActivity;->returnForDelete()V

    return-void
.end method

.method private cancel()V
    .locals 2

    .prologue
    .line 208
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/PWList;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->resultIntent:Landroid/content/Intent;

    .line 209
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/mwr/example/sieve/AddEntryActivity;->resultIntent:Landroid/content/Intent;

    invoke-virtual {p0, v0, v1}, Lcom/mwr/example/sieve/AddEntryActivity;->setResult(ILandroid/content/Intent;)V

    .line 210
    invoke-virtual {p0}, Lcom/mwr/example/sieve/AddEntryActivity;->finish()V

    .line 211
    return-void
.end method

.method private fillData(Lcom/mwr/example/sieve/PasswordEntry;)V
    .locals 2
    .param p1, "pe"    # Lcom/mwr/example/sieve/PasswordEntry;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editService:Landroid/widget/EditText;

    iget-object v1, p1, Lcom/mwr/example/sieve/PasswordEntry;->service:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 147
    iget-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editUsername:Landroid/widget/EditText;

    iget-object v1, p1, Lcom/mwr/example/sieve/PasswordEntry;->username:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 149
    iget-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editEmail:Landroid/widget/EditText;

    iget-object v1, p1, Lcom/mwr/example/sieve/PasswordEntry;->email:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 151
    iget-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editPassword:Landroid/widget/EditText;

    iget-object v1, p1, Lcom/mwr/example/sieve/PasswordEntry;->password:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 153
    iget-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editPasswordAgain:Landroid/widget/EditText;

    iget-object v1, p1, Lcom/mwr/example/sieve/PasswordEntry;->password:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 155
    return-void
.end method

.method private returnForDelete()V
    .locals 2

    .prologue
    .line 167
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/PWList;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->resultIntent:Landroid/content/Intent;

    .line 168
    const/4 v0, -0x1

    iget-object v1, p0, Lcom/mwr/example/sieve/AddEntryActivity;->resultIntent:Landroid/content/Intent;

    invoke-virtual {p0, v0, v1}, Lcom/mwr/example/sieve/AddEntryActivity;->setResult(ILandroid/content/Intent;)V

    .line 169
    invoke-virtual {p0}, Lcom/mwr/example/sieve/AddEntryActivity;->finish()V

    .line 170
    return-void
.end method

.method private returnToActivity()V
    .locals 8

    .prologue
    const v7, 0x7f050040

    .line 176
    iget-object v5, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editService:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    .line 177
    .local v2, "service":Ljava/lang/String;
    iget-object v5, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editUsername:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v4

    .line 178
    .local v4, "username":Ljava/lang/String;
    iget-object v5, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editEmail:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v0

    .line 181
    .local v0, "email":Ljava/lang/String;
    iget-object v5, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editPassword:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    .line 182
    .local v1, "one":Ljava/lang/String;
    iget-object v5, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editPasswordAgain:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    .line 186
    .local v3, "two":Ljava/lang/String;
    if-eqz v1, :cond_0

    const-string v5, ""

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 187
    :cond_0
    iget-object v5, p0, Lcom/mwr/example/sieve/AddEntryActivity;->prompt:Landroid/widget/TextView;

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(I)V

    .line 203
    :goto_0
    return-void

    .line 189
    :cond_1
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 191
    iget-object v5, p0, Lcom/mwr/example/sieve/AddEntryActivity;->prompt:Landroid/widget/TextView;

    const v6, 0x7f050030

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 193
    :cond_2
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x4

    if-ge v5, v6, :cond_3

    .line 194
    iget-object v5, p0, Lcom/mwr/example/sieve/AddEntryActivity;->prompt:Landroid/widget/TextView;

    invoke-virtual {v5, v7}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 198
    :cond_3
    iget-object v5, p0, Lcom/mwr/example/sieve/AddEntryActivity;->resultIntent:Landroid/content/Intent;

    const-string v6, "com.mwr.example.sieve.ENTRY"

    new-instance v7, Lcom/mwr/example/sieve/PasswordEntry;

    invoke-direct {v7, v2, v4, v0, v1}, Lcom/mwr/example/sieve/PasswordEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 200
    const/4 v5, -0x1

    iget-object v6, p0, Lcom/mwr/example/sieve/AddEntryActivity;->resultIntent:Landroid/content/Intent;

    invoke-virtual {p0, v5, v6}, Lcom/mwr/example/sieve/AddEntryActivity;->setResult(ILandroid/content/Intent;)V

    .line 201
    invoke-virtual {p0}, Lcom/mwr/example/sieve/AddEntryActivity;->finish()V

    goto :goto_0
.end method


# virtual methods
.method public cancel(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 214
    invoke-direct {p0}, Lcom/mwr/example/sieve/AddEntryActivity;->cancel()V

    .line 215
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 139
    invoke-direct {p0}, Lcom/mwr/example/sieve/AddEntryActivity;->cancel()V

    .line 140
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 43
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 44
    const/high16 v0, 0x7f030000

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/AddEntryActivity;->setContentView(I)V

    .line 46
    const v0, 0x7f080001

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/AddEntryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editService:Landroid/widget/EditText;

    .line 47
    const v0, 0x7f080002

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/AddEntryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editUsername:Landroid/widget/EditText;

    .line 48
    const v0, 0x7f080004

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/AddEntryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editEmail:Landroid/widget/EditText;

    .line 49
    const v0, 0x7f080007

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/AddEntryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editPassword:Landroid/widget/EditText;

    .line 50
    const v0, 0x7f080006

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/AddEntryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->editPasswordAgain:Landroid/widget/EditText;

    .line 52
    const v0, 0x7f08000c

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/AddEntryActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->prompt:Landroid/widget/TextView;

    .line 55
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->ausDelete:Landroid/app/AlertDialog$Builder;

    .line 56
    iget-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->ausDelete:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f050010

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 57
    const-string v1, "Confirm"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 59
    iget-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->ausDelete:Landroid/app/AlertDialog$Builder;

    const-string v1, "Yes"

    new-instance v2, Lcom/mwr/example/sieve/AddEntryActivity$1;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/AddEntryActivity$1;-><init>(Lcom/mwr/example/sieve/AddEntryActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 68
    iget-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->ausDelete:Landroid/app/AlertDialog$Builder;

    const-string v1, "No"

    new-instance v2, Lcom/mwr/example/sieve/AddEntryActivity$2;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/AddEntryActivity$2;-><init>(Lcom/mwr/example/sieve/AddEntryActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 77
    iget-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->ausDelete:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 79
    invoke-virtual {p0}, Lcom/mwr/example/sieve/AddEntryActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    iput-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->resultIntent:Landroid/content/Intent;

    .line 80
    iget-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->resultIntent:Landroid/content/Intent;

    if-nez v0, :cond_0

    .line 81
    const-string v0, "m_AddEntry"

    const-string v1, "requestIntent = null"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    :cond_0
    iget-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->resultIntent:Landroid/content/Intent;

    const-string v1, "com.mwr.example.sieve.REQUEST"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->requestCode:I

    .line 85
    iget v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->requestCode:I

    sparse-switch v0, :sswitch_data_0

    .line 100
    :goto_0
    :sswitch_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_1

    .line 101
    invoke-virtual {p0}, Lcom/mwr/example/sieve/AddEntryActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 103
    :cond_1
    return-void

    .line 93
    :sswitch_1
    iget-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->resultIntent:Landroid/content/Intent;

    const-string v1, "com.mwr.example.sieve.ENTRY"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/mwr/example/sieve/PasswordEntry;

    invoke-direct {p0, v0}, Lcom/mwr/example/sieve/AddEntryActivity;->fillData(Lcom/mwr/example/sieve/PasswordEntry;)V

    goto :goto_0

    .line 85
    :sswitch_data_0
    .sparse-switch
        0x92a -> :sswitch_1
        0x110d -> :sswitch_0
    .end sparse-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 108
    iget v0, p0, Lcom/mwr/example/sieve/AddEntryActivity;->requestCode:I

    packed-switch v0, :pswitch_data_0

    .line 114
    :goto_0
    invoke-virtual {p0}, Lcom/mwr/example/sieve/AddEntryActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f070000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 119
    const/4 v0, 0x1

    return v0

    .line 110
    :pswitch_0
    invoke-virtual {p0}, Lcom/mwr/example/sieve/AddEntryActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f070001

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    goto :goto_0

    .line 108
    nop

    :pswitch_data_0
    .packed-switch 0x92a
        :pswitch_0
    .end packed-switch
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 125
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 134
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 127
    :sswitch_0
    invoke-direct {p0}, Lcom/mwr/example/sieve/AddEntryActivity;->cancel()V

    goto :goto_0

    .line 130
    :sswitch_1
    iget-object v1, p0, Lcom/mwr/example/sieve/AddEntryActivity;->ausDelete:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 125
    nop

    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_0
        0x7f080032 -> :sswitch_1
    .end sparse-switch
.end method

.method public save(Landroid/view/View;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 160
    invoke-direct {p0}, Lcom/mwr/example/sieve/AddEntryActivity;->returnToActivity()V

    .line 162
    return-void
.end method
