.class public Lcom/mwr/example/sieve/PWList;
.super Landroid/app/Activity;
.source "PWList.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/app/Activity;",
        "Landroid/widget/AdapterView$OnItemClickListener;",
        "Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;",
        "Landroid/widget/AdapterView$OnItemLongClickListener;"
    }
.end annotation


# static fields
.field public static final FOR_ACCESS:I = 0x28d

.field public static final FOR_EDIT:I = 0x1d4

.field public static final FOR_INSERT:I = 0x2df

.field public static final KEY:Ljava/lang/String; = "com.mwr.example.sieve.KEY"

.field private static final PWLIST_ADD:I = 0x1

.field private static final PWLIST_EDIT:I = 0x2

.field private static final PWLIST_SETTINGS:I = 0x3

.field public static final REQUEST_TYPE:Ljava/lang/String; = "com.mwr.example.sieve.REQUEST_TYPE"

.field public static final STRING:Ljava/lang/String; = "com.mwr.example.sieve.STRING"

.field private static final TAG:Ljava/lang/String; = "m_PWList"


# instance fields
.field private MainPassword:Ljava/lang/String;

.field private adapter:Landroid/support/v4/widget/SimpleCursorAdapter;

.field builder:Landroid/app/AlertDialog$Builder;

.field canCon:Landroid/app/AlertDialog;

.field cannotCon:Landroid/app/AlertDialog;

.field private connectionError:Landroid/app/AlertDialog$Builder;

.field private prompt:Landroid/widget/TextView;

.field private pwList:Landroid/widget/ListView;

.field private serviceConnection:Lcom/mwr/example/sieve/CryptoServiceConnector;

.field private workingEntry:Lcom/mwr/example/sieve/PasswordEntry;

.field private workingRow:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 67
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/mwr/example/sieve/PWList;->adapter:Landroid/support/v4/widget/SimpleCursorAdapter;

    .line 70
    const/4 v0, -0x1

    iput v0, p0, Lcom/mwr/example/sieve/PWList;->workingRow:I

    .line 36
    return-void
.end method

.method private addEntry()V
    .locals 3

    .prologue
    .line 353
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/AddEntryActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 354
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "com.mwr.example.sieve.REQUEST"

    const/16 v2, 0x110d

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 355
    const-string v1, "com.mwr.example.sieve.REQUEST_TYPE"

    const/16 v2, 0x2df

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 356
    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/mwr/example/sieve/PWList;->startActivityForResult(Landroid/content/Intent;I)V

    .line 357
    return-void
.end method

