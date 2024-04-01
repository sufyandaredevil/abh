.class public Lcom/mwr/example/sieve/PasswordEntry;
.super Ljava/lang/Object;
.source "PasswordEntry.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/mwr/example/sieve/PasswordEntry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public email:Ljava/lang/String;

.field public password:Ljava/lang/String;

.field public service:Ljava/lang/String;

.field public username:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 59
    new-instance v0, Lcom/mwr/example/sieve/PasswordEntry$1;

    invoke-direct {v0}, Lcom/mwr/example/sieve/PasswordEntry$1;-><init>()V

    .line 58
    sput-object v0, Lcom/mwr/example/sieve/PasswordEntry;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 19
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 2
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    const/4 v1, 0x4

    new-array v0, v1, [Ljava/lang/String;

    .line 38
    .local v0, "input":[Ljava/lang/String;
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readStringArray([Ljava/lang/String;)V

    .line 39
    const/4 v1, 0x0

    aget-object v1, v0, v1

    iput-object v1, p0, Lcom/mwr/example/sieve/PasswordEntry;->service:Ljava/lang/String;

    .line 40
    const/4 v1, 0x1

    aget-object v1, v0, v1

    iput-object v1, p0, Lcom/mwr/example/sieve/PasswordEntry;->username:Ljava/lang/String;

    .line 41
    const/4 v1, 0x2

    aget-object v1, v0, v1

    iput-object v1, p0, Lcom/mwr/example/sieve/PasswordEntry;->email:Ljava/lang/String;

    .line 42
    const/4 v1, 0x3

    aget-object v1, v0, v1

    iput-object v1, p0, Lcom/mwr/example/sieve/PasswordEntry;->password:Ljava/lang/String;

    .line 43
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "u"    # Ljava/lang/String;
    .param p3, "e"    # Ljava/lang/String;
    .param p4, "p"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/mwr/example/sieve/PasswordEntry;->service:Ljava/lang/String;

    .line 31
    iput-object p2, p0, Lcom/mwr/example/sieve/PasswordEntry;->username:Ljava/lang/String;

    .line 32
    iput-object p4, p0, Lcom/mwr/example/sieve/PasswordEntry;->password:Ljava/lang/String;

    .line 33
    iput-object p3, p0, Lcom/mwr/example/sieve/PasswordEntry;->email:Ljava/lang/String;

    .line 34
    return-void
.end method

.method public static MapList(Ljava/util/List;)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/mwr/example/sieve/PasswordEntry;",
            ">;)",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "in":Ljava/util/List;, "Ljava/util/List<Lcom/mwr/example/sieve/PasswordEntry;>;"
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 83
    .local v1, "m":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v2

    if-lt v0, v2, :cond_0

    .line 86
    return-object v1

    .line 84
    :cond_0
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mwr/example/sieve/PasswordEntry;

    iget-object v3, v2, Lcom/mwr/example/sieve/PasswordEntry;->service:Ljava/lang/String;

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/mwr/example/sieve/PasswordEntry;

    iget-object v2, v2, Lcom/mwr/example/sieve/PasswordEntry;->username:Ljava/lang/String;

    invoke-interface {v1, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 54
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 48
    new-instance v0, Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/mwr/example/sieve/PasswordEntry;->service:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/mwr/example/sieve/PasswordEntry;->username:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "out"    # Landroid/os/Parcel;
    .param p2, "arg1"    # I

    .prologue
    .line 76
    const/4 v1, 0x4

    new-array v0, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/mwr/example/sieve/PasswordEntry;->service:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/mwr/example/sieve/PasswordEntry;->username:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    iget-object v2, p0, Lcom/mwr/example/sieve/PasswordEntry;->email:Ljava/lang/String;

    aput-object v2, v0, v1

    const/4 v1, 0x3

    iget-object v2, p0, Lcom/mwr/example/sieve/PasswordEntry;->password:Ljava/lang/String;

    aput-object v2, v0, v1

    .line 77
    .local v0, "output":[Ljava/lang/String;
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    .line 78
    return-void
.end method
