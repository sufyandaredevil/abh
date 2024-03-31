.class public interface abstract Lcom/mwr/example/sieve/AuthServiceConnector$ResponseListener;
.super Ljava/lang/Object;
.source "AuthServiceConnector.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/mwr/example/sieve/AuthServiceConnector;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "ResponseListener"
.end annotation


# virtual methods
.method public abstract checkKeyResult(Z)V
.end method

.method public abstract checkPinResult(Z)V
.end method

.method public abstract connected()V
.end method

.method public abstract firstLaunchResult(I)V
.end method

.method public abstract sendFailed()V
.end method

.method public abstract setKeyResult(Z)V
.end method

.method public abstract setPinResult(Z)V
.end method
