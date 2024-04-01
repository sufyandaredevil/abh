.class public Lcom/mwr/example/sieve/SettingsActivity;
.super Landroid/app/Activity;
.source "SettingsActivity.java"

# interfaces
.implements Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;
.implements Lcom/mwr/example/sieve/NetBackupHandler$ResultListener;


# static fields
.field private static final BACKUP_FILENAME:Ljava/lang/String; = "Backup"

.field private static final BACKUP_TO_NET:I = 0xfc0b

.field private static final BACKUP_TO_SD:I = 0x983

.field public static final FILE:I = 0x125

.field private static final NO:Ljava/lang/String; = "Cancel"

.field private static final NOT_RUNNING:I = 0xcbbfc

.field public static final PASSWORD:Ljava/lang/String; = "com.mwr.example.sieve.PASSWORD"

.field public static final PIN_REQUEST:I = 0x1c8

.field private static final TAG:Ljava/lang/String; = "m_Settings"

.field private static final YES:Ljava/lang/String; = "Yes"

.field private static final writeable:I = 0x1


# instance fields
.field private PIN:Ljava/lang/String;

.field backupNet:Landroid/app/AlertDialog$Builder;

.field backupSD:Landroid/app/AlertDialog$Builder;

.field private connectionError:Landroid/app/AlertDialog$Builder;

.field deleteALL:Landroid/app/AlertDialog$Builder;

.field errorCantChangePin:Landroid/app/AlertDialog$Builder;

.field errorCantRead:Landroid/app/AlertDialog$Builder;

.field errorDBEmpty:Landroid/app/AlertDialog$Builder;

.field private ll:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/mwr/example/sieve/PasswordEntry;",
            ">;"
        }
    .end annotation
.end field

.field private mainPassword:Ljava/lang/String;

.field private netBackup:Lcom/mwr/example/sieve/NetBackupHandler;

.field netRestore:Landroid/app/AlertDialog$Builder;

.field private out:Ljava/lang/StringBuffer;

.field restore:Landroid/app/AlertDialog$Builder;

.field private runningState:I

