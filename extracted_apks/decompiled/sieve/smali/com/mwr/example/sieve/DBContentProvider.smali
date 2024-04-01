.class public Lcom/mwr/example/sieve/DBContentProvider;
.super Landroid/content/ContentProvider;
.source "DBContentProvider.java"


# static fields
.field public static final KEY:I = 0xc8

.field public static final KEYS_URI:Landroid/net/Uri;

.field public static final KEY_ID:I = 0xe6

.field public static final KEY_PASSWORD:I = 0xd2

.field public static final KEY_PIN:I = 0xdc

.field public static final PASSWORDS:I = 0x64

.field public static final PASSWORDS_EMAIL:I = 0x8c

.field public static final PASSWORDS_ID:I = 0x6e

.field public static final PASSWORDS_PASSWORD:I = 0x96

.field public static final PASSWORDS_SERVICE:I = 0x78

.field public static final PASSWORDS_URI:Landroid/net/Uri;

.field public static final PASSWORDS_USERNAME:I = 0x82


# instance fields
.field pwdb:Lcom/mwr/example/sieve/PWDBHelper;

.field private sUriMatcher:Landroid/content/UriMatcher;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 28
    const-string v0, "content://com.mwr.example.sieve.DBContentProvider/Passwords"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mwr/example/sieve/DBContentProvider;->PASSWORDS_URI:Landroid/net/Uri;

    .line 29
    const-string v0, "content://com.mwr.example.sieve.DBContentProvider/Keys"

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    sput-object v0, Lcom/mwr/example/sieve/DBContentProvider;->KEYS_URI:Landroid/net/Uri;

    .line 18
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 18
    invoke-direct {p0}, Landroid/content/ContentProvider;-><init>()V

    .line 37
    new-instance v0, Landroid/content/UriMatcher;

    const/4 v1, -0x1

    invoke-direct {v0, v1}, Landroid/content/UriMatcher;-><init>(I)V

    iput-object v0, p0, Lcom/mwr/example/sieve/DBContentProvider;->sUriMatcher:Landroid/content/UriMatcher;

    .line 18
    return-void
.end method


