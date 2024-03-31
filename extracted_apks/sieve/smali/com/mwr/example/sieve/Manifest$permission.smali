.class public final Lcom/mwr/example/sieve/Manifest$permission;
.super Ljava/lang/Object;
.source "Manifest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mwr/example/sieve/Manifest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "permission"
.end annotation


# static fields
.field public static final READ_KEYS:Ljava/lang/String; = "com.mwr.example.sieve.READ_KEYS"

.field public static final WRITE_KEYS:Ljava/lang/String; = "com.mwr.example.sieve.WRITE_KEYS"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
