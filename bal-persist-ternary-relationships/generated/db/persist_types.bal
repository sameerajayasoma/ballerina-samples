// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

public type Project record {|
    readonly string id;
    string name;

|};

public type ProjectOptionalized record {|
    string id?;
    string name?;
|};

public type ProjectWithRelations record {|
    *ProjectOptionalized;
    AssignmentOptionalized[] assignment?;
|};

public type ProjectTargetType typedesc<ProjectWithRelations>;

public type ProjectInsert Project;

public type ProjectUpdate record {|
    string name?;
|};

public type Developer record {|
    readonly string id;
    string name;

|};

public type DeveloperOptionalized record {|
    string id?;
    string name?;
|};

public type DeveloperWithRelations record {|
    *DeveloperOptionalized;
    AssignmentOptionalized[] assignment?;
|};

public type DeveloperTargetType typedesc<DeveloperWithRelations>;

public type DeveloperInsert Developer;

public type DeveloperUpdate record {|
    string name?;
|};

public type Role record {|
    readonly string id;
    string name;

|};

public type RoleOptionalized record {|
    string id?;
    string name?;
|};

public type RoleWithRelations record {|
    *RoleOptionalized;
    AssignmentOptionalized[] assignment?;
|};

public type RoleTargetType typedesc<RoleWithRelations>;

public type RoleInsert Role;

public type RoleUpdate record {|
    string name?;
|};

public type Assignment record {|
    readonly string id;
    string projectId;
    string developerId;
    string roleId;
|};

public type AssignmentOptionalized record {|
    string id?;
    string projectId?;
    string developerId?;
    string roleId?;
|};

public type AssignmentWithRelations record {|
    *AssignmentOptionalized;
    ProjectOptionalized project?;
    DeveloperOptionalized developer?;
    RoleOptionalized role?;
|};

public type AssignmentTargetType typedesc<AssignmentWithRelations>;

public type AssignmentInsert Assignment;

public type AssignmentUpdate record {|
    string projectId?;
    string developerId?;
    string roleId?;
|};