.field private serviceConnection:Lcom/mwr/example/sieve/CryptoServiceConnector;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 42
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 80
    new-instance v0, Lcom/mwr/example/sieve/CryptoServiceConnector;

    invoke-direct {v0, p0}, Lcom/mwr/example/sieve/CryptoServiceConnector;-><init>(Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->serviceConnection:Lcom/mwr/example/sieve/CryptoServiceConnector;

    .line 89
    const v0, 0xcbbfc

    iput v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->runningState:I

    .line 42
    return-void
.end method

.method static synthetic access$0(Lcom/mwr/example/sieve/SettingsActivity;)V
    .locals 0

    .prologue
    .line 358
    invoke-direct {p0}, Lcom/mwr/example/sieve/SettingsActivity;->backupToSD()V

    return-void
.end method

.method static synthetic access$1(Lcom/mwr/example/sieve/SettingsActivity;)V
    .locals 0

    .prologue
    .line 378
    invoke-direct {p0}, Lcom/mwr/example/sieve/SettingsActivity;->deleteAll()V

    return-void
.end method

.method static synthetic access$2(Lcom/mwr/example/sieve/SettingsActivity;)V
    .locals 0

    .prologue
    .line 372
    invoke-direct {p0}, Lcom/mwr/example/sieve/SettingsActivity;->restoreFromSD()V

    return-void
.end method

.method static synthetic access$3(Lcom/mwr/example/sieve/SettingsActivity;)V
    .locals 0

    .prologue
    .line 393
    invoke-direct {p0}, Lcom/mwr/example/sieve/SettingsActivity;->restoreFromNet()V

    return-void
.end method

.method static synthetic access$4(Lcom/mwr/example/sieve/SettingsActivity;)V
    .locals 0

    .prologue
    .line 386
    invoke-direct {p0}, Lcom/mwr/example/sieve/SettingsActivity;->backupToNet()V

    return-void
.end method

.method private backupToNet()V
    .locals 2

    .prologue
    .line 387
    iget v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->runningState:I

    const v1, 0xcbbfc

    if-ne v0, v1, :cond_0

    .line 388
    const v0, 0xfc0b

    iput v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->runningState:I

    .line 389
    invoke-direct {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getBackup()V

    .line 391
    :cond_0
    return-void
.end method

.method private backupToSD()V
    .locals 2

    .prologue
    .line 360
    iget v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->runningState:I

    const v1, 0xcbbfc

    if-ne v0, v1, :cond_0

    .line 361
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/mwr/example/sieve/SettingsActivity;->checkSDState(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 362
    const/16 v0, 0x983

    iput v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->runningState:I

    .line 364
    invoke-direct {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getBackup()V

    .line 370
    :cond_0
    return-void
.end method

.method private changePIN(Ljava/lang/String;)Z
    .locals 8
    .param p1, "pin"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 460
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 461
    .local v0, "out":Landroid/content/ContentValues;
    const-string v6, "pin"

    invoke-virtual {v0, v6, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    const-string v2, "pin = ?"

    .line 465
    .local v2, "selection":Ljava/lang/String;
    new-array v3, v4, [Ljava/lang/String;

    iget-object v6, p0, Lcom/mwr/example/sieve/SettingsActivity;->PIN:Ljava/lang/String;

    aput-object v6, v3, v5

    .line 467
    .local v3, "selectionArgs":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v6

    sget-object v7, Lcom/mwr/example/sieve/DBContentProvider;->KEYS_URI:Landroid/net/Uri;

    invoke-virtual {v6, v7, v0, v2, v3}, Landroid/content/ContentResolver;->update(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v1

    .line 469
    .local v1, "r":I
    if-lez v1, :cond_0

    :goto_0
    return v4

    :cond_0
    move v4, v5

    goto :goto_0
.end method

.method private checkSDState(I)Z
    .locals 2
    .param p1, "code"    # I

    .prologue
    .line 305
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v0

    .line 307
    .local v0, "state":Ljava/lang/String;
    const-string v1, "mounted"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    return v1
.end method

.method private deleteAll()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 380
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    sget-object v1, Lcom/mwr/example/sieve/DBContentProvider;->PASSWORDS_URI:Landroid/net/Uri;

    invoke-virtual {v0, v1, v2, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 382
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Database deleted"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 384
    return-void
.end method

.method private finaliseBackupToSD()V
    .locals 8

    .prologue
    .line 546
    new-instance v5, Ljava/sql/Timestamp;

    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    invoke-virtual {v6}, Ljava/util/Date;->getTime()J

    move-result-wide v6

    invoke-direct {v5, v6, v7}, Ljava/sql/Timestamp;-><init>(J)V

    invoke-virtual {v5}, Ljava/sql/Timestamp;->toString()Ljava/lang/String;

    move-result-object v4

    .line 547
    .local v4, "timestamp":Ljava/lang/String;
    const/16 v5, 0x3a

    const/16 v6, 0x2d

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    .line 548
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Backup ("

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ").xml"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 549
    .local v2, "filename":Ljava/lang/String;
    new-instance v1, Ljava/io/File;

    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Lcom/mwr/example/sieve/SettingsActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v5

    invoke-direct {v1, v5, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 552
    .local v1, "file":Ljava/io/File;
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_0

    .line 553
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 555
    :cond_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 556
    .local v3, "os":Ljava/io/OutputStream;
    iget-object v5, p0, Lcom/mwr/example/sieve/SettingsActivity;->out:Ljava/lang/StringBuffer;

    invoke-virtual {v5}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/io/OutputStream;->write([B)V

    .line 557
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 558
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const-string v6, "Database exported"

    const/4 v7, 0x0

    invoke-static {v5, v6, v7}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v5

    invoke-virtual {v5}, Landroid/widget/Toast;->show()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 564
    .end local v3    # "os":Ljava/io/OutputStream;
    :goto_0
    return-void

    .line 560
    :catch_0
    move-exception v0

    .line 561
    .local v0, "e":Ljava/io/IOException;
    const-string v5, "m_Settings"

    const-string v6, "ERROR: Unable to write to file"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 562
    const-string v5, "m_Settings"

    invoke-virtual {v0}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private finaliseEntry(Ljava/lang/String;)V
    .locals 3
    .param p1, "password"    # Ljava/lang/String;

    .prologue
    .line 518
    iget-object v1, p0, Lcom/mwr/example/sieve/SettingsActivity;->ll:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/mwr/example/sieve/PasswordEntry;

    .line 519
    .local v0, "pe":Lcom/mwr/example/sieve/PasswordEntry;
    iput-object p1, v0, Lcom/mwr/example/sieve/PasswordEntry;->password:Ljava/lang/String;

    .line 521
    iget-object v1, p0, Lcom/mwr/example/sieve/SettingsActivity;->out:Ljava/lang/StringBuffer;

    invoke-static {v0}, Lcom/mwr/example/sieve/DBParser;->processElement(Lcom/mwr/example/sieve/PasswordEntry;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 523
    iget-object v1, p0, Lcom/mwr/example/sieve/SettingsActivity;->ll:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 524
    invoke-direct {p0}, Lcom/mwr/example/sieve/SettingsActivity;->finaliseOutput()V

    .line 527
    :cond_0
    return-void
.end method

.method private finaliseInsert([B)V
    .locals 4
    .param p1, "password"    # [B

    .prologue
    .line 436
    iget-object v2, p0, Lcom/mwr/example/sieve/SettingsActivity;->ll:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/mwr/example/sieve/PasswordEntry;

    .line 437
    .local v1, "pe":Lcom/mwr/example/sieve/PasswordEntry;
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 438
    .local v0, "out":Landroid/content/ContentValues;
    const-string v2, "service"

    iget-object v3, v1, Lcom/mwr/example/sieve/PasswordEntry;->service:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 439
    const-string v2, "username"

    iget-object v3, v1, Lcom/mwr/example/sieve/PasswordEntry;->username:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 440
    const-string v2, "password"

    invoke-virtual {v0, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 441
    const-string v2, "email"

    iget-object v3, v1, Lcom/mwr/example/sieve/PasswordEntry;->email:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/mwr/example/sieve/DBContentProvider;->PASSWORDS_URI:Landroid/net/Uri;

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 445
    iget-object v2, p0, Lcom/mwr/example/sieve/SettingsActivity;->ll:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 446
    invoke-direct {p0}, Lcom/mwr/example/sieve/SettingsActivity;->finaliseRestore()V

    .line 449
    :cond_0
    return-void
.end method

.method private finaliseOutput()V
    .locals 2

    .prologue
    .line 531
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->out:Ljava/lang/StringBuffer;

    const-string v1, "</Passwords>"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 532
    iget v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->runningState:I

    sparse-switch v0, :sswitch_data_0

    .line 540
    :goto_0
    const v0, 0xcbbfc

    iput v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->runningState:I

    .line 541
    return-void

    .line 534
    :sswitch_0
    invoke-direct {p0}, Lcom/mwr/example/sieve/SettingsActivity;->finaliseBackupToSD()V

    goto :goto_0

    .line 537
    :sswitch_1
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->netBackup:Lcom/mwr/example/sieve/NetBackupHandler;

    iget-object v1, p0, Lcom/mwr/example/sieve/SettingsActivity;->out:Ljava/lang/StringBuffer;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/mwr/example/sieve/NetBackupHandler;->performNetBackup(Ljava/lang/String;)V

    goto :goto_0

    .line 532
    :sswitch_data_0
    .sparse-switch
        0x983 -> :sswitch_0
        0xfc0b -> :sswitch_1
    .end sparse-switch
.end method

.method private finaliseRestore()V
    .locals 3

    .prologue
    .line 453
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Database Restored"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 454
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/MainLoginActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/SettingsActivity;->startActivity(Landroid/content/Intent;)V

    .line 455
    return-void
.end method

.method private getBackup()V
    .locals 17

    .prologue
    .line 402
    new-instance v1, Ljava/util/LinkedList;

    invoke-direct {v1}, Ljava/util/LinkedList;-><init>()V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mwr/example/sieve/SettingsActivity;->ll:Ljava/util/LinkedList;

    .line 403
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "<Passwords"

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p0

    iput-object v1, v0, Lcom/mwr/example/sieve/SettingsActivity;->out:Ljava/lang/StringBuffer;

    .line 407
    new-instance v1, Landroid/content/CursorLoader;

    sget-object v3, Lcom/mwr/example/sieve/DBContentProvider;->PASSWORDS_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v2, p0

    invoke-direct/range {v1 .. v7}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/content/CursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v8

    .line 408
    .local v8, "c":Landroid/database/Cursor;
    new-instance v1, Landroid/content/CursorLoader;

    sget-object v3, Lcom/mwr/example/sieve/DBContentProvider;->KEYS_URI:Landroid/net/Uri;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object/from16 v2, p0

    invoke-direct/range {v1 .. v7}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Landroid/content/CursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v11

    .line 410
    .local v11, "k":Landroid/database/Cursor;
    invoke-interface {v11}, Landroid/database/Cursor;->moveToFirst()Z

    .line 411
    const-string v1, "Password"

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v12

    .line 412
    .local v12, "key":Ljava/lang/String;
    const-string v1, "pin"

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v11, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v14

    .line 414
    .local v14, "pin":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mwr/example/sieve/SettingsActivity;->out:Ljava/lang/StringBuffer;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, " Key=\""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\" Pin=\""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\">"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 416
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lez v1, :cond_1

    .line 417
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 418
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    invoke-interface {v8}, Landroid/database/Cursor;->getCount()I

    move-result v1

    if-lt v10, v1, :cond_0

    .line 433
    .end local v10    # "i":I
    :goto_1
    return-void

    .line 419
    .restart local v10    # "i":I
    :cond_0
    const-string v1, "service"

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v15

    .line 420
    .local v15, "service":Ljava/lang/String;
    const-string v1, "username"

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v16

    .line 421
    .local v16, "username":Ljava/lang/String;
    const-string v1, "service"

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    .line 422
    .local v9, "email":Ljava/lang/String;
    const-string v1, "password"

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v8, v1}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v13

    .line 423
    .local v13, "password":[B
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mwr/example/sieve/SettingsActivity;->ll:Ljava/util/LinkedList;

    new-instance v2, Lcom/mwr/example/sieve/PasswordEntry;

    const/4 v3, 0x0

    move-object/from16 v0, v16

    invoke-direct {v2, v15, v0, v9, v3}, Lcom/mwr/example/sieve/PasswordEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->offer(Ljava/lang/Object;)Z

    .line 425
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/mwr/example/sieve/SettingsActivity;->serviceConnection:Lcom/mwr/example/sieve/CryptoServiceConnector;

    const/4 v2, 0x0

    const/16 v3, 0x10

    invoke-virtual {v12, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v13, v3}, Lcom/mwr/example/sieve/CryptoServiceConnector;->sendForDecryption(Ljava/lang/String;[BI)V

    .line 426
    invoke-interface {v8}, Landroid/database/Cursor;->moveToNext()Z

    .line 418
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 430
    .end local v9    # "email":Ljava/lang/String;
    .end local v10    # "i":I
    .end local v13    # "password":[B
    .end local v15    # "service":Ljava/lang/String;
    .end local v16    # "username":Ljava/lang/String;
    :cond_1
    invoke-virtual/range {p0 .. p0}, Lcom/mwr/example/sieve/SettingsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "Database exported"

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_1
.end method

.method private getRestore(Ljava/io/InputStream;)V
    .locals 7
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x0

    .line 494
    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-direct {v0, p1}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    .line 495
    .local v0, "bis":Ljava/io/BufferedInputStream;
    const v3, 0x5f5e0ff

    invoke-virtual {v0, v3}, Ljava/io/BufferedInputStream;->mark(I)V

    .line 496
    invoke-static {v0}, Lcom/mwr/example/sieve/DBParser;->getKey(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mwr/example/sieve/SettingsActivity;->mainPassword:Ljava/lang/String;

    .line 497
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->reset()V

    .line 498
    invoke-static {v0}, Lcom/mwr/example/sieve/DBParser;->getPIN(Ljava/io/InputStream;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/mwr/example/sieve/SettingsActivity;->PIN:Ljava/lang/String;

    .line 499
    invoke-virtual {v0}, Ljava/io/BufferedInputStream;->reset()V

    .line 500
    invoke-static {v0}, Lcom/mwr/example/sieve/DBParser;->readFile(Ljava/io/InputStream;)Ljava/util/List;

    move-result-object v3

    check-cast v3, Ljava/util/LinkedList;

    iput-object v3, p0, Lcom/mwr/example/sieve/SettingsActivity;->ll:Ljava/util/LinkedList;

    .line 502
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Lcom/mwr/example/sieve/DBContentProvider;->KEYS_URI:Landroid/net/Uri;

    invoke-virtual {v3, v4, v5, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 503
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Lcom/mwr/example/sieve/DBContentProvider;->PASSWORDS_URI:Landroid/net/Uri;

    invoke-virtual {v3, v4, v5, v5}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 505
    new-instance v2, Landroid/content/ContentValues;

    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 506
    .local v2, "out":Landroid/content/ContentValues;
    const-string v3, "Password"

    iget-object v4, p0, Lcom/mwr/example/sieve/SettingsActivity;->mainPassword:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 507
    const-string v3, "pin"

    iget-object v4, p0, Lcom/mwr/example/sieve/SettingsActivity;->PIN:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 508
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    sget-object v4, Lcom/mwr/example/sieve/DBContentProvider;->KEYS_URI:Landroid/net/Uri;

    invoke-virtual {v3, v4, v2}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 510
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v3, p0, Lcom/mwr/example/sieve/SettingsActivity;->ll:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->size()I

    move-result v3

    if-lt v1, v3, :cond_0

    .line 513
    return-void

    .line 511
    :cond_0
    iget-object v4, p0, Lcom/mwr/example/sieve/SettingsActivity;->serviceConnection:Lcom/mwr/example/sieve/CryptoServiceConnector;

    iget-object v3, p0, Lcom/mwr/example/sieve/SettingsActivity;->mainPassword:Ljava/lang/String;

    const/16 v5, 0x10

    invoke-virtual {v3, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    iget-object v3, p0, Lcom/mwr/example/sieve/SettingsActivity;->ll:Ljava/util/LinkedList;

    invoke-virtual {v3, v1}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/mwr/example/sieve/PasswordEntry;

    iget-object v3, v3, Lcom/mwr/example/sieve/PasswordEntry;->password:Ljava/lang/String;

    invoke-virtual {v4, v5, v3, v6}, Lcom/mwr/example/sieve/CryptoServiceConnector;->sendForEncryption(Ljava/lang/String;Ljava/lang/String;I)V

    .line 510
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private restoreFromFile(Ljava/lang/String;)V
    .locals 4
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 484
    :try_start_0
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    sget-object v2, Lcom/mwr/example/sieve/FileBackupProvider;->FILE_DATABASE:Landroid/net/Uri;

    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/mwr/example/sieve/SettingsActivity;->getRestore(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 489
    :goto_0
    return-void

    .line 485
    :catch_0
    move-exception v0

    .line 486
    .local v0, "e":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorCantRead:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method private restoreFromNet()V
    .locals 1

    .prologue
    .line 394
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->netBackup:Lcom/mwr/example/sieve/NetBackupHandler;

    invoke-virtual {v0}, Lcom/mwr/example/sieve/NetBackupHandler;->performNetRestore()V

    .line 396
    return-void
.end method

.method private restoreFromSD()V
    .locals 2

    .prologue
    .line 374
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/FileSelectActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v1, 0x125

    invoke-virtual {p0, v0, v1}, Lcom/mwr/example/sieve/SettingsActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 375
    return-void
.end method

.method private restoreFromString(Ljava/lang/String;)V
    .locals 4
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    .line 474
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayInputStream;

    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {p0, v1}, Lcom/mwr/example/sieve/SettingsActivity;->getRestore(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 480
    :goto_0
    return-void

    .line 475
    :catch_0
    move-exception v0

    .line 476
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "m_Settings"

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "ERROR: Unable to read / process data from server: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 477
    iget-object v1, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorCantRead:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method private unbind()V
    .locals 1

    .prologue
    .line 299
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->serviceConnection:Lcom/mwr/example/sieve/CryptoServiceConnector;

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/SettingsActivity;->unbindService(Landroid/content/ServiceConnection;)V

    .line 301
    return-void
.end method


# virtual methods
.method public backupToNet(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 585
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->backupNet:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 586
    return-void
.end method

.method public backupToSD(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 577
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->backupSD:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 578
    return-void
.end method

.method public changePIN(Landroid/view/View;)V
    .locals 9
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 346
    new-instance v0, Landroid/content/CursorLoader;

    sget-object v2, Lcom/mwr/example/sieve/DBContentProvider;->KEYS_URI:Landroid/net/Uri;

    move-object v1, p0

    move-object v4, v3

    move-object v5, v3

    move-object v6, v3

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/CursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v8

    .line 347
    .local v8, "k":Landroid/database/Cursor;
    invoke-interface {v8}, Landroid/database/Cursor;->moveToFirst()Z

    .line 349
    const-string v0, "pin"

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {v8, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->PIN:Ljava/lang/String;

    .line 351
    new-instance v7, Landroid/content/Intent;

    const-class v0, Lcom/mwr/example/sieve/PINActivity;

    invoke-direct {v7, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 352
    .local v7, "intent":Landroid/content/Intent;
    const-string v0, "com.mwr.example.sieve.PIN"

    iget-object v1, p0, Lcom/mwr/example/sieve/SettingsActivity;->PIN:Ljava/lang/String;

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 353
    const-string v0, "com.mwr.example.sieve.REQUEST"

    const v1, 0x169db

    invoke-virtual {v7, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 355
    const/16 v0, 0x1c8

    invoke-virtual {p0, v7, v0}, Lcom/mwr/example/sieve/SettingsActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 356
    return-void
.end method

.method public connected()V
    .locals 0

    .prologue
    .line 664
    return-void
.end method

.method public decryptionReturned(Ljava/lang/String;I)V
    .locals 0
    .param p1, "result"    # Ljava/lang/String;
    .param p2, "code"    # I

    .prologue
    .line 645
    invoke-direct {p0, p1}, Lcom/mwr/example/sieve/SettingsActivity;->finaliseEntry(Ljava/lang/String;)V

    .line 647
    return-void
.end method

.method public deleteAll(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 573
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->deleteALL:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 574
    return-void
.end method

.method public encryptionReturned([BI)V
    .locals 0
    .param p1, "result"    # [B
    .param p2, "code"    # I

    .prologue
    .line 652
    invoke-direct {p0, p1}, Lcom/mwr/example/sieve/SettingsActivity;->finaliseInsert([B)V

    .line 653
    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 3
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v2, -0x1

    .line 595
    const/16 v1, 0x125

    if-ne p1, v1, :cond_1

    .line 597
    if-ne p2, v2, :cond_0

    .line 600
    const-string v1, "com.mwr.example.sieve.FILE"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 601
    .local v0, "one":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/mwr/example/sieve/SettingsActivity;->restoreFromFile(Ljava/lang/String;)V

    .line 616
    .end local v0    # "one":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 606
    :cond_1
    const/16 v1, 0x1c8

    if-ne p1, v1, :cond_0

    .line 607
    if-ne p2, v2, :cond_0

    .line 608
    const-string v1, "com.mwr.example.sieve.PIN"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 609
    .restart local v0    # "one":Ljava/lang/String;
    invoke-direct {p0, v0}, Lcom/mwr/example/sieve/SettingsActivity;->changePIN(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 612
    iget-object v1, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorCantChangePin:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 322
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->finish()V

    .line 323
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 94
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 95
    const v0, 0x7f030005

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/SettingsActivity;->setContentView(I)V

    .line 97
    new-instance v0, Lcom/mwr/example/sieve/NetBackupHandler;

    const-string v1, "10.0.2.2"

    const-string v2, "8001"

    invoke-direct {v0, v1, v2, p0}, Lcom/mwr/example/sieve/NetBackupHandler;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/mwr/example/sieve/NetBackupHandler$ResultListener;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->netBackup:Lcom/mwr/example/sieve/NetBackupHandler;

    .line 101
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->backupSD:Landroid/app/AlertDialog$Builder;

    .line 102
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->backupSD:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f050013

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 103
    const-string v1, "Confirm"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 105
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->backupSD:Landroid/app/AlertDialog$Builder;

    const-string v1, "Yes"

    new-instance v2, Lcom/mwr/example/sieve/SettingsActivity$1;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/SettingsActivity$1;-><init>(Lcom/mwr/example/sieve/SettingsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 114
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->backupSD:Landroid/app/AlertDialog$Builder;

    const-string v1, "Cancel"

    new-instance v2, Lcom/mwr/example/sieve/SettingsActivity$2;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/SettingsActivity$2;-><init>(Lcom/mwr/example/sieve/SettingsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 123
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->backupSD:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 125
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->deleteALL:Landroid/app/AlertDialog$Builder;

    .line 126
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->deleteALL:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f050011

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 127
    const-string v1, "Confirm"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 130
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->deleteALL:Landroid/app/AlertDialog$Builder;

    const-string v1, "Yes"

    new-instance v2, Lcom/mwr/example/sieve/SettingsActivity$3;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/SettingsActivity$3;-><init>(Lcom/mwr/example/sieve/SettingsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 139
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->deleteALL:Landroid/app/AlertDialog$Builder;

    const-string v1, "Cancel"

    new-instance v2, Lcom/mwr/example/sieve/SettingsActivity$4;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/SettingsActivity$4;-><init>(Lcom/mwr/example/sieve/SettingsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 148
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->deleteALL:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 150
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->restore:Landroid/app/AlertDialog$Builder;

    .line 151
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->restore:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f050012

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 152
    const-string v1, "Restore"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 154
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->restore:Landroid/app/AlertDialog$Builder;

    const-string v1, "Yes"

    new-instance v2, Lcom/mwr/example/sieve/SettingsActivity$5;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/SettingsActivity$5;-><init>(Lcom/mwr/example/sieve/SettingsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 162
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->restore:Landroid/app/AlertDialog$Builder;

    const-string v1, "Cancel"

    new-instance v2, Lcom/mwr/example/sieve/SettingsActivity$6;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/SettingsActivity$6;-><init>(Lcom/mwr/example/sieve/SettingsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 171
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->restore:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 173
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->netRestore:Landroid/app/AlertDialog$Builder;

    .line 174
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->netRestore:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f050014

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 175
    const-string v1, "Restore"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 177
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->netRestore:Landroid/app/AlertDialog$Builder;

    const-string v1, "Yes"

    new-instance v2, Lcom/mwr/example/sieve/SettingsActivity$7;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/SettingsActivity$7;-><init>(Lcom/mwr/example/sieve/SettingsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 185
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->netRestore:Landroid/app/AlertDialog$Builder;

    const-string v1, "Cancel"

    new-instance v2, Lcom/mwr/example/sieve/SettingsActivity$8;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/SettingsActivity$8;-><init>(Lcom/mwr/example/sieve/SettingsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 194
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->netRestore:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 196
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->backupNet:Landroid/app/AlertDialog$Builder;

    .line 197
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->backupNet:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f050015

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 198
    const-string v1, "Backup"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 200
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->backupNet:Landroid/app/AlertDialog$Builder;

    const-string v1, "Yes"

    new-instance v2, Lcom/mwr/example/sieve/SettingsActivity$9;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/SettingsActivity$9;-><init>(Lcom/mwr/example/sieve/SettingsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 208
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->backupNet:Landroid/app/AlertDialog$Builder;

    const-string v1, "Cancel"

    new-instance v2, Lcom/mwr/example/sieve/SettingsActivity$10;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/SettingsActivity$10;-><init>(Lcom/mwr/example/sieve/SettingsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 217
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->backupNet:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 219
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorDBEmpty:Landroid/app/AlertDialog$Builder;

    .line 220
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorDBEmpty:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f050017

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 221
    const-string v1, "Error"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 222
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorDBEmpty:Landroid/app/AlertDialog$Builder;

    const-string v1, "OK"

    new-instance v2, Lcom/mwr/example/sieve/SettingsActivity$11;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/SettingsActivity$11;-><init>(Lcom/mwr/example/sieve/SettingsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 230
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorDBEmpty:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 232
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorCantRead:Landroid/app/AlertDialog$Builder;

    .line 233
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorCantRead:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f050018

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 234
    const-string v1, "Error"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 235
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorCantRead:Landroid/app/AlertDialog$Builder;

    const-string v1, "OK"

    new-instance v2, Lcom/mwr/example/sieve/SettingsActivity$12;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/SettingsActivity$12;-><init>(Lcom/mwr/example/sieve/SettingsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 243
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorCantRead:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 245
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorCantChangePin:Landroid/app/AlertDialog$Builder;

    .line 246
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorCantChangePin:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f050016

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 247
    const-string v1, "Error"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 248
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorCantChangePin:Landroid/app/AlertDialog$Builder;

    const-string v1, "OK"

    new-instance v2, Lcom/mwr/example/sieve/SettingsActivity$13;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/SettingsActivity$13;-><init>(Lcom/mwr/example/sieve/SettingsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 256
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->errorCantChangePin:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 259
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->connectionError:Landroid/app/AlertDialog$Builder;

    .line 260
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->connectionError:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f050008

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 261
    const-string v1, "Error"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 262
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->connectionError:Landroid/app/AlertDialog$Builder;

    const-string v1, "OK"

    new-instance v2, Lcom/mwr/example/sieve/SettingsActivity$14;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/SettingsActivity$14;-><init>(Lcom/mwr/example/sieve/SettingsActivity;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 270
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->connectionError:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 275
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    .line 276
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 280
    :cond_0
    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 314
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f070006

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 315
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 328
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 333
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 330
    :pswitch_0
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->onBackPressed()V

    .line 331
    const/4 v0, 0x1

    goto :goto_0

    .line 328
    nop

    :pswitch_data_0
    .packed-switch 0x102002c
        :pswitch_0
    .end packed-switch
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 285
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 286
    invoke-direct {p0}, Lcom/mwr/example/sieve/SettingsActivity;->unbind()V

    .line 287
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 292
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 293
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/CryptoService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/mwr/example/sieve/SettingsActivity;->serviceConnection:Lcom/mwr/example/sieve/CryptoServiceConnector;

    .line 294
    const/4 v2, 0x1

    .line 293
    invoke-virtual {p0, v0, v1, v2}, Lcom/mwr/example/sieve/SettingsActivity;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 295
    return-void
.end method

.method public onTaskFinish(ILjava/lang/String;)V
    .locals 3
    .param p1, "task"    # I
    .param p2, "result"    # Ljava/lang/String;

    .prologue
    .line 621
    sparse-switch p1, :sswitch_data_0

    .line 633
    :goto_0
    return-void

    .line 623
    :sswitch_0
    invoke-virtual {p0}, Lcom/mwr/example/sieve/SettingsActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Database exported"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 627
    :sswitch_1
    invoke-direct {p0, p2}, Lcom/mwr/example/sieve/SettingsActivity;->restoreFromString(Ljava/lang/String;)V

    goto :goto_0

    .line 630
    :sswitch_2
    const-string v0, "m_Settings"

    const-string v1, "Error during backup."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 621
    nop

    :sswitch_data_0
    .sparse-switch
        0x5bbd -> :sswitch_2
        0x7043b -> :sswitch_0
        0xb6111 -> :sswitch_1
    .end sparse-switch
.end method

.method public restoreFromNet(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 589
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->netRestore:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 590
    return-void
.end method

.method public restoreFromSD(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 581
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->restore:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 582
    return-void
.end method

.method public sendFailed()V
    .locals 1

    .prologue
    .line 657
    iget-object v0, p0, Lcom/mwr/example/sieve/SettingsActivity;->connectionError:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 658
    return-void
.end method
