import ballerina/persist as _;

type Project record {|
    readonly string id;
    string name;
	Assignment[] assignment;
|};

type Developer record {|
    readonly string id;
    string name;
	Assignment[] assignment;
|};

type Role record {|
    readonly string id;
    string name;
	Assignment[] assignment;
|};

type Assignment record {|
    readonly string id;
    
    Project project;
    Developer developer;
    Role role;
|};

