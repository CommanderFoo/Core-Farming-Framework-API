import { readFile } from "fs/promises";
import { existsSync, writeFileSync, readdirSync, unlinkSync } from "fs";
import glob from "glob";
import Headers from "./headers.mjs";

class API_Gen {

	static async get_file(file){
		let contents = "";
		let read = readFile(file, "utf8").then(code => {
			
			contents = code;

		});

		await read;

		return contents;
	}

	static get_method_table_header(){
		return [
			"## Functions\n",
			"| Class Function Name | Return Type | Description | Tags |",
			"| ------------------- | ----------- | ----------- | ---- |\n"

		].join("\n");
	}

	static get_event_table_header(){
		return [
			"## Events\n",
			"| Event Name | Return Type | Description | Tags |",
			"| ---------- | ----------- | ----------- | ---- |\n"

		].join("\n");
	}

	static get_info(index, lines){
		let comment = [];
		let params = [];
		let returns = [];

		let current_index = index - 1;
		let current_line = lines[current_index];

		while(current_index > 0 && current_line && current_line.length > 3 && current_line.match(/^---/)){
			if(current_line.match(/^---@return/)){
				returns = returns.concat(current_line.replace(/^---@return\s?/i, "").replace("\r", "").split("|"));
			} else if(current_line.match(/^---@param/i)){
				let type = "";

				if(current_line.match("table<")){
					type = "table<" + current_line.split("table<")[1].split(">")[0] + ">";
				} else if(current_line.match("func<")){
					type = "func<" + current_line.split("func<")[1].split(">")[0] + ">";
				} else {
					type = current_line.replace(/^---@param\s?/i, "").replace("\r", "").split(" ")[1];
				}

				params.push({
					
					name: current_line.replace(/^---@param\s?/i, "").replace("\r", "").split(" ")[0],
					type: type.replace("<", "&lt;").replace(">", "&gt;"),
					param_index: index

				});
			} else if(current_line.match(/^---[^@]/) && !current_line.match("---comment")){
				comment.push(current_line.replace(/^---\s?/i, "").replace("\r", "") + " ");
			}

			current_index -= 1;
			current_line = lines[current_index];
		}

		return {

			comment: comment.reverse(),
			params: params.reverse(),
			returns

		};
	}

	static get_methods(contents){
		let lines = contents.split("\n");
		let methods = []

		lines.forEach((line, index) => {
		
			let matches = line.match(/function API\.(\w+)/i)
				
			if(matches){
				let info = {

					name: matches[1],
					... this.get_info(index, lines)

				};

				methods.push(info);
			}

		});

		return methods;
	}

	static get_markdown_header(key, mapped_key){
		let header = Headers[key] || "";

		if(mapped_key && Headers[mapped_key]){
			header = Headers[mapped_key] || "";
		}

		header = header.replace(/\t/g, "    ");

		return "---\nid: " + key.toLowerCase() + "\nname: " + key + "\ntitle: " + key + "\n---\n\n# " + key + "\n" + header + "\n";
	}

	static get_events(content, key){
		if(!content || content.length == 0){
			return [];
		}

		key = (key)? key.toUpperCase() + " " : "";

		let events = []
		let events_part = content.split(key + "EVENTS")[1];

		if(!events_part){
			events_part = content.split("EVENTS")[1];
		}
	
		if(events_part && events_part.length > 0){
			let lines = events_part.split("\n");
			
			lines.forEach((line, index) => {
				if(line.match(/\s+API.+?\.Events/)){
					let ret_match = lines[index + 2].match(/function\((.+?)\)/);
					let ret = (ret_match && ret_match.length > 1)? ret_match[1] : "";
					let ret_str = "";
					let parts = (ret || "").split(",");
					let invalid = (ret_match && ret_match.length > 1)? false : true;

					for(let p = 0; p < parts.length; p ++){
						let part = parts[p].replace(/\s+/g, "");

						if(part == "player"){
							part = "Player";
						}

						ret_str += part;

						if(p < (parts.length - 1)){
							ret_str += ", ";
						}
					}

					if(!invalid){
						events.push({

							event: line.match(/Events\.(\w+)/)[1],
							ret: ret_str.replace("<", "&lt;").replace(">", "&gt;"),
							tag: lines[index + 2].match(/ - (Server|Client|Server \/ Client)/)[1],
							desc: lines[index + 4].split("- ")[1]

						});
					}
				}
			});
		}

		events.sort((a, b) => {

			return (a.event > b.event)? 1 : -1;

		});

		return events;
	}

