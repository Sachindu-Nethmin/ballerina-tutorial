import ballerina/io;
import ballerina/http;

public function main() returns error?{
    string reponame = io:readln("Enter name of repository: ");
    http:Client GitHub =check new("https://api.github.com");
    string searchQuery = string `/search/repositories?q=${reponame}`;
    json search = check GitHub->get(searchQuery);
    io:print(`There is ${search.total_count} repositories name with ${reponame}`);
}
