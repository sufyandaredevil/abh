.class public Lcom/mwr/example/sieve/PWTable;
.super Ljava/lang/Object;
.source "PWTable.java"

# interfaces
.implements Landroid/provider/BaseColumns;


# static fields
.field public static final BLOB_TYPE:Ljava/lang/String; = " BLOB"

.field public static final COLUMN_NAME_EMAIL:Ljava/lang/String; = "email"

.field public static final COLUMN_NAME_PASSWORD:Ljava/lang/String; = "password"

.field public static final COLUMN_NAME_SERVICE:Ljava/lang/String; = "service"

.field public static final COLUMN_NAME_USERNAME:Ljava/lang/String; = "username"

.field public static final COMMA_SEP:Ljava/lang/String; = ","

.field public static final KEY_COLUMN_NAME_MAIN:Ljava/lang/String; = "Password"

.field public static final KEY_COLUMN_NAME_SHORT:Ljava/lang/String; = "pin"

.field public static final KEY_SQL_CREATE_ENTRIES:Ljava/lang/String; = "CREATE TABLE Key (Password TEXT PRIMARY KEY,pin TEXT )"

.field public static final KEY_TABLE_NAME:Ljava/lang/String; = "Key"

.field public static final SQL_CREATE_ENTRIES:Ljava/lang/String; = "CREATE TABLE Passwords (_id INTEGER PRIMARY KEY,service TEXT,username TEXT,password BLOB,email )"

.field public static final SQL_DELETE_ENTRIES:Ljava/lang/String; = "DROP TABLE IF EXISTS Passwords"

.field public static final TABLE_NAME:Ljava/lang/String; = "Passwords"

.field public static final TEXT_TYPE:Ljava/lang/String; = " TEXT"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
