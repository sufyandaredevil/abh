.class Lcom/mwr/example/sieve/AddEntryActivity$1;
.super Ljava/lang/Object;
.source "AddEntryActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/mwr/example/sieve/AddEntryActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/mwr/example/sieve/AddEntryActivity;


# direct methods
.method constructor <init>(Lcom/mwr/example/sieve/AddEntryActivity;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/mwr/example/sieve/AddEntryActivity$1;->this$0:Lcom/mwr/example/sieve/AddEntryActivity;

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "arg0"    # Landroid/content/DialogInterface;
    .param p2, "arg1"    # I

    .prologue
    .line 64
    iget-object v0, p0, Lcom/mwr/example/sieve/AddEntryActivity$1;->this$0:Lcom/mwr/example/sieve/AddEntryActivity;

    invoke-static {v0}, Lcom/mwr/example/sieve/AddEntryActivity;->access$0(Lcom/mwr/example/sieve/AddEntryActivity;)V

    .line 65
    return-void
.end method
