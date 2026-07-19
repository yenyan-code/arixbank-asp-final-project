-- Table: TRANSACTIONS
CREATE TABLE [TRANSACTIONS] (
    [TransactionID] int NOT NULL ,
    [UserID] int NOT NULL ,
    [RecipientUserID] int NULL ,
    [TransactionType] nvarchar(30) NOT NULL ,
    [Amount] decimal NOT NULL ,
    [Description] nvarchar(255) NULL ,
    [DateCreated] datetime NOT NULL DEFAULT (getdate()),
    [BalanceAfterTransaction] decimal NOT NULL ,
    CONSTRAINT [PK_TRANSACTIONS] PRIMARY KEY ([TransactionID])
);

GO

INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (43, 31, NULL, 'Deposit', 1000.00, 'Cash Deposit', '04/05/2026 8:16:04 pm', 1000.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (44, 31, NULL, 'Withdraw', 100.00, 'Cash Withdrawal', '04/05/2026 8:16:09 pm', 900.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (45, 31, 26, 'Transfer Sent', 100.00, 'Money transferred', '04/05/2026 8:25:47 pm', 800.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (46, 26, NULL, 'Deposit', 500.00, 'Cash Deposit', '04/05/2026 9:01:17 pm', 600.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (47, 26, NULL, 'Withdraw', 100.00, 'Cash Withdrawal', '04/05/2026 9:01:24 pm', 500.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (48, 26, 31, 'Transfer Sent', 100.00, 'Money transferred', '04/05/2026 9:01:43 pm', 400.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (49, 32, NULL, 'Deposit', 2000.00, 'Cash Deposit', '05/05/2026 3:03:18 pm', 2000.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (50, 32, NULL, 'Withdraw', 500.00, 'Cash Withdrawal', '05/05/2026 3:03:24 pm', 1500.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (51, 32, 31, 'Transfer Sent', 500.00, 'Money transferred', '05/05/2026 3:03:41 pm', 1000.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (52, 32, 26, 'Transfer Sent', 100.00, 'Money transferred', '05/05/2026 3:20:23 pm', 900.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (58, 32, NULL, 'Deposit', 100.00, 'Cash Deposit', '05/05/2026 3:41:58 pm', 1000.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (59, 32, NULL, 'Withdraw', 200.00, 'Cash Withdrawal', '05/05/2026 3:42:04 pm', 800.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (63, 26, 31, 'Transfer Sent', 100.00, 'Money transferred', '05/05/2026 4:03:24 pm', 400.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (64, 26, 31, 'Transfer Sent', 100.00, 'Money transferred', '05/05/2026 4:08:22 pm', 300.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (65, 31, 26, 'Transfer Sent', 100.00, 'Money transferred', '05/05/2026 4:09:05 pm', 1500.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (66, 31, 26, 'Transfer Sent', 100.00, 'Money transferred', '05/05/2026 4:12:33 pm', 1400.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (67, 26, 31, 'Transfer Sent', 100.00, 'Money transferred', '05/05/2026 4:14:35 pm', 400.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (68, 31, NULL, 'Deposit', 100.00, 'Cash Deposit', '05/05/2026 4:18:48 pm', 1600.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (69, 31, NULL, 'Withdraw', 200.00, 'Cash Withdrawal', '05/05/2026 4:18:56 pm', 1400.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (70, 31, 26, 'Transfer Sent', 100.00, 'Money transferred', '05/05/2026 4:22:22 pm', 1300.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (71, 26, NULL, 'Deposit', 2000.00, 'Cash Deposit', '05/05/2026 4:27:53 pm', 2500.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (72, 26, NULL, 'Withdraw', 2000.00, 'Cash Withdrawal', '05/05/2026 4:27:58 pm', 500.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (73, 26, 31, 'Transfer Sent', 100.00, 'Money transferred', '05/05/2026 4:28:17 pm', 400.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (74, 26, 31, 'Transfer Sent', 100.00, 'Money transferred', '05/05/2026 4:30:52 pm', 300.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (75, 31, 26, 'Transfer Sent', 100.00, 'Money transferred', '05/05/2026 4:41:56 pm', 1400.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (76, 31, NULL, 'Deposit', 100.00, 'Cash Deposit', '05/05/2026 4:42:08 pm', 1500.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (77, 31, NULL, 'Withdraw', 100.00, 'Cash Withdrawal', '05/05/2026 4:42:16 pm', 1400.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (78, 31, 26, 'Transfer Sent', 100.00, 'Money transferred', '05/05/2026 6:04:32 pm', 1300.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (79, 33, NULL, 'Deposit', 1000.00, 'Cash Deposit', '05/05/2026 8:04:39 pm', 1000.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (80, 33, NULL, 'Withdraw', 100.00, 'Cash Withdrawal', '05/05/2026 8:14:25 pm', 900.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (81, 33, 31, 'Transfer Sent', 100.00, 'Money transferred', '05/05/2026 8:22:45 pm', 800.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (82, 31, 32, 'Transfer Sent', 500.00, 'Money transferred', '05/05/2026 9:02:33 pm', 900.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (83, 31, 33, 'Transfer Sent', 500.00, 'Money transferred', '05/05/2026 9:06:10 pm', 400.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (84, 33, NULL, 'Deposit', 2000.00, 'Cash Deposit', '09/05/2026 11:16:33 pm', 3300.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (85, 33, NULL, 'Deposit', 2000.00, 'Cash Deposit', '09/05/2026 11:16:37 pm', 5300.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (86, 33, NULL, 'Deposit', 2000.00, 'Cash Deposit', '09/05/2026 11:16:41 pm', 7300.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (87, 33, NULL, 'Deposit', 2000.00, 'Cash Deposit', '09/05/2026 11:16:44 pm', 9300.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (88, 33, 31, 'Transfer Sent', 2000.00, 'Money transferred', '09/05/2026 11:18:32 pm', 7300.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (89, 26, NULL, 'Deposit', 100.00, 'Cash Deposit', '13/05/2026 4:23:41 pm', 600.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (90, 26, NULL, 'Deposit', 500.00, 'Cash Deposit', '14/05/2026 6:56:07 pm', 1100.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (91, 26, NULL, 'Withdraw', 100.00, 'Cash Withdrawal', '14/05/2026 6:57:22 pm', 1000.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (92, 26, 31, 'Transfer Sent', 300.00, 'Money transferred', '14/05/2026 6:58:03 pm', 700.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (93, 34, NULL, 'Deposit', 2000.00, 'Cash Deposit', '19/07/2026 9:03:46 pm', 2000.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (94, 34, NULL, 'Withdraw', 100.00, 'Cash Withdrawal', '19/07/2026 9:04:31 pm', 1900.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (95, 34, 31, 'Transfer Sent', 100.00, 'Money transferred', '19/07/2026 9:04:58 pm', 1800.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (96, 34, 31, 'Transfer Sent', 100.00, 'Money transferred', '19/07/2026 9:14:22 pm', 1700.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (97, 34, 26, 'Transfer Sent', 100.00, 'Money transferred', '19/07/2026 9:16:09 pm', 1600.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (98, 34, 26, 'Transfer Sent', 100.00, 'Money transferred', '19/07/2026 9:16:52 pm', 1500.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (99, 34, 33, 'Transfer Sent', 100.00, 'Money transferred', '19/07/2026 9:19:00 pm', 1400.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (100, 34, 31, 'Transfer Sent', 100.00, 'Money transferred', '19/07/2026 9:22:28 pm', 1300.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (101, 34, 32, 'Transfer Sent', 100.00, 'Money transferred', '19/07/2026 9:23:00 pm', 1200.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (102, 34, 26, 'Transfer Sent', 100.00, 'Money transferred', '19/07/2026 9:25:37 pm', 1100.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (103, 34, 33, 'Transfer Sent', 100.00, 'Money transferred', '19/07/2026 9:26:11 pm', 1000.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (104, 34, 26, 'Transfer Sent', 100.00, 'Money transferred', '19/07/2026 9:28:43 pm', 900.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (105, 34, NULL, 'Deposit', 2000.00, 'Cash Deposit', '19/07/2026 9:28:52 pm', 2900.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (106, 34, NULL, 'Deposit', 2000.00, 'Cash Deposit', '19/07/2026 9:29:41 pm', 4900.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (107, 34, NULL, 'Withdraw', 100.00, 'Cash Withdrawal', '19/07/2026 9:29:48 pm', 4800.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (108, 34, 31, 'Transfer Sent', 100.00, 'Money transferred', '19/07/2026 9:30:16 pm', 4700.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (109, 34, 31, 'Transfer Sent', 100.00, 'Money transferred', '19/07/2026 9:30:29 pm', 4600.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (110, 32, 33, 'Transfer Sent', 100.00, 'Money transferred', '19/07/2026 9:42:13 pm', 1300.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (111, 32, 26, 'Transfer Sent', 100.00, 'Money transferred', '19/07/2026 9:42:24 pm', 1200.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (112, 32, NULL, 'Deposit', 1000.00, 'Cash Deposit', '19/07/2026 9:42:30 pm', 2200.00);
INSERT INTO [TRANSACTIONS] ([TransactionID], [UserID], [RecipientUserID], [TransactionType], [Amount], [Description], [DateCreated], [BalanceAfterTransaction]) VALUES (113, 32, NULL, 'Deposit', 500.00, 'Cash Deposit', '19/07/2026 9:42:40 pm', 2700.00);

GO

-- Table: NOTIFICATIONS
CREATE TABLE [NOTIFICATIONS] (
    [NotificationID] int NOT NULL ,
    [UserID] int NOT NULL ,
    [Message] nvarchar(255) NOT NULL ,
    [IsRead] bit NOT NULL DEFAULT ((0)),
    [DateCreated] datetime NOT NULL DEFAULT (getdate()),
    CONSTRAINT [PK_NOTIFICATIONS] PRIMARY KEY ([NotificationID])
);

GO

INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (43, 31, 'Deposit successful: ?1,000.00 added.', 0, '04/05/2026 8:16:04 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (44, 31, 'Withdrawal successful: ?100.00 deducted.', 0, '04/05/2026 8:16:09 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (45, 26, 'You received ?100.00 from Bruno Mars', 0, '04/05/2026 8:25:47 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (46, 26, 'Deposit successful: ?500.00 added.', 0, '04/05/2026 9:01:17 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (47, 26, 'Withdrawal successful: ?100.00 deducted.', 0, '04/05/2026 9:01:24 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (48, 31, 'You received ?100.00 from Yen Destriza', 0, '04/05/2026 9:01:43 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (49, 32, 'Deposit successful: ?2,000.00 added.', 0, '05/05/2026 3:03:18 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (50, 32, 'Withdrawal successful: ?500.00 deducted.', 0, '05/05/2026 3:03:24 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (51, 31, 'You received ?500.00 from Arien Destriza', 0, '05/05/2026 3:03:41 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (52, 26, 'You received ?100.00 from Arien Destriza', 0, '05/05/2026 3:20:23 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (63, 32, 'Deposit successful: ?100.00 added.', 0, '05/05/2026 3:41:58 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (64, 32, 'Withdrawal successful: ?200.00 deducted.', 0, '05/05/2026 3:42:04 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (71, 31, 'You received ?100.00 from Yen Destriza', 0, '05/05/2026 4:03:24 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (72, 31, 'You received ?100.00 from Yen Destriza', 0, '05/05/2026 4:08:22 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (73, 26, 'You received ?100.00 from Bruno Mars', 0, '05/05/2026 4:09:05 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (74, 26, 'You received ?100.00 from Bruno Mars', 0, '05/05/2026 4:12:33 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (75, 31, 'You received ?100.00 from Yen Destriza', 0, '05/05/2026 4:14:35 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (76, 31, 'You received ?100.00 from Yen Destriza', 0, '05/05/2026 4:14:36 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (77, 26, 'You sent ?100.00 to Bruno Mars', 0, '05/05/2026 4:14:36 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (78, 31, 'Deposit successful: ?100.00 added.', 0, '05/05/2026 4:18:48 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (79, 31, 'Withdrawal successful: ?200.00 deducted.', 0, '05/05/2026 4:18:56 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (80, 26, 'You received ?100.00 from Bruno Mars', 0, '05/05/2026 4:22:22 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (81, 26, 'You received ?100.00 from Bruno Mars', 0, '05/05/2026 4:22:22 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (82, 31, 'You sent ?100.00 to Yen Destriza', 0, '05/05/2026 4:22:22 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (83, 26, 'Deposit successful: ?2,000.00 added.', 0, '05/05/2026 4:27:53 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (84, 26, 'Withdrawal successful: ?2,000.00 deducted.', 0, '05/05/2026 4:27:58 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (85, 31, 'You received ?100.00 from Yen Destriza', 0, '05/05/2026 4:28:17 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (86, 31, 'You received ?100.00 from Yen Destriza', 0, '05/05/2026 4:28:17 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (87, 26, 'You sent ?100.00 to Bruno Mars', 0, '05/05/2026 4:28:17 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (88, 31, 'You received ?100.00 from Yen Destriza', 0, '05/05/2026 4:30:52 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (89, 31, 'You received ?100.00 from Yen Destriza', 0, '05/05/2026 4:30:52 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (90, 26, 'You sent ?100.00 to Bruno Mars', 0, '05/05/2026 4:30:52 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (91, 26, 'You received ?100.00 from Bruno Mars', 0, '05/05/2026 4:41:56 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (92, 26, 'You received ?100.00 from Bruno Mars', 0, '05/05/2026 4:41:56 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (93, 31, 'You sent ?100.00 to Yen Destriza', 0, '05/05/2026 4:41:56 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (94, 31, 'Deposit successful: ?100.00 added.', 0, '05/05/2026 4:42:08 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (95, 31, 'Withdrawal successful: ?100.00 deducted.', 0, '05/05/2026 4:42:16 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (96, 26, 'You received ?100.00 from Bruno Mars', 0, '05/05/2026 6:04:32 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (97, 31, 'You sent ?100.00 to Yen Destriza', 0, '05/05/2026 6:04:32 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (98, 33, 'Deposit successful: ?1,000.00 added.', 0, '05/05/2026 8:04:39 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (99, 33, 'Withdrawal successful: ?100.00 deducted.', 0, '05/05/2026 8:14:25 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (100, 31, 'You received ?100.00 from Yin Destriza', 0, '05/05/2026 8:22:45 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (101, 33, 'You sent ?100.00 to Bruno Mars', 0, '05/05/2026 8:22:45 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (102, 32, 'You received ?500.00 from Bruno Mars', 0, '05/05/2026 9:02:33 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (103, 31, 'You sent ?500.00 to Arien Destriza', 0, '05/05/2026 9:02:33 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (104, 33, 'You received ?500.00 from Bruno Mars', 0, '05/05/2026 9:06:10 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (105, 31, 'You sent ?500.00 to Yin Destriza', 0, '05/05/2026 9:06:10 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (106, 33, 'Deposit successful: ?2,000.00 added.', 0, '09/05/2026 11:16:33 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (107, 33, 'Deposit successful: ?2,000.00 added.', 0, '09/05/2026 11:16:37 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (108, 33, 'Deposit successful: ?2,000.00 added.', 0, '09/05/2026 11:16:41 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (109, 33, 'Deposit successful: ?2,000.00 added.', 0, '09/05/2026 11:16:44 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (110, 31, 'You received ?2,000.00 from Yin Destriza', 0, '09/05/2026 11:18:32 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (111, 33, 'You sent ?2,000.00 to Bruno Mars', 0, '09/05/2026 11:18:32 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (112, 26, 'Deposit successful: ?100.00 added.', 0, '13/05/2026 4:23:41 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (113, 26, 'Deposit successful: ?500.00 added.', 0, '14/05/2026 6:56:07 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (114, 26, 'Withdrawal successful: ?100.00 deducted.', 0, '14/05/2026 6:57:22 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (115, 31, 'You received ?300.00 from Yen Destriza', 0, '14/05/2026 6:58:03 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (116, 26, 'You sent ?300.00 to Bruno Mars', 0, '14/05/2026 6:58:03 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (117, 34, 'Deposit successful: ?2,000.00 added.', 0, '19/07/2026 9:03:46 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (118, 34, 'Withdrawal successful: ?100.00 deducted.', 0, '19/07/2026 9:04:31 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (119, 31, 'You received ?100.00 from Arien Destriza', 0, '19/07/2026 9:04:58 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (120, 34, 'You sent ?100.00 to Bruno Mars', 0, '19/07/2026 9:04:58 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (121, 31, 'You received ?100.00 from Arien Destriza', 0, '19/07/2026 9:14:22 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (122, 34, 'You sent ?100.00 to Bruno Mars', 0, '19/07/2026 9:14:22 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (123, 26, 'You received ?100.00 from Arien Destriza', 0, '19/07/2026 9:16:09 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (124, 34, 'You sent ?100.00 to Yen Destriza', 0, '19/07/2026 9:16:09 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (125, 26, 'You received ?100.00 from Arien Destriza', 0, '19/07/2026 9:16:52 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (126, 34, 'You sent ?100.00 to Yen Destriza', 0, '19/07/2026 9:16:52 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (127, 33, 'You received ?100.00 from Arien Destriza', 0, '19/07/2026 9:19:00 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (128, 34, 'You sent ?100.00 to Yin Destriza', 0, '19/07/2026 9:19:00 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (129, 31, 'You received ?100.00 from Arien Destriza', 0, '19/07/2026 9:22:28 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (130, 34, 'You sent ?100.00 to Bruno Mars', 0, '19/07/2026 9:22:28 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (131, 32, 'You received ?100.00 from Arien Destriza', 0, '19/07/2026 9:23:00 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (132, 34, 'You sent ?100.00 to Arien Destriza', 0, '19/07/2026 9:23:00 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (133, 26, 'You received ?100.00 from Arien Destriza', 0, '19/07/2026 9:25:37 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (134, 34, 'You sent ?100.00 to Yen Destriza', 0, '19/07/2026 9:25:37 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (135, 33, 'You received ?100.00 from Arien Destriza', 0, '19/07/2026 9:26:11 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (136, 34, 'You sent ?100.00 to Yin Destriza', 0, '19/07/2026 9:26:11 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (137, 26, 'You received ?100.00 from Arien Destriza', 0, '19/07/2026 9:28:43 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (138, 34, 'You sent ?100.00 to Yen Destriza', 0, '19/07/2026 9:28:43 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (139, 34, 'Deposit successful: ?2,000.00 added.', 0, '19/07/2026 9:28:52 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (140, 34, 'Deposit successful: ?2,000.00 added.', 0, '19/07/2026 9:29:41 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (141, 34, 'Withdrawal successful: ?100.00 deducted.', 0, '19/07/2026 9:29:48 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (142, 31, 'You received ?100.00 from Arien Destriza', 0, '19/07/2026 9:30:16 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (143, 34, 'You sent ?100.00 to Bruno Mars', 0, '19/07/2026 9:30:16 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (144, 31, 'You received ?100.00 from Arien Destriza', 0, '19/07/2026 9:30:29 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (145, 34, 'You sent ?100.00 to Bruno Mars', 0, '19/07/2026 9:30:29 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (146, 33, 'You received ?100.00 from Arien Destriza', 0, '19/07/2026 9:42:13 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (147, 32, 'You sent ?100.00 to Yin Destriza', 0, '19/07/2026 9:42:13 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (148, 26, 'You received ?100.00 from Arien Destriza', 0, '19/07/2026 9:42:24 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (149, 32, 'You sent ?100.00 to Yen Destriza', 0, '19/07/2026 9:42:24 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (150, 32, 'Deposit successful: ?1,000.00 added.', 0, '19/07/2026 9:42:30 pm');
INSERT INTO [NOTIFICATIONS] ([NotificationID], [UserID], [Message], [IsRead], [DateCreated]) VALUES (151, 32, 'Deposit successful: ?500.00 added.', 0, '19/07/2026 9:42:40 pm');

GO

-- Table: USERS
CREATE TABLE [USERS] (
    [UserID] int NOT NULL ,
    [FirstName] nvarchar(50) NOT NULL ,
    [LastName] nvarchar(50) NOT NULL ,
    [Username] nvarchar(50) NOT NULL ,
    [Password] nvarchar(100) NOT NULL ,
    [DateRegistered] datetime NOT NULL ,
    CONSTRAINT [PK_USERS] PRIMARY KEY ([UserID])
);

GO

INSERT INTO [USERS] ([UserID], [FirstName], [LastName], [Username], [Password], [DateRegistered]) VALUES (26, 'Yen', 'Destriza', 'yen12345', 'yen12345', '04/05/2026 7:41:49 pm');
INSERT INTO [USERS] ([UserID], [FirstName], [LastName], [Username], [Password], [DateRegistered]) VALUES (31, 'Bruno', 'Mars', 'bruno12345', 'bruno12345', '04/05/2026 8:14:45 pm');
INSERT INTO [USERS] ([UserID], [FirstName], [LastName], [Username], [Password], [DateRegistered]) VALUES (32, 'Arien', 'Destriza', 'arien12345', 'arien12345', '05/05/2026 3:02:55 pm');
INSERT INTO [USERS] ([UserID], [FirstName], [LastName], [Username], [Password], [DateRegistered]) VALUES (33, 'Yin', 'Destriza', 'yin12345', 'yin12345', '05/05/2026 7:19:35 pm');
INSERT INTO [USERS] ([UserID], [FirstName], [LastName], [Username], [Password], [DateRegistered]) VALUES (34, 'Arien', 'Destriza', 'yenyan123', 'yenyan123', '19/07/2026 9:03:15 pm');

GO

-- Table: ACCOUNTS
CREATE TABLE [ACCOUNTS] (
    [AccountID] int NOT NULL ,
    [UserID] int NOT NULL ,
    [AccountNo] nvarchar(20) NOT NULL ,
    [CurrentBalance] decimal NOT NULL ,
    [TotalSentAmount] decimal NOT NULL ,
    CONSTRAINT [PK_ACCOUNTS] PRIMARY KEY ([AccountID])
);

GO

INSERT INTO [ACCOUNTS] ([AccountID], [UserID], [AccountNo], [CurrentBalance], [TotalSentAmount]) VALUES (17, 26, 'AB242122792856', 1200.00, 900.00);
INSERT INTO [ACCOUNTS] ([AccountID], [UserID], [AccountNo], [CurrentBalance], [TotalSentAmount]) VALUES (18, 31, 'AB429465909832', 3200.00, 1600.00);
INSERT INTO [ACCOUNTS] ([AccountID], [UserID], [AccountNo], [CurrentBalance], [TotalSentAmount]) VALUES (19, 32, 'AB140729987650', 2700.00, 800.00);
INSERT INTO [ACCOUNTS] ([AccountID], [UserID], [AccountNo], [CurrentBalance], [TotalSentAmount]) VALUES (20, 33, 'AB362376439594', 7600.00, 2100.00);
INSERT INTO [ACCOUNTS] ([AccountID], [UserID], [AccountNo], [CurrentBalance], [TotalSentAmount]) VALUES (21, 34, 'AB151283794302', 4600.00, 1200.00);

GO

