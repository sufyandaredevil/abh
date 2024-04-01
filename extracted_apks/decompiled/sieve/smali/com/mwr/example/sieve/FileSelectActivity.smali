.class public Lcom/mwr/example/sieve/FileSelectActivity;
.super Landroid/app/Activity;
.source "FileSelectActivity.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/app/Activity;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# static fields
.field public static final FILE:Ljava/lang/String; = "com.mwr.example.sieve.FILE"

.field private static final root:Ljava/lang/String; = "/"


# instance fields
.field private currentPath:Landroid/widget/TextView;

.field private item:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private path:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private pathList:Landroid/widget/ListView;

.field private resultIntent:Landroid/content/Intent;

.field private startingPath:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 30
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 46
    iput-object v0, p0, Lcom/mwr/example/sieve/FileSelectActivity;->item:Ljava/util/List;

    .line 47
    iput-object v0, p0, Lcom/mwr/example/sieve/FileSelectActivity;->path:Ljava/util/List;

    .line 30
    return-void
.end method

.method private cancel()V
    .locals 2

    .prologue
    .line 172
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/SettingsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/FileSelectActivity;->resultIntent:Landroid/content/Intent;

    .line 173
    const/4 v0, 0x0

    iget-object v1, p0, Lcom/mwr/example/sieve/FileSelectActivity;->resultIntent:Landroid/content/Intent;

    invoke-virtual {p0, v0, v1}, Lcom/mwr/example/sieve/FileSelectActivity;->setResult(ILandroid/content/Intent;)V

    .line 174
    invoke-virtual {p0}, Lcom/mwr/example/sieve/FileSelectActivity;->finish()V

    .line 175
    return-void
.end method