	static get_event_output(events){
		let output = this.get_event_table_header();

		events.forEach((entry, index) => {
			output += "| `" + entry.event + "` ";
			output += "| Event&lt;" + entry.ret + "&gt; ";
			output += "| " + entry.desc.replace(/[\r\n]+$/, "") + " ";

			if(entry.tag && entry.tag.length){
				if(entry.tag.length > 6){
					output += "| None |";
				} else {
					output += "| " + entry.tag + " |";
				}
			} else {
				output += "| None |";
			}

			output += "\n";
		});

		return output + "\n";
	}

	static get_method_output(methods){
		let output = this.get_method_table_header();

		methods.forEach((entry, index) => {
			let params = "";

			//console.log(entry.params)
			//if(entry.name == "AddToInventory"){
				entry.params.forEach((param, param_index) => {
					params += param.type + ", ";
				});
			//}

			// entry.params.forEach((param, param_index) => {
				
			// 	if(param.type && param.type.length){
			// 		if(param.type.match("<")){
			// 			params += param.type.replace(/^.+?</, "<").split(">")[0] + ">, ";
			// 		} else if(param.type.match("|")){
			// 			//console.log(entry.name, param.type)
			// 			params += param.type.replace(/^.+? (\w)/, "$1")[1].split("|").join(", ");
			// 		} else {
			// 			params += param.type.split(" ")[0];
			// 		}
			// 	}

			// 	params = params.replace(/, $/, "");
			// });

			params = params.replace(/, ?$/, "");
			output += "| `" + entry.name + "(" + params + ")` ";
		
			if(entry.returns && entry.returns.length > 0){
				output += "| ";

				entry.returns.forEach((value, i) => {
					if(value != "nil"){
						if(value.match(/\[\]$/)){
							output += "`Array&lt;" + value.split("[")[0] + "&gt;`";
						} else {
							output += "`" + value + "`";
						}

						if(i < (entry.returns.length - 1)){
							output += ", ";
						}
					}

				});

				output += " ";
			} else {
				output += "| `None` ";
			}

			if(entry.comment && entry.comment.length > 0){
				output += "| ";

				entry.comment.forEach((com, i) => {

					output += com;

				});
			} else {
				output += "| None ";
			}

			output += "| None |\n";

		});

		return output;
	}

	static cleanup(){
		this.namespaces = "";

		let files = readdirSync("./Output/");

		files.forEach(file => {
			unlinkSync("./Output/" + file);
		});
	}

	static build_index(){
		let output = `
---
id: farming-framework-api
name: Farming Framework API
title: Farming Framework API
hide:
    - toc
---

<style>

.md-nav--primary .md-nav__link[for=__toc] ~ .md-nav {

    display: none;

}

</style>

# Farming Framework API

## Overview

The Farming Framework brings the power of the Producers, Buffs, and Areas to make it possible to build experiences with crops, crafting, and shops, as well as personal areas for players that can be upgraded, decorated, and expanded. It takes advantage of the Data Tables feature and even includes a system to migrate misspelled or redundant storage to a new id without losing player data!

## Namespaces

|   |   |   |   |
|:-:|:-:|:-:|:-:|
`;

		let lines = this.namespaces.split("\n")
		
		lines.forEach((namespace, index) => {
			if(namespace.length > 1){
				if(index > 1 && index % 4 == 0){
					output += "|\n";
				}

				let ns = namespace.split("- ")[1].split(":")[0];
				
				output += "| [" + ns + "](../farming-framework-api/" + ns.toLowerCase() + ".md) ";
			}
		});

		writeFileSync("./Output/index.md", output + "|\n", { flag: "w+" });
	}

	static async build(cwd){
		this.cleanup();

		let skip_files = ["Class", "Attribute", "AttributeSheet", "BitString", "Counter", "ModifyDrops", "ReactiveComponent"];
		let readme_map = {

			"Buffs": { readme: "Producers _ Buffs", events: "BUFF" },
			"Placeables": { readme: "Producers _ Buffs", events: "PLACEABLE" },
			"ProducerBases": { readme: "Producers _ Buffs", events: "PRODUCER" },

		};

		cwd += ((cwd.match(/\/$/))? "" : "/") + "data/scripts/";

		let files = glob.sync("API*.lua", { cwd });

		for(let i = 0; i < files.length; i ++){
			if(!skip_files.includes(files[i].replace("API", "").split(".")[0])){
				await API_Gen.build_doc(cwd, files[i], readme_map);
			}
		}

	//	await API_Gen.build_doc(cwd, "APIInventory.lua", readme_map)

		writeFileSync("./namespace_list.txt", this.namespaces, { flag: "w+" });
		this.build_index()
	}

