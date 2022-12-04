const pg = require("knex")({
  client: "pg",
  connection: process.env.PG_CONNECTION_STRING,
  searchPath: ["knex", "public"],
});

const knex = require("knex")({
  client: "postgres",
  connection: async () => {
    const { token, tokenExpiration } = await someCallToGetTheToken();

    return {
      host: "127.0.0.1",
      port: 5432,
      user: "postgres",
      password: "zoitib23Gverde",
      database: "new_agreement",
      expirationChecker: () => {
        return tokenExpiration <= Date.now();
      },
    };
  },
});