.method private processDir(Ljava/lang/String;)V
    .locals 8
    .param p1, "dir"    # Ljava/lang/String;

    .prologue
    .line 75
    iget-object v5, p0, Lcom/mwr/example/sieve/FileSelectActivity;->currentPath:Landroid/widget/TextView;

    invoke-virtual {v5, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 77
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/mwr/example/sieve/FileSelectActivity;->item:Ljava/util/List;

    .line 78
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iput-object v5, p0, Lcom/mwr/example/sieve/FileSelectActivity;->path:Ljava/util/List;

    .line 80
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 81
    .local v0, "f":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v3

    .line 83
    .local v3, "files":[Ljava/io/File;
    const-string v5, "/"

    invoke-virtual {p1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 84
    iget-object v5, p0, Lcom/mwr/example/sieve/FileSelectActivity;->item:Ljava/util/List;

    const-string v6, "/"

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    iget-object v5, p0, Lcom/mwr/example/sieve/FileSelectActivity;->path:Ljava/util/List;

    const-string v6, "/"

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 89
    iget-object v5, p0, Lcom/mwr/example/sieve/FileSelectActivity;->item:Ljava/util/List;

    const-string v6, "../"

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 90
    iget-object v5, p0, Lcom/mwr/example/sieve/FileSelectActivity;->path:Ljava/util/List;

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    :cond_0
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    array-length v5, v3

    if-lt v4, v5, :cond_1

    .line 103
    new-instance v2, Landroid/widget/ArrayAdapter;

    const v5, 0x1090003

    iget-object v6, p0, Lcom/mwr/example/sieve/FileSelectActivity;->item:Ljava/util/List;

    invoke-direct {v2, p0, v5, v6}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;ILjava/util/List;)V

    .line 105
    .local v2, "fileList":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/mwr/example/sieve/FileSelectActivity;->pathList:Landroid/widget/ListView;

    invoke-virtual {v5, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 106
    iget-object v5, p0, Lcom/mwr/example/sieve/FileSelectActivity;->pathList:Landroid/widget/ListView;

    invoke-virtual {v5, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 107
    return-void

    .line 94
    .end local v2    # "fileList":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    :cond_1
    aget-object v1, v3, v4

    .line 95
    .local v1, "file":Ljava/io/File;
    iget-object v5, p0, Lcom/mwr/example/sieve/FileSelectActivity;->path:Ljava/util/List;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 96
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 97
    iget-object v5, p0, Lcom/mwr/example/sieve/FileSelectActivity;->item:Ljava/util/List;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 93
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 99
    :cond_2
    iget-object v5, p0, Lcom/mwr/example/sieve/FileSelectActivity;->item:Ljava/util/List;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method private returnFile(Ljava/lang/String;)V
    .locals 2
    .param p1, "out"    # Ljava/lang/String;

    .prologue
    .line 111
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/SettingsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/FileSelectActivity;->resultIntent:Landroid/content/Intent;

    .line 112
    iget-object v0, p0, Lcom/mwr/example/sieve/FileSelectActivity;->resultIntent:Landroid/content/Intent;

    const-string v1, "com.mwr.example.sieve.FILE"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 114
    const/4 v0, -0x1

    iget-object v1, p0, Lcom/mwr/example/sieve/FileSelectActivity;->resultIntent:Landroid/content/Intent;

    invoke-virtual {p0, v0, v1}, Lcom/mwr/example/sieve/FileSelectActivity;->setResult(ILandroid/content/Intent;)V

    .line 115
    invoke-virtual {p0}, Lcom/mwr/example/sieve/FileSelectActivity;->finish()V

    .line 116
    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 0

    .prologue
    .line 71
    invoke-direct {p0}, Lcom/mwr/example/sieve/FileSelectActivity;->cancel()V

    .line 72
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x1

    .line 53
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 54
    const v0, 0x7f030001

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/FileSelectActivity;->setContentView(I)V

    .line 56
    invoke-virtual {p0}, Lcom/mwr/example/sieve/FileSelectActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 58
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/FileSelectActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mwr/example/sieve/FileSelectActivity;->startingPath:Ljava/lang/String;

    .line 60
    const v0, 0x7f08000e

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/FileSelectActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mwr/example/sieve/FileSelectActivity;->currentPath:Landroid/widget/TextView;

    .line 61
    const v0, 0x7f08000f

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/FileSelectActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mwr/example/sieve/FileSelectActivity;->pathList:Landroid/widget/ListView;

    .line 63
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    .line 64
    invoke-virtual {p0}, Lcom/mwr/example/sieve/FileSelectActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 66
    :cond_0
    iget-object v0, p0, Lcom/mwr/example/sieve/FileSelectActivity;->startingPath:Ljava/lang/String;

    invoke-direct {p0, v0}, Lcom/mwr/example/sieve/FileSelectActivity;->processDir(Ljava/lang/String;)V

    .line 67
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 122
    invoke-virtual {p0}, Lcom/mwr/example/sieve/FileSelectActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f070002

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 123
    const/4 v0, 0x1

    return v0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 4
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "pos"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 148
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/mwr/example/sieve/FileSelectActivity;->path:Ljava/util/List;

    invoke-interface {v1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 150
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 151
    invoke-virtual {v0}, Ljava/io/File;->canRead()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 152
    iget-object v1, p0, Lcom/mwr/example/sieve/FileSelectActivity;->path:Ljava/util/List;

    invoke-interface {v1, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, v1}, Lcom/mwr/example/sieve/FileSelectActivity;->processDir(Ljava/lang/String;)V

    .line 169
    :cond_0
    :goto_0
    return-void

    .line 154
    :cond_1
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 155
    const/high16 v2, 0x7f020000

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setIcon(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 156
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "["

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "] folder can\'t be read!"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 157
    const-string v2, "OK"

    new-instance v3, Lcom/mwr/example/sieve/FileSelectActivity$1;

    invoke-direct {v3, p0}, Lcom/mwr/example/sieve/FileSelectActivity$1;-><init>(Lcom/mwr/example/sieve/FileSelectActivity;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 162
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 165
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".xml"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".XML"

    invoke-virtual {v1, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 166
    :cond_3
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mwr/example/sieve/FileSelectActivity;->returnFile(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 130
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 142
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 139
    :pswitch_0
    invoke-direct {p0}, Lcom/mwr/example/sieve/FileSelectActivity;->cancel()V

    .line 140
    const/4 v0, 0x1

    goto :goto_0

    .line 130
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method