	static get_examples(content){
		let examples = [];
		let end_parts = content.split("--#SampleEnd")

		for(let e = 0; e < end_parts.length; e ++){
			let sample = end_parts[e].split("--[[#SampleStart")[1];
			let methods = [];
			let events = [];
			let see_also = [];
			let desc = [];
			let example_code = [];

			if(sample){
				([... sample.matchAll(/method: ([\.\w]+)/g)]).forEach(entry => methods.push(entry[0].split(":")[1].trim()));
				([... sample.matchAll(/event: ([\.\w]+)/g)]).forEach(entry => events.push(entry[0].split(":")[1].trim()));

				let see_also_parts = sample.split("#see-also");

				if(see_also_parts.length == 2){
					let parts = see_also_parts[1].split("#description")[0].split("\n");

					if(parts.length){
						parts.forEach(part => {
							if(part.length > 3){
								see_also.push(part.replace(/[\t\r\n]/g, "").trim());
							}
						})
					}
				}

				let desc_str = sample.split("#description")[1].split("]]")[0].trim();
				let desc_parts = desc_str.split("\n");
				
				desc_parts.forEach(line => {
					desc.push(line.replace(/\t/g, "").replace(/(\n|\r){1}/, ""));
				})
				
				desc = desc.join("\n")

				let code_str = sample.split("]]")[1].trim();
				let code_parts = code_str.split("\n");

				code_parts.forEach(line => {
					example_code.push(line.replace("\t", ""))
				})
				
				example_code = example_code.join("\n").replace(/\t/g, "    ");
				examples.push({

					events,
					methods,
					see_also,
					desc,
					example_code

				})				
			}
		}

		return examples;
	}

	static get_example_output(examples){
		let content = "";

		if(examples.length > 0){
			content = "\n## Examples\n";
		}

		examples.forEach(example => {
			content += "\nExample using:\n\n";
			
			example.methods.forEach(method => {
				content += "### `" + method + "`\n\n";
			})

			example.events.forEach(event => {
				content += "### `" + event + "`\n\n";
			})

			content += example.desc + "\n\n";
			content += "```lua\n" + example.example_code + "\n```";

			if(example.see_also.length){
				content += "\n\nSee Also: ";

				example.see_also.forEach((see, see_index) => {
					content += see;

					if(see_index < (example.see_also - 1)){
						content += " |";
					}
				});
			}
		});

		return content + "\n";
	}

	static async build_doc(path, file, readme_map){
		let contents = "";
		let readme_contents = "";
		let key = file.replace("API", "").split(".")[0];
		let examples_content = "";
		let readable_key = key.replace(/([A-Z])/g, match => ` ${match}`).replace(/^./, match => match.toUpperCase()).trim();
		let readme_item = readme_map[key] || {};
		
		if(key == "UILibrary"){
			readable_key = "UI Library";
		}

		if(file && file.length > 0){
			contents = await this.get_file(path + file);
		}

		if(existsSync(path + key + " README.lua")){
			readme_contents = await this.get_file(path + key + " README.lua");
		} else if(existsSync(path + readme_item.readme + " README.lua")){
			readme_contents = await this.get_file(path + readme_item.readme + " README.lua");
		}

		if(existsSync(path + key + "_Examples.lua")){
			examples_content = await this.get_file(path + key.replace(/\s+/g, "") + "_Examples.lua");
		}

		let events = this.get_events(readme_contents, (readme_item.events)? readme_item.events : key);
		let methods = this.get_methods(contents);
		let examples = this.get_examples(examples_content)
	
		methods.sort((a, b) => {

			return (a.name > b.name)? 1 : -1;

		});
		
		let output = this.get_markdown_header(readable_key, readme_item.readme || null);
		
		if(events.length > 0){
			output += this.get_event_output(events);
		}

		if(methods.length > 0){
			output += this.get_method_output(methods);
		}

		if(examples.length > 0){
			output += this.get_example_output(examples);
		}

		if(output.length > 0){
			this.namespaces += "- " + key + ": farming-framework-api/" + key.toLowerCase() + ".md\n";
		}

		writeFileSync("./Output/" + key.toLowerCase() + ".md", output, { flag: "w+" });
	}

}

export default API_Gen