# virtual methods
.method public delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 4
    .param p1, "in"    # Landroid/net/Uri;
    .param p2, "selection"    # Ljava/lang/String;
    .param p3, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 45
    iget-object v2, p0, Lcom/mwr/example/sieve/DBContentProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    .line 46
    .local v1, "type":I
    const/4 v0, -0x1

    .line 47
    .local v0, "id":I
    const/16 v2, 0x64

    if-ne v1, v2, :cond_1

    .line 48
    iget-object v2, p0, Lcom/mwr/example/sieve/DBContentProvider;->pwdb:Lcom/mwr/example/sieve/PWDBHelper;

    invoke-virtual {v2}, Lcom/mwr/example/sieve/PWDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "Passwords"

    invoke-virtual {v2, v3, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 55
    :cond_0
    :goto_0
    return v0

    .line 50
    :cond_1
    const/16 v2, 0xc8

    if-ne v1, v2, :cond_0

    .line 51
    iget-object v2, p0, Lcom/mwr/example/sieve/DBContentProvider;->pwdb:Lcom/mwr/example/sieve/PWDBHelper;

    invoke-virtual {v2}, Lcom/mwr/example/sieve/PWDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "Key"

    invoke-virtual {v2, v3, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->delete(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 1
    .param p1, "arg0"    # Landroid/net/Uri;

    .prologue
    .line 62
    const/4 v0, 0x0

    return-object v0
.end method

.method public insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;
    .locals 7
    .param p1, "in"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;

    .prologue
    const/4 v6, 0x0

    .line 69
    const/4 v2, 0x0

    .line 71
    .local v2, "mReturnUri":Landroid/net/Uri;
    iget-object v4, p0, Lcom/mwr/example/sieve/DBContentProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v4, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v3

    .line 72
    .local v3, "type":I
    const-wide/16 v0, -0x1

    .line 73
    .local v0, "id":J
    const/16 v4, 0x64

    if-ne v3, v4, :cond_1

    .line 74
    iget-object v4, p0, Lcom/mwr/example/sieve/DBContentProvider;->pwdb:Lcom/mwr/example/sieve/PWDBHelper;

    invoke-virtual {v4}, Lcom/mwr/example/sieve/PWDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string v5, "Passwords"

    invoke-virtual {v4, v5, v6, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    .line 80
    :cond_0
    :goto_0
    invoke-static {p1, v0, v1}, Landroid/content/ContentUris;->withAppendedId(Landroid/net/Uri;J)Landroid/net/Uri;

    move-result-object v2

    .line 82
    return-object v2

    .line 76
    :cond_1
    const/16 v4, 0xc8

    if-ne v3, v4, :cond_0

    .line 77
    iget-object v4, p0, Lcom/mwr/example/sieve/DBContentProvider;->pwdb:Lcom/mwr/example/sieve/PWDBHelper;

    invoke-virtual {v4}, Lcom/mwr/example/sieve/PWDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v4

    const-string v5, "Key"

    invoke-virtual {v4, v5, v6, p2}, Landroid/database/sqlite/SQLiteDatabase;->insert(Ljava/lang/String;Ljava/lang/String;Landroid/content/ContentValues;)J

    move-result-wide v0

    goto :goto_0
.end method

.method public onCreate()Z
    .locals 4

    .prologue
    .line 90
    new-instance v0, Lcom/mwr/example/sieve/PWDBHelper;

    invoke-virtual {p0}, Lcom/mwr/example/sieve/DBContentProvider;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/mwr/example/sieve/PWDBHelper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/DBContentProvider;->pwdb:Lcom/mwr/example/sieve/PWDBHelper;

    .line 92
    iget-object v0, p0, Lcom/mwr/example/sieve/DBContentProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.mwr.example.sieve.DBContentProvider"

    const-string v2, "Passwords"

    const/16 v3, 0x64

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 93
    iget-object v0, p0, Lcom/mwr/example/sieve/DBContentProvider;->sUriMatcher:Landroid/content/UriMatcher;

    const-string v1, "com.mwr.example.sieve.DBContentProvider"

    const-string v2, "Keys"

    const/16 v3, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/UriMatcher;->addURI(Ljava/lang/String;Ljava/lang/String;I)V

    .line 95
    const/4 v0, 0x0

    return v0
.end method

.method public query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;
    .locals 9
    .param p1, "in"    # Landroid/net/Uri;
    .param p2, "projection"    # [Ljava/lang/String;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;
    .param p5, "sortOrder"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    const/16 v2, 0xc8

    .line 102
    iget-object v1, p0, Lcom/mwr/example/sieve/DBContentProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v1, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v8

    .line 104
    .local v8, "type":I
    new-instance v0, Landroid/database/sqlite/SQLiteQueryBuilder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteQueryBuilder;-><init>()V

    .line 106
    .local v0, "queryBuilder":Landroid/database/sqlite/SQLiteQueryBuilder;
    const/16 v1, 0x64

    if-lt v8, v1, :cond_1

    if-ge v8, v2, :cond_1

    .line 107
    const-string v1, "Passwords"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    .line 112
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/mwr/example/sieve/DBContentProvider;->pwdb:Lcom/mwr/example/sieve/PWDBHelper;

    invoke-virtual {v1}, Lcom/mwr/example/sieve/PWDBHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, v5

    move-object v7, p5

    invoke-virtual/range {v0 .. v7}, Landroid/database/sqlite/SQLiteQueryBuilder;->query(Landroid/database/sqlite/SQLiteDatabase;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v1

    return-object v1

    .line 108
    :cond_1
    if-lt v8, v2, :cond_0

    .line 109
    const-string v1, "Key"

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteQueryBuilder;->setTables(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I
    .locals 4
    .param p1, "uri"    # Landroid/net/Uri;
    .param p2, "values"    # Landroid/content/ContentValues;
    .param p3, "selection"    # Ljava/lang/String;
    .param p4, "selectionArgs"    # [Ljava/lang/String;

    .prologue
    .line 120
    iget-object v2, p0, Lcom/mwr/example/sieve/DBContentProvider;->sUriMatcher:Landroid/content/UriMatcher;

    invoke-virtual {v2, p1}, Landroid/content/UriMatcher;->match(Landroid/net/Uri;)I

    move-result v1

    .line 122
    .local v1, "type":I
    const/4 v0, -0x1

    .line 123
    .local v0, "r":I
    const/16 v2, 0x64

    if-ne v1, v2, :cond_1

    .line 124
    iget-object v2, p0, Lcom/mwr/example/sieve/DBContentProvider;->pwdb:Lcom/mwr/example/sieve/PWDBHelper;

    invoke-virtual {v2}, Lcom/mwr/example/sieve/PWDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "Passwords"

    invoke-virtual {v2, v3, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 131
    :cond_0
    :goto_0
    return v0

    .line 126
    :cond_1
    const/16 v2, 0xc8

    if-ne v1, v2, :cond_0

    .line 127
    iget-object v2, p0, Lcom/mwr/example/sieve/DBContentProvider;->pwdb:Lcom/mwr/example/sieve/PWDBHelper;

    invoke-virtual {v2}, Lcom/mwr/example/sieve/PWDBHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    const-string v3, "Key"

    invoke-virtual {v2, v3, p2, p3, p4}, Landroid/database/sqlite/SQLiteDatabase;->update(Ljava/lang/String;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method
