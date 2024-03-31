.class public Lcom/mwr/example/sieve/PINActivity;
.super Landroid/app/Activity;
.source "PINActivity.java"


# static fields
.field public static final PIN:Ljava/lang/String; = "com.mwr.example.sieve.PIN"

.field public static final REQUEST:Ljava/lang/String; = "com.mwr.example.sieve.REQUEST"

.field public static final REQUEST_ADD:I = 0x69b5b

.field public static final REQUEST_EDIT:I = 0x169db


# instance fields
.field private currentPIN:Ljava/lang/String;

.field private entryOne:Landroid/widget/EditText;

.field private entryThree:Landroid/widget/EditText;

.field private entryTwo:Landroid/widget/EditText;

.field private prompt:Landroid/widget/TextView;

.field private requestCode:I

.field resultIntent:Landroid/content/Intent;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mwr/example/sieve/PINActivity;->currentPIN:Ljava/lang/String;

    .line 21
    return-void
.end method

.method private cancel()V
    .locals 2

    .prologue
    .line 193
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/MainLoginActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/PINActivity;->resultIntent:Landroid/content/Intent;

    .line 194
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/mwr/example/sieve/PINActivity;->resultIntent:Landroid/content/Intent;

    invoke-virtual {p0, v0, v1}, Lcom/mwr/example/sieve/PINActivity;->setResult(ILandroid/content/Intent;)V

    .line 195
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PINActivity;->finish()V

    .line 196
    return-void
.end method

