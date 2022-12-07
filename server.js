const express = require("express");
const bodyParser = require("body-parser");

const current_build = "development";

const knexConfig = require("./db/knexfile");
//initialize knex
const knex = require("./node_modules8/knex/types")(knexConfig[current_build]);

const app = express();
const port = 3000;
app.use(bodyParser.json());

app.post("/user", async (req, res) => {
	const name = req.body.name ? req.body.name : "";
	const email = req.body.email ? req.body.email : "";

	if (!name) {
		return res.json({ success: false, message: "Name is required" });
	}

	await console.log(knex("users").insert({ name, email }).toString());

	return await knex("users")
		.select("id")
		.where({ name: name })
		.then((data) => {
			return res.json(data);
		});
});

app.get("/", (req, res) => {
	console.log("req", req);
	console.log("res", res);
	const name = req.body.name ? req.body.name : "";
	const email = req.body.email ? req.body.email : "";

	if (!name) {
		return res.json({ success: false, message: "Name is required" });
	}

	knex("users")
		.insert({ name, email })
		.then((id) => {
			//get user by id
			knex("users")
				.select({
					id: "id",
					name: "name",
				})
				.where({ id })
				.then((user) => {
					return res.json(user[0]);
				});
		})
		.catch((err) => {
			console.error(err);
			return res.json({
				success: false,
				message: "An error occurred, please try again later.",
			});
		});
});

app.listen(port, () => {
	console.log(`Example app listening at http://localhost:${port}`);
});
