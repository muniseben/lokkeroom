CREATE TABLE "users"(
    "id" INTEGER NOT NULL,
    "username" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "users" ADD PRIMARY KEY("id");
CREATE TABLE "lobbies"(
    "id" INTEGER NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "admin_id" BIGINT NOT NULL
);
ALTER TABLE
    "lobbies" ADD PRIMARY KEY("id");
CREATE TABLE "users_per_lobby"(
    "id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    "lobby_id" INTEGER NOT NULL
);
ALTER TABLE
    "users_per_lobby" ADD PRIMARY KEY("id");
CREATE TABLE "messages"(
    "id" INTEGER NOT NULL,
    "content" TEXT NOT NULL,
    "created_at" DATE NOT NULL,
    "user_id" INTEGER NOT NULL,
    "lobby_id" INTEGER NOT NULL
);
ALTER TABLE
    "messages" ADD PRIMARY KEY("id");
ALTER TABLE
    "users_per_lobby" ADD CONSTRAINT "users_per_lobby_lobby_id_foreign" FOREIGN KEY("lobby_id") REFERENCES "lobbies"("id");
ALTER TABLE
    "lobbies" ADD CONSTRAINT "lobbies_admin_id_foreign" FOREIGN KEY("admin_id") REFERENCES "users"("id");
ALTER TABLE
    "users_per_lobby" ADD CONSTRAINT "users_per_lobby_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");
ALTER TABLE
    "messages" ADD CONSTRAINT "messages_user_id_foreign" FOREIGN KEY("user_id") REFERENCES "users"("id");
ALTER TABLE
    "messages" ADD CONSTRAINT "messages_lobby_id_foreign" FOREIGN KEY("lobby_id") REFERENCES "lobbies"("id");