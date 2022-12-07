/**
 * @param { import("../../node_modules8/knex/types").Knex } knex
 * @returns { Promise<void> }
 */
exports.seed = function (knex) {
	// Deletes ALL existing entries
	return knex("users")
		.del()
		.then(async function () {
			// Inserts seed entries

			//await knex.raw("ALTER SEQUENCE users_id_seq RESTART 3");

			return knex("users").insert([
				{ name: "Hettie Marshall", email: "lantunde@acbo.va" },
				{ name: "Hester Owens", email: "zo@girih.lv" },
				{ name: "Henry Jackson", email: "bekamohi@owo.mt" },
			]);
		});
};
