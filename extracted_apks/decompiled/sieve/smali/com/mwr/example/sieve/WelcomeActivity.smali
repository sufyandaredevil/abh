.class public Lcom/mwr/example/sieve/WelcomeActivity;
.super Landroid/app/Activity;
.source "WelcomeActivity.java"


# static fields
.field public static final PASS:Ljava/lang/String; = "com.mwr.example.sieve.PASS"


# instance fields
.field private entryOne:Landroid/widget/EditText;

.field private entryTwo:Landroid/widget/EditText;

.field private prompt:Landroid/widget/TextView;

.field resultIntent:Landroid/content/Intent;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private cancel()V
    .locals 2

    .prologue
    .line 91
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/MainLoginActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/WelcomeActivity;->resultIntent:Landroid/content/Intent;

    .line 92
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/mwr/example/sieve/WelcomeActivity;->resultIntent:Landroid/content/Intent;

    invoke-virtual {p0, v0, v1}, Lcom/mwr/example/sieve/WelcomeActivity;->setResult(ILandroid/content/Intent;)V

    .line 93
    invoke-virtual {p0}, Lcom/mwr/example/sieve/WelcomeActivity;->finish()V

    .line 94
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 0

    .prologue
    .line 43
    invoke-direct {p0}, Lcom/mwr/example/sieve/WelcomeActivity;->cancel()V

    .line 44
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 27
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 28
    const v0, 0x7f030007

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/WelcomeActivity;->setContentView(I)V

    .line 30
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    .line 31
    invoke-virtual {p0}, Lcom/mwr/example/sieve/WelcomeActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 34
    :cond_0
    const v0, 0x7f08002b

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/WelcomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mwr/example/sieve/WelcomeActivity;->entryOne:Landroid/widget/EditText;

    .line 35
    const v0, 0x7f08002d

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/WelcomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iput-object v0, p0, Lcom/mwr/example/sieve/WelcomeActivity;->entryTwo:Landroid/widget/EditText;

    .line 37
    const v0, 0x7f08002e

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/WelcomeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mwr/example/sieve/WelcomeActivity;->prompt:Landroid/widget/TextView;

    .line 39
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 49
    invoke-virtual {p0}, Lcom/mwr/example/sieve/WelcomeActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f070008

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 50
    const/4 v0, 0x1

    return v0
.end method

.method public submit(Landroid/view/View;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 57
    iget-object v3, p0, Lcom/mwr/example/sieve/WelcomeActivity;->entryOne:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v1

    .line 58
    .local v1, "one":Ljava/lang/String;
    iget-object v3, p0, Lcom/mwr/example/sieve/WelcomeActivity;->entryTwo:Landroid/widget/EditText;

    invoke-virtual {v3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v3

    invoke-interface {v3}, Landroid/text/Editable;->toString()Ljava/lang/String;

    move-result-object v2

    .line 61
    .local v2, "two":Ljava/lang/String;
    const-string v3, "[a-zA-Z0-9]+"

    invoke-virtual {v1, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    .line 63
    .local v0, "meetsStandard":Z
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x10

    if-lt v3, v4, :cond_2

    .line 64
    if-eqz v0, :cond_1

    .line 65
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 67
    new-instance v3, Landroid/content/Intent;

    const-class v4, Lcom/mwr/example/sieve/MainLoginActivity;

    invoke-direct {v3, p0, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v3, p0, Lcom/mwr/example/sieve/WelcomeActivity;->resultIntent:Landroid/content/Intent;

    .line 68
    iget-object v3, p0, Lcom/mwr/example/sieve/WelcomeActivity;->resultIntent:Landroid/content/Intent;

    const-string v4, "com.mwr.example.sieve.PASS"

    invoke-virtual {v3, v4, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 69
    const/4 v3, -0x1

    iget-object v4, p0, Lcom/mwr/example/sieve/WelcomeActivity;->resultIntent:Landroid/content/Intent;

    invoke-virtual {p0, v3, v4}, Lcom/mwr/example/sieve/WelcomeActivity;->setResult(ILandroid/content/Intent;)V

    .line 70
    invoke-virtual {p0}, Lcom/mwr/example/sieve/WelcomeActivity;->finish()V

    .line 88
    :goto_0
    return-void

    .line 74
    :cond_0
    iget-object v3, p0, Lcom/mwr/example/sieve/WelcomeActivity;->prompt:Landroid/widget/TextView;

    const v4, 0x7f050030

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 80
    :cond_1
    iget-object v3, p0, Lcom/mwr/example/sieve/WelcomeActivity;->prompt:Landroid/widget/TextView;

    const v4, 0x7f05002d

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    .line 84
    :cond_2
    iget-object v3, p0, Lcom/mwr/example/sieve/WelcomeActivity;->prompt:Landroid/widget/TextView;

    const v4, 0x7f05002f

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0
.end method
