/**
 * @param { import("knex").Knex } knex
 * @returns { Promise<void> }
 */
exports.seed = function (knex) {
  // Deletes ALL existing entries
  return knex("users")
    .del()
    .then(async function () {
      // Inserts seed entries

      await knex.raw("ALTER SEQUENCE users_id_seq RESTART 3");

      return knex("users").insert([
        { id: 1, name: "Hettie Marshall", email: "lantunde@acbo.va" },
        { id: 2, name: "Hester Owens", email: "zo@girih.lv" },
        { id: 3, name: "Henry Jackson", email: "bekamohi@owo.mt" },
      ]);
    });
};