.method private deleteEntry(I)V
    .locals 5
    .param p1, "id"    # I

    .prologue
    const/4 v4, 0x0

    .line 343
    const-string v0, "_id = ?"

    .line 344
    .local v0, "selection":Ljava/lang/String;
    const/4 v2, 0x1

    new-array v1, v2, [Ljava/lang/String;

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    .line 346
    .local v1, "selectionArgs":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PWList;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/mwr/example/sieve/DBContentProvider;->PASSWORDS_URI:Landroid/net/Uri;

    invoke-virtual {v2, v3, v0, v1}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    .line 347
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PWList;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "Entry deleted"

    invoke-static {v2, v3, v4}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/Toast;->show()V

    .line 348
    invoke-direct {p0}, Lcom/mwr/example/sieve/PWList;->populateList()V

    .line 350
    return-void
.end method

.method private finaliseEntry([BI)Z
    .locals 3
    .param p1, "encryptedString"    # [B
    .param p2, "code"    # I

    .prologue
    .line 296
    sparse-switch p2, :sswitch_data_0

    .line 302
    const-string v0, "m_PWList"

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "unrecognised MSG_TYPE for finalisedEntry: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 303
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 298
    :sswitch_0
    invoke-direct {p0, p1}, Lcom/mwr/example/sieve/PWList;->finaliseInsert([B)Z

    move-result v0

    goto :goto_0

    .line 300
    :sswitch_1
    invoke-direct {p0, p1}, Lcom/mwr/example/sieve/PWList;->finaliseUpdate([B)Z

    move-result v0

    goto :goto_0

    .line 296
    nop

    :sswitch_data_0
    .sparse-switch
        0x1d4 -> :sswitch_1
        0x2df -> :sswitch_0
    .end sparse-switch
.end method

.method private finaliseInsert([B)Z
    .locals 4
    .param p1, "encryptedString"    # [B

    .prologue
    .line 311
    new-instance v0, Landroid/content/ContentValues;

    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 312
    .local v0, "out":Landroid/content/ContentValues;
    const-string v2, "service"

    iget-object v3, p0, Lcom/mwr/example/sieve/PWList;->workingEntry:Lcom/mwr/example/sieve/PasswordEntry;

    iget-object v3, v3, Lcom/mwr/example/sieve/PasswordEntry;->service:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    const-string v2, "username"

    iget-object v3, p0, Lcom/mwr/example/sieve/PWList;->workingEntry:Lcom/mwr/example/sieve/PasswordEntry;

    iget-object v3, v3, Lcom/mwr/example/sieve/PasswordEntry;->username:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 314
    const-string v2, "password"

    invoke-virtual {v0, v2, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;[B)V

    .line 315
    const-string v2, "email"

    iget-object v3, p0, Lcom/mwr/example/sieve/PWList;->workingEntry:Lcom/mwr/example/sieve/PasswordEntry;

    iget-object v3, v3, Lcom/mwr/example/sieve/PasswordEntry;->email:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PWList;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v2

    sget-object v3, Lcom/mwr/example/sieve/DBContentProvider;->PASSWORDS_URI:Landroid/net/Uri;

    invoke-virtual {v2, v3, v0}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    move-result-object v1

    .line 319
    .local v1, "result":Landroid/net/Uri;
    if-eqz v1, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private finaliseUpdate([B)Z
    .locals 7
    .param p1, "encryptedString"    # [B

    .prologue
    const/4 v6, 0x1

    const/4 v3, 0x0

    .line 327
    const-string v1, "_id = ?"

    .line 328
    .local v1, "selection":Ljava/lang/String;
    new-array v2, v6, [Ljava/lang/String;

    iget v4, p0, Lcom/mwr/example/sieve/PWList;->workingRow:I

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 330
    .local v2, "selectionArgs":[Ljava/lang/String;
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PWList;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    sget-object v5, Lcom/mwr/example/sieve/DBContentProvider;->PASSWORDS_URI:Landroid/net/Uri;

    invoke-virtual {v4, v5, v1, v2}, Landroid/content/ContentResolver;->delete(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I

    move-result v0

    .line 332
    .local v0, "result":I
    if-ne v0, v6, :cond_0

    .line 333
    invoke-direct {p0, p1}, Lcom/mwr/example/sieve/PWList;->finaliseInsert([B)Z

    move-result v3

    .line 336
    :goto_0
    return v3

    .line 335
    :cond_0
    const-string v4, "m_PWList"

    const-string v5, "failed to delete entry from database"

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method private openSettings()V
    .locals 2

    .prologue
    .line 360
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/SettingsActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/4 v1, 0x3

    invoke-virtual {p0, v0, v1}, Lcom/mwr/example/sieve/PWList;->startActivityForResult(Landroid/content/Intent;I)V

    .line 361
    return-void
.end method

.method private populateList()V
    .locals 8

    .prologue
    const/4 v3, 0x0

    .line 281
    new-instance v0, Landroid/content/CursorLoader;

    sget-object v2, Lcom/mwr/example/sieve/DBContentProvider;->PASSWORDS_URI:Landroid/net/Uri;

    const-string v6, "service"

    move-object v1, p0

    move-object v4, v3

    move-object v5, v3

    invoke-direct/range {v0 .. v6}, Landroid/content/CursorLoader;-><init>(Landroid/content/Context;Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/CursorLoader;->loadInBackground()Landroid/database/Cursor;

    move-result-object v7

    .line 282
    .local v7, "c":Landroid/database/Cursor;
    iget-object v0, p0, Lcom/mwr/example/sieve/PWList;->adapter:Landroid/support/v4/widget/SimpleCursorAdapter;

    invoke-virtual {v0, v7}, Landroid/support/v4/widget/SimpleCursorAdapter;->changeCursor(Landroid/database/Cursor;)V

    .line 284
    invoke-interface {v7}, Landroid/database/Cursor;->getCount()I

    move-result v0

    if-lez v0, :cond_0

    .line 285
    iget-object v0, p0, Lcom/mwr/example/sieve/PWList;->prompt:Landroid/widget/TextView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 290
    :goto_0
    return-void

    .line 287
    :cond_0
    iget-object v0, p0, Lcom/mwr/example/sieve/PWList;->prompt:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0
.end method

.method private unbind()V
    .locals 1

    .prologue
    .line 274
    iget-object v0, p0, Lcom/mwr/example/sieve/PWList;->serviceConnection:Lcom/mwr/example/sieve/CryptoServiceConnector;

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/PWList;->unbindService(Landroid/content/ServiceConnection;)V

    .line 275
    return-void
.end method


# virtual methods
.method public connected()V
    .locals 0

    .prologue
    .line 217
    invoke-direct {p0}, Lcom/mwr/example/sieve/PWList;->populateList()V

    .line 218
    return-void
.end method

.method public decryptionReturned(Ljava/lang/String;I)V
    .locals 6
    .param p1, "result"    # Ljava/lang/String;
    .param p2, "code"    # I

    .prologue
    .line 228
    sparse-switch p2, :sswitch_data_0

    .line 249
    :goto_0
    return-void

    .line 230
    :sswitch_0
    const-string v3, "clipboard"

    invoke-virtual {p0, v3}, Lcom/mwr/example/sieve/PWList;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/ClipboardManager;

    .line 231
    .local v1, "clipboard":Landroid/content/ClipboardManager;
    const-string v3, "Password"

    invoke-static {v3, p1}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v0

    .line 232
    .local v0, "clip":Landroid/content/ClipData;
    invoke-virtual {v1, v0}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 234
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PWList;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "Password Copied to clipboard"

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 238
    .end local v0    # "clip":Landroid/content/ClipData;
    .end local v1    # "clipboard":Landroid/content/ClipboardManager;
    :sswitch_1
    iget-object v3, p0, Lcom/mwr/example/sieve/PWList;->workingEntry:Lcom/mwr/example/sieve/PasswordEntry;

    iput-object p1, v3, Lcom/mwr/example/sieve/PasswordEntry;->password:Ljava/lang/String;

    .line 240
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/mwr/example/sieve/AddEntryActivity;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 241
    .local v2, "intent":Landroid/content/Intent;
    const-string v3, "com.mwr.example.sieve.ENTRY"

    iget-object v4, p0, Lcom/mwr/example/sieve/PWList;->workingEntry:Lcom/mwr/example/sieve/PasswordEntry;

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 242
    const-string v3, "com.mwr.example.sieve.REQUEST"

    const/16 v4, 0x92a

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 243
    const-string v3, "com.mwr.example.sieve.REQUEST_TYPE"

    const/16 v4, 0x1d4

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 244
    const/4 v3, 0x2

    invoke-virtual {p0, v2, v3}, Lcom/mwr/example/sieve/PWList;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 228
    nop

    :sswitch_data_0
    .sparse-switch
        0x1d4 -> :sswitch_1
        0x28d -> :sswitch_0
    .end sparse-switch
.end method

.method public encryptionReturned([BI)V
    .locals 3
    .param p1, "result"    # [B
    .param p2, "code"    # I

    .prologue
    const/4 v2, 0x0

    .line 255
    invoke-direct {p0, p1, p2}, Lcom/mwr/example/sieve/PWList;->finaliseEntry([BI)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 256
    invoke-direct {p0}, Lcom/mwr/example/sieve/PWList;->populateList()V

    .line 257
    const/16 v0, 0x2df

    if-ne p2, v0, :cond_1

    .line 258
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PWList;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Entry Added"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 265
    :cond_0
    :goto_0
    return-void

    .line 259
    :cond_1
    const/16 v0, 0x1d4

    if-ne p2, v0, :cond_0

    .line 260
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PWList;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "Entry Updated"

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 263
    :cond_2
    const-string v0, "m_PWList"

    const-string v1, "entry to db failed!"

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 5
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 180
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 182
    packed-switch p1, :pswitch_data_0

    .line 208
    :cond_0
    :goto_0
    return-void

    .line 185
    :pswitch_0
    const/4 v1, -0x1

    if-ne p2, v1, :cond_0

    .line 187
    const-string v1, "com.mwr.example.sieve.ENTRY"

    invoke-virtual {p3, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/mwr/example/sieve/PasswordEntry;

    .line 189
    .local v0, "temp":Lcom/mwr/example/sieve/PasswordEntry;
    if-nez v0, :cond_1

    .line 190
    iget v1, p0, Lcom/mwr/example/sieve/PWList;->workingRow:I

    invoke-direct {p0, v1}, Lcom/mwr/example/sieve/PWList;->deleteEntry(I)V

    goto :goto_0

    .line 192
    :cond_1
    iput-object v0, p0, Lcom/mwr/example/sieve/PWList;->workingEntry:Lcom/mwr/example/sieve/PasswordEntry;

    .line 193
    const/4 v1, 0x1

    if-ne p1, v1, :cond_2

    .line 194
    iget-object v1, p0, Lcom/mwr/example/sieve/PWList;->serviceConnection:Lcom/mwr/example/sieve/CryptoServiceConnector;

    iget-object v2, p0, Lcom/mwr/example/sieve/PWList;->MainPassword:Ljava/lang/String;

    iget-object v3, p0, Lcom/mwr/example/sieve/PWList;->workingEntry:Lcom/mwr/example/sieve/PasswordEntry;

    iget-object v3, v3, Lcom/mwr/example/sieve/PasswordEntry;->password:Ljava/lang/String;

    const/16 v4, 0x2df

    invoke-virtual {v1, v2, v3, v4}, Lcom/mwr/example/sieve/CryptoServiceConnector;->sendForEncryption(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0

    .line 195
    :cond_2
    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    .line 196
    iget-object v1, p0, Lcom/mwr/example/sieve/PWList;->serviceConnection:Lcom/mwr/example/sieve/CryptoServiceConnector;

    iget-object v2, p0, Lcom/mwr/example/sieve/PWList;->MainPassword:Ljava/lang/String;

    iget-object v3, p0, Lcom/mwr/example/sieve/PWList;->workingEntry:Lcom/mwr/example/sieve/PasswordEntry;

    iget-object v3, v3, Lcom/mwr/example/sieve/PasswordEntry;->password:Ljava/lang/String;

    const/16 v4, 0x1d4

    invoke-virtual {v1, v2, v3, v4}, Lcom/mwr/example/sieve/CryptoServiceConnector;->sendForEncryption(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0

    .line 182
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public onBackPressed()V
    .locals 2

    .prologue
    .line 171
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 172
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "android.intent.category.HOME"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 173
    const/high16 v1, 0x4000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 174
    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/PWList;->startActivity(Landroid/content/Intent;)V

    .line 175
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v8, 0x1

    const/4 v6, 0x2

    .line 85
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 86
    const v0, 0x7f030004

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/PWList;->setContentView(I)V

    .line 87
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PWList;->getIntent()Landroid/content/Intent;

    move-result-object v7

    .line 88
    .local v7, "in":Landroid/content/Intent;
    const-string v0, "com.mwr.example.sieve.KEY"

    invoke-virtual {v7, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/mwr/example/sieve/PWList;->MainPassword:Ljava/lang/String;

    .line 90
    new-instance v0, Lcom/mwr/example/sieve/CryptoServiceConnector;

    invoke-direct {v0, p0}, Lcom/mwr/example/sieve/CryptoServiceConnector;-><init>(Lcom/mwr/example/sieve/CryptoServiceConnector$ResponseListener;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/PWList;->serviceConnection:Lcom/mwr/example/sieve/CryptoServiceConnector;

    .line 92
    new-instance v0, Landroid/support/v4/widget/SimpleCursorAdapter;

    .line 94
    const v2, 0x1090004

    .line 95
    const/4 v3, 0x0

    .line 96
    new-array v4, v6, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v5, "service"

    aput-object v5, v4, v1

    const-string v1, "username"

    aput-object v1, v4, v8

    .line 97
    new-array v5, v6, [I

    fill-array-data v5, :array_0

    move-object v1, p0

    .line 98
    invoke-direct/range {v0 .. v6}, Landroid/support/v4/widget/SimpleCursorAdapter;-><init>(Landroid/content/Context;ILandroid/database/Cursor;[Ljava/lang/String;[II)V

    .line 92
    iput-object v0, p0, Lcom/mwr/example/sieve/PWList;->adapter:Landroid/support/v4/widget/SimpleCursorAdapter;

    .line 103
    const v0, 0x7f08001e

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/PWList;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    iput-object v0, p0, Lcom/mwr/example/sieve/PWList;->pwList:Landroid/widget/ListView;

    .line 104
    iget-object v0, p0, Lcom/mwr/example/sieve/PWList;->pwList:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/mwr/example/sieve/PWList;->adapter:Landroid/support/v4/widget/SimpleCursorAdapter;

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 105
    iget-object v0, p0, Lcom/mwr/example/sieve/PWList;->pwList:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 106
    iget-object v0, p0, Lcom/mwr/example/sieve/PWList;->pwList:Landroid/widget/ListView;

    invoke-virtual {v0, p0}, Landroid/widget/ListView;->setOnItemLongClickListener(Landroid/widget/AdapterView$OnItemLongClickListener;)V

    .line 108
    const v0, 0x7f08001f

    invoke-virtual {p0, v0}, Lcom/mwr/example/sieve/PWList;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/mwr/example/sieve/PWList;->prompt:Landroid/widget/TextView;

    .line 112
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/mwr/example/sieve/PWList;->connectionError:Landroid/app/AlertDialog$Builder;

    .line 113
    iget-object v0, p0, Lcom/mwr/example/sieve/PWList;->connectionError:Landroid/app/AlertDialog$Builder;

    const v1, 0x7f050008

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 114
    const-string v1, "Error"

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 115
    iget-object v0, p0, Lcom/mwr/example/sieve/PWList;->connectionError:Landroid/app/AlertDialog$Builder;

    const-string v1, "OK"

    new-instance v2, Lcom/mwr/example/sieve/PWList$1;

    invoke-direct {v2, p0}, Lcom/mwr/example/sieve/PWList$1;-><init>(Lcom/mwr/example/sieve/PWList;)V

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 123
    iget-object v0, p0, Lcom/mwr/example/sieve/PWList;->connectionError:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    .line 125
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xe

    if-lt v0, v1, :cond_0

    .line 126
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PWList;->getActionBar()Landroid/app/ActionBar;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 128
    :cond_0
    return-void

    .line 97
    nop

    :array_0
    .array-data 4
        0x1020014
        0x1020015
    .end array-data
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 148
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PWList;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f070005

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 149
    const/4 v0, 0x1

    return v0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 5
    .param p2, "view"    # Landroid/view/View;
    .param p3, "element"    # I
    .param p4, "b"    # J
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
    .line 386
    .local p1, "list":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v1, p0, Lcom/mwr/example/sieve/PWList;->adapter:Landroid/support/v4/widget/SimpleCursorAdapter;

    invoke-virtual {v1}, Landroid/support/v4/widget/SimpleCursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 387
    .local v0, "c":Landroid/database/Cursor;
    invoke-interface {v0, p3}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 388
    iget-object v1, p0, Lcom/mwr/example/sieve/PWList;->serviceConnection:Lcom/mwr/example/sieve/CryptoServiceConnector;

    iget-object v2, p0, Lcom/mwr/example/sieve/PWList;->MainPassword:Ljava/lang/String;

    const-string v3, "password"

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    invoke-interface {v0, v3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v3

    const/16 v4, 0x28d

    invoke-virtual {v1, v2, v3, v4}, Lcom/mwr/example/sieve/CryptoServiceConnector;->sendForDecryption(Ljava/lang/String;[BI)V

    .line 389
    return-void
.end method

.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 8
    .param p2, "view"    # Landroid/view/View;
    .param p3, "element"    # I
    .param p4, "b"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .prologue
    .line 368
    .local p1, "list":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v4, p0, Lcom/mwr/example/sieve/PWList;->adapter:Landroid/support/v4/widget/SimpleCursorAdapter;

    invoke-virtual {v4}, Landroid/support/v4/widget/SimpleCursorAdapter;->getCursor()Landroid/database/Cursor;

    move-result-object v0

    .line 369
    .local v0, "c":Landroid/database/Cursor;
    invoke-interface {v0, p3}, Landroid/database/Cursor;->moveToPosition(I)Z

    .line 370
    const-string v4, "_id"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getInt(I)I

    move-result v4

    iput v4, p0, Lcom/mwr/example/sieve/PWList;->workingRow:I

    .line 372
    const-string v4, "service"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 373
    .local v2, "serviceMessenger":Ljava/lang/String;
    const-string v4, "username"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    .line 374
    .local v3, "username":Ljava/lang/String;
    const-string v4, "email"

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v4

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 375
    .local v1, "email":Ljava/lang/String;
    new-instance v4, Lcom/mwr/example/sieve/PasswordEntry;

    const/4 v5, 0x0

    invoke-direct {v4, v2, v3, v1, v5}, Lcom/mwr/example/sieve/PasswordEntry;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iput-object v4, p0, Lcom/mwr/example/sieve/PWList;->workingEntry:Lcom/mwr/example/sieve/PasswordEntry;

    .line 377
    iget-object v4, p0, Lcom/mwr/example/sieve/PWList;->serviceConnection:Lcom/mwr/example/sieve/CryptoServiceConnector;

    iget-object v5, p0, Lcom/mwr/example/sieve/PWList;->MainPassword:Ljava/lang/String;

    const-string v6, "password"

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    invoke-interface {v0, v6}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object v6

    const/16 v7, 0x1d4

    invoke-virtual {v4, v5, v6, v7}, Lcom/mwr/example/sieve/CryptoServiceConnector;->sendForDecryption(Ljava/lang/String;[BI)V

    .line 379
    const/4 v4, 0x0

    return v4
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v0, 0x1

    .line 155
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 166
    invoke-super {p0, p1}, Landroid/app/Activity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    :goto_0
    return v0

    .line 157
    :sswitch_0
    invoke-virtual {p0}, Lcom/mwr/example/sieve/PWList;->onBackPressed()V

    goto :goto_0

    .line 160
    :sswitch_1
    invoke-direct {p0}, Lcom/mwr/example/sieve/PWList;->openSettings()V

    goto :goto_0

    .line 163
    :sswitch_2
    invoke-direct {p0}, Lcom/mwr/example/sieve/PWList;->addEntry()V

    goto :goto_0

    .line 155
    nop

    :sswitch_data_0
    .sparse-switch
        0x102002c -> :sswitch_0
        0x7f080033 -> :sswitch_1
        0x7f080034 -> :sswitch_2
    .end sparse-switch
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 133
    invoke-super {p0}, Landroid/app/Activity;->onPause()V

    .line 134
    invoke-direct {p0}, Lcom/mwr/example/sieve/PWList;->unbind()V

    .line 135
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 140
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    .line 141
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/mwr/example/sieve/CryptoService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    iget-object v1, p0, Lcom/mwr/example/sieve/PWList;->serviceConnection:Lcom/mwr/example/sieve/CryptoServiceConnector;

    .line 142
    const/4 v2, 0x1

    .line 141
    invoke-virtual {p0, v0, v1, v2}, Lcom/mwr/example/sieve/PWList;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 143
    return-void
.end method

.method public sendFailed()V
    .locals 1

    .prologue
    .line 222
    iget-object v0, p0, Lcom/mwr/example/sieve/PWList;->connectionError:Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 223
    return-void
.end method