.method private submitEdit()V
    .locals 7

    .prologue
    .line 123
    iget-object v5, p0, Lcom/mwr/example/sieve/PINActivity;->entryOne:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    .line 124
    .local v1, "one":Ljava/lang/String;
    iget-object v5, p0, Lcom/mwr/example/sieve/PINActivity;->entryTwo:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v4

    .line 125
    .local v4, "two":Ljava/lang/String;
    iget-object v5, p0, Lcom/mwr/example/sieve/PINActivity;->entryThree:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-interface {v5}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    .line 128
    .local v3, "three":Ljava/lang/String;
    const-string v5, "[^0-9]"

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    .line 129
    .local v2, "p":Ljava/util/regex/Pattern;
    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    .line 131
    .local v0, "hasSpecialChar":Z
    iget-object v5, p0, Lcom/mwr/example/sieve/PINActivity;->currentPIN:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 132
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    const/4 v6, 0x4

    if-ne v5, v6, :cond_2

    .line 133
    if-nez v0, :cond_1

    .line 134
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 135
    new-instance v5, Landroid/content/Intent;

    const-class v6, Lcom/mwr/example/sieve/MainLoginActivity;

    invoke-direct {v5, p0, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v5, p0, Lcom/mwr/example/sieve/PINActivity;->resultIntent:Landroid/content/Intent;

    .line 136
    iget-object v5, p0, Lcom/mwr/example/sieve/PINActivity;->resultIntent:Landroid/content/Intent;

    const-string v6, "com.mwr.example.sieve.PIN"

    invoke-virtual {v5, v6, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 137
    const/4 v5, -0x1

    iget-object v6, p0, Lcom/mwr/example/sieve/PINActivity;->resultIntent:Landroid/content/Intent;

    invoke-virtual {p0, v5, v6}, Lcom/mwr/example/sieve/PINActivity;->setResult(ILandroid/content/Intent;)V

    .line 138
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PINActivity;->finish()V

    .line 155
    :goto_0
    return-void

    .line 141
    :cond_0
    iget-object v5, p0, Lcom/mwr/example/sieve/PINActivity;->prompt:Landroid/widget/TextView;

    const v6, 0x7f05002b

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 146
    :cond_1
    iget-object v5, p0, Lcom/mwr/example/sieve/PINActivity;->prompt:Landroid/widget/TextView;

    const v6, 0x7f050029

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 150
    :cond_2
    iget-object v5, p0, Lcom/mwr/example/sieve/PINActivity;->prompt:Landroid/widget/TextView;

    const v6, 0x7f05002a

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 153
    :cond_3
    iget-object v5, p0, Lcom/mwr/example/sieve/PINActivity;->prompt:Landroid/widget/TextView;

    const v6, 0x7f05002c

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method

.method private submitEntry()V
    .locals 6

    .prologue
    .line 159
    iget-object v4, p0, Lcom/mwr/example/sieve/PINActivity;->entryOne:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    .line 160
    .local v1, "one":Ljava/lang/String;
    iget-object v4, p0, Lcom/mwr/example/sieve/PINActivity;->entryTwo:Landroid/widget/EditText;

    invoke-virtual {v4}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v4

    invoke-interface {v4}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v3

    .line 163
    .local v3, "two":Ljava/lang/String;
    const-string v4, "[^0-9]"

    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v2

    .line 164
    .local v2, "p":Ljava/util/regex/Pattern;
    invoke-virtual {v2, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    .line 166
    .local v0, "hasSpecialChar":Z
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x4

    if-ne v4, v5, :cond_2

    .line 167
    if-nez v0, :cond_1

    .line 168
    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 172
    new-instance v4, Landroid/content/Intent;

    const-class v5, Lcom/mwr/example/sieve/MainLoginActivity;

    invoke-direct {v4, p0, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v4, p0, Lcom/mwr/example/sieve/PINActivity;->resultIntent:Landroid/content/Intent;

    .line 173
    iget-object v4, p0, Lcom/mwr/example/sieve/PINActivity;->resultIntent:Landroid/content/Intent;

    const-string v5, "com.mwr.example.sieve.PIN"

    invoke-virtual {v4, v5, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 174
    const/4 v4, -0x1

    iget-object v5, p0, Lcom/mwr/example/sieve/PINActivity;->resultIntent:Landroid/content/Intent;

    invoke-virtual {p0, v4, v5}, Lcom/mwr/example/sieve/PINActivity;->setResult(ILandroid/content/Intent;)V

    .line 175
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PINActivity;->finish()V

    .line 189
    :goto_0
    return-void

    .line 178
    :cond_0
    iget-object v4, p0, Lcom/mwr/example/sieve/PINActivity;->prompt:Landroid/widget/TextView;

    const v5, 0x7f05002b

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 183
    :cond_1
    iget-object v4, p0, Lcom/mwr/example/sieve/PINActivity;->prompt:Landroid/widget/TextView;

    const v5, 0x7f050029

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 187
    :cond_2
    iget-object v4, p0, Lcom/mwr/example/sieve/PINActivity;->prompt:Landroid/widget/TextView;

    const v5, 0x7f05002a

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method


# virtual methods
.method public onBackPressed()V
    .locals 0

    .prologue
    .line 82
    invoke-direct {p0}, Lcom/mwr/example/sieve/PINActivity;->cancel()V

    .line 83
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const v6, 0x7f08001c

    const/4 v5, 0x4

    .line 45
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 46
    const v3, 0x7f030003

    invoke-virtual {p0, v3}, Lcom/mwr/example/sieve/PINActivity;->setContentView(I)V

    .line 48
    const v3, 0x7f080015

    invoke-virtual {p0, v3}, Lcom/mwr/example/sieve/PINActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/mwr/example/sieve/PINActivity;->entryOne:Landroid/widget/EditText;

    .line 49
    const v3, 0x7f080016

    invoke-virtual {p0, v3}, Lcom/mwr/example/sieve/PINActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/mwr/example/sieve/PINActivity;->entryTwo:Landroid/widget/EditText;

    .line 50
    invoke-virtual {p0, v6}, Lcom/mwr/example/sieve/PINActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/EditText;

    iput-object v3, p0, Lcom/mwr/example/sieve/PINActivity;->entryThree:Landroid/widget/EditText;

    .line 52
    const v3, 0x7f08001b

    invoke-virtual {p0, v3}, Lcom/mwr/example/sieve/PINActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lcom/mwr/example/sieve/PINActivity;->prompt:Landroid/widget/TextView;

    .line 56
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PINActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 57
    .local v1, "requestIntent":Landroid/content/Intent;
    const-string v3, "com.mwr.example.sieve.REQUEST"

    const/4 v4, 0x0

    invoke-virtual {v1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/mwr/example/sieve/PINActivity;->requestCode:I

    .line 59
    iget v3, p0, Lcom/mwr/example/sieve/PINActivity;->requestCode:I

    sparse-switch v3, :sswitch_data_0

    .line 74
    :goto_0
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xe

    if-lt v3, v4, :cond_0

    .line 75
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PINActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v3

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 77
    :cond_0
    return-void

    .line 62
    :sswitch_0
    const-string v3, "com.mwr.example.sieve.PIN"

    invoke-virtual {v1, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mwr/example/sieve/PINActivity;->currentPIN:Ljava/lang/String;

    goto :goto_0

    .line 66
    :sswitch_1
    const v3, 0x7f08001d

    invoke-virtual {p0, v3}, Lcom/mwr/example/sieve/PINActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 67
    .local v2, "tv":Landroid/widget/TextView;
    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 68
    invoke-virtual {p0, v6}, Lcom/mwr/example/sieve/PINActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 69
    .local v0, "et":Landroid/widget/EditText;
    invoke-virtual {v0, v5}, Landroid/widget/EditText;->setVisibility(I)V

    goto :goto_0

    .line 59
    :sswitch_data_0
    .sparse-switch
        0x169db -> :sswitch_0
        0x69b5b -> :sswitch_1
    .end sparse-switch
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PINActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f070004

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 90
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 95
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 101
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 97
    :pswitch_0
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PINActivity;->onBackPressed()V

    .line 99
    const/4 v0, 0x1

    goto :goto_0

    .line 95
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public submit(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 105
    iget v0, p0, Lcom/mwr/example/sieve/PINActivity;->requestCode:I

    sparse-switch v0, :sswitch_data_0

    .line 117
    :goto_0
    return-void

    .line 107
    :sswitch_0
    invoke-direct {p0}, Lcom/mwr/example/sieve/PINActivity;->submitEdit()V

    goto :goto_0

    .line 110
    :sswitch_1
    invoke-direct {p0}, Lcom/mwr/example/sieve/PINActivity;->submitEntry()V

    goto :goto_0

    .line 105
    :sswitch_data_0
    .sparse-switch
        0x169db -> :sswitch_0
        0x69b5b -> :sswitch_1
    .end sparse-switch
.end method
