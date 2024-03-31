.class public interface abstract Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;
.super Ljava/lang/Object;
.source "CryptoServiceConnector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mwr/example/sieve/CryptoServiceConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ResponseListener"
.end annotation


# virtual methods
.method public abstract connected()V
.end method

.method public abstract decryptionReturned(Ljava/lang/String;I)V
.end method

.method public abstract encryptionReturned([BI)V
.end method

.method public abstract sendFailed()V
.end method
