// Update with your config settings.

/**
 * @type { Object.<string, import("../node_modules8/knex/types").Knex.Config> }
 */
module.exports = {
	development: {
		client: "postgresql",
		connection: {
			database: "test_new_agreement",
			user: "postgres",
			password: "zoitib23Gverde",
		},
		pool: {
			min: 2,
			max: 10,
		},
		migrations: {
			tableName: "knex_migrations",
		},
	},

	staging: {
		client: "postgresql",
		connection: {
			database: "new_agreement",
			user: "postgres",
			password: "zoitib23Gverde",
		},
		pool: {
			min: 2,
			max: 10,
		},
		migrations: {
			tableName: "knex_migrations",
		},
	},

	production: {
		client: "postgresql",
		connection: {
			database: "new_agreement",
			user: "postgres",
			password: "zoitib23Gverde",
		},
		pool: {
			min: 2,
			max: 10,
		},
		migrations: {
			tableName: "knex_migrations",
		},
	},
};
