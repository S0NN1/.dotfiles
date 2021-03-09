import os
import json
import sys


dotfiles_folder = os.path.dirname(os.path.dirname(os.path.realpath(__file__)))
# Json with gitconfig
gitconfig_json = "/gitconfig.json"
# Json with private aliases
aliases_json = "/aliases.json"
# Json with private functions
functions_json = "/functions.json"
# gitconfig file relative path
gitconfig_file = "/.gitconfig"
# Aliases file relative path
aliases_file = "/zsh/partials/aliases.zsh"
# Functions file relative path
functions_file = "/zsh/partials/functions.zsh"
# Prefixes
gitconfig_prefix = "--DOT_GITCONFIG_"
alias_prefix = "--DOT_ALIAS_"
function_prefix = "--DOT_FUNCTION_"

choice_map = {"1": "gitconfig", "2": "aliases", "3": "functions"}
# Associate files with types
file_map = {
    "gitconfig": ".gitconfig",
    "aliases": "aliases.zsh",
    "functions": "functions.zsh",
}
# Associate prefixes with files
prefix_map = {
    "gitconfig": gitconfig_prefix,
    "aliases": alias_prefix,
    "functions": function_prefix,
}
# test
def main():
    if len(sys.argv) > 1:
        if sys.argv[1] == "-e":
            expose_and_replace(gitconfig_file, gitconfig_json, gitconfig_prefix)
            expose_and_replace(aliases_file, aliases_json, alias_prefix)
            expose_and_replace(functions_file, functions_json, function_prefix)
        elif sys.argv[1] == "-h":
            hide_and_replace(gitconfig_file, gitconfig_json, gitconfig_prefix)
            hide_and_replace(aliases_file, aliases_json, alias_prefix)
            hide_and_replace(functions_file, functions_json, function_prefix)
        elif sys.argv[1] == "-a":
            add_field()
    else:
        print(
            "No arguments found please use -e or -h or -a next time, starting with add function...\n"
        )
        add_field()


def expose_and_replace(filename, json_file, prefix):
    with open(dotfiles_folder + "/json" + json_file, "rt") as json_file:
        with open(dotfiles_folder + filename, "rt") as dot_file:
            dot_data = dot_file.read()
            json_data = json.load(json_file)
            for item in json_data:
                table = item["name"].maketrans(" ", "_")
                dot_data = dot_data.replace(
                    prefix + item["name"].translate(table).upper() + "--",
                    item["content"],
                )
            dot_file.close()
            dot_file = open(dotfiles_folder + filename, "wt")
            dot_file.write(dot_data)
            dot_file.close
        json_file.close()
    return


def hide_and_replace(filename, json_file, prefix):
    with open(dotfiles_folder + "/json" + json_file, "rt") as json_file:
        with open(dotfiles_folder + filename, "rt") as dot_file:
            dot_data = dot_file.read()
            json_data = json.load(json_file)
            for item in json_data:
                table = item["name"].maketrans(" ", "_")
                dot_data = dot_data.replace(
                    item["content"],
                    prefix + item["name"].translate(table).upper() + "--",
                )
            dot_file.close()
            dot_file = open(dotfiles_folder + filename, "wt")
            dot_file.write(dot_data)
            dot_file.close
        json_file.close()
    return


def add_field():
    print(
        "Which field do you want to add?\n1) gitconfig\n2) Alias\n3) Function\nChoose by typing the corrisponding number:"
    )
    answer = input()
    choice = choice_map.get(answer)
    file = "/" + choice + ".json"
    print("Insert name")
    name = input()
    print("Insert content")
    content = input()
    json_file = open(dotfiles_folder + file, "rt")
    json_data = json.load(json_file)
    json_file.close()
    json_data.append({"name": name, "content": content})
    json_file = open(dotfiles_folder + file, "wt")
    json.dump(json_data, json_file)
    json_file.close()
    table = name.maketrans(" ", "_")
    print(
        "Now inserted in "
        + file_map.get(choice)
        + " the following string: "
        + prefix_map.get(choice)
        + name.translate(table).upper()
        + "--"
    )
    pass


if __name__ == "__main__":
    main()
