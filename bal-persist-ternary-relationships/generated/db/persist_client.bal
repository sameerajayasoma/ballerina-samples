// AUTO-GENERATED FILE. DO NOT MODIFY.

// This file is an auto-generated file by Ballerina persistence layer for model.
// It should not be modified by hand.

import ballerina/jballerina.java;
import ballerina/persist;
import ballerina/sql;
import ballerinax/mysql;
import ballerinax/mysql.driver as _;
import ballerinax/persist.sql as psql;

const PROJECT = "projects";
const DEVELOPER = "developers";
const ROLE = "roles";
const ASSIGNMENT = "assignments";

public isolated client class Client {
    *persist:AbstractPersistClient;

    private final mysql:Client dbClient;

    private final map<psql:SQLClient> persistClients;

    private final record {|psql:SQLMetadata...;|} & readonly metadata = {
        [PROJECT]: {
            entityName: "Project",
            tableName: "Project",
            fieldMetadata: {
                id: {columnName: "id"},
                name: {columnName: "name"},
                "assignment[].id": {relation: {entityName: "assignment", refField: "id"}},
                "assignment[].projectId": {relation: {entityName: "assignment", refField: "projectId"}},
                "assignment[].developerId": {relation: {entityName: "assignment", refField: "developerId"}},
                "assignment[].roleId": {relation: {entityName: "assignment", refField: "roleId"}}
            },
            keyFields: ["id"],
            joinMetadata: {assignment: {entity: Assignment, fieldName: "assignment", refTable: "Assignment", refColumns: ["projectId"], joinColumns: ["id"], 'type: psql:MANY_TO_ONE}}
        },
        [DEVELOPER]: {
            entityName: "Developer",
            tableName: "Developer",
            fieldMetadata: {
                id: {columnName: "id"},
                name: {columnName: "name"},
                "assignment[].id": {relation: {entityName: "assignment", refField: "id"}},
                "assignment[].projectId": {relation: {entityName: "assignment", refField: "projectId"}},
                "assignment[].developerId": {relation: {entityName: "assignment", refField: "developerId"}},
                "assignment[].roleId": {relation: {entityName: "assignment", refField: "roleId"}}
            },
            keyFields: ["id"],
            joinMetadata: {assignment: {entity: Assignment, fieldName: "assignment", refTable: "Assignment", refColumns: ["developerId"], joinColumns: ["id"], 'type: psql:MANY_TO_ONE}}
        },
        [ROLE]: {
            entityName: "Role",
            tableName: "Role",
            fieldMetadata: {
                id: {columnName: "id"},
                name: {columnName: "name"},
                "assignment[].id": {relation: {entityName: "assignment", refField: "id"}},
                "assignment[].projectId": {relation: {entityName: "assignment", refField: "projectId"}},
                "assignment[].developerId": {relation: {entityName: "assignment", refField: "developerId"}},
                "assignment[].roleId": {relation: {entityName: "assignment", refField: "roleId"}}
            },
            keyFields: ["id"],
            joinMetadata: {assignment: {entity: Assignment, fieldName: "assignment", refTable: "Assignment", refColumns: ["roleId"], joinColumns: ["id"], 'type: psql:MANY_TO_ONE}}
        },
        [ASSIGNMENT]: {
            entityName: "Assignment",
            tableName: "Assignment",
            fieldMetadata: {
                id: {columnName: "id"},
                projectId: {columnName: "projectId"},
                developerId: {columnName: "developerId"},
                roleId: {columnName: "roleId"},
                "project.id": {relation: {entityName: "project", refField: "id"}},
                "project.name": {relation: {entityName: "project", refField: "name"}},
                "developer.id": {relation: {entityName: "developer", refField: "id"}},
                "developer.name": {relation: {entityName: "developer", refField: "name"}},
                "role.id": {relation: {entityName: "role", refField: "id"}},
                "role.name": {relation: {entityName: "role", refField: "name"}}
            },
            keyFields: ["id"],
            joinMetadata: {
                project: {entity: Project, fieldName: "project", refTable: "Project", refColumns: ["id"], joinColumns: ["projectId"], 'type: psql:ONE_TO_MANY},
                developer: {entity: Developer, fieldName: "developer", refTable: "Developer", refColumns: ["id"], joinColumns: ["developerId"], 'type: psql:ONE_TO_MANY},
                role: {entity: Role, fieldName: "role", refTable: "Role", refColumns: ["id"], joinColumns: ["roleId"], 'type: psql:ONE_TO_MANY}
            }
        }
    };

    public isolated function init() returns persist:Error? {
        mysql:Client|error dbClient = new (host = host, user = user, password = password, database = database, port = port, options = connectionOptions);
        if dbClient is error {
            return <persist:Error>error(dbClient.message());
        }
        self.dbClient = dbClient;
        self.persistClients = {
            [PROJECT]: check new (dbClient, self.metadata.get(PROJECT), psql:MYSQL_SPECIFICS),
            [DEVELOPER]: check new (dbClient, self.metadata.get(DEVELOPER), psql:MYSQL_SPECIFICS),
            [ROLE]: check new (dbClient, self.metadata.get(ROLE), psql:MYSQL_SPECIFICS),
            [ASSIGNMENT]: check new (dbClient, self.metadata.get(ASSIGNMENT), psql:MYSQL_SPECIFICS)
        };
    }

    isolated resource function get projects(ProjectTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get projects/[string id](ProjectTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post projects(ProjectInsert[] data) returns string[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(PROJECT);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from ProjectInsert inserted in data
            select inserted.id;
    }

    isolated resource function put projects/[string id](ProjectUpdate value) returns Project|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(PROJECT);
        }
        _ = check sqlClient.runUpdateQuery(id, value);
        return self->/projects/[id].get();
    }

    isolated resource function delete projects/[string id]() returns Project|persist:Error {
        Project result = check self->/projects/[id].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(PROJECT);
        }
        _ = check sqlClient.runDeleteQuery(id);
        return result;
    }

    isolated resource function get developers(DeveloperTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get developers/[string id](DeveloperTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post developers(DeveloperInsert[] data) returns string[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(DEVELOPER);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from DeveloperInsert inserted in data
            select inserted.id;
    }

    isolated resource function put developers/[string id](DeveloperUpdate value) returns Developer|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(DEVELOPER);
        }
        _ = check sqlClient.runUpdateQuery(id, value);
        return self->/developers/[id].get();
    }

    isolated resource function delete developers/[string id]() returns Developer|persist:Error {
        Developer result = check self->/developers/[id].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(DEVELOPER);
        }
        _ = check sqlClient.runDeleteQuery(id);
        return result;
    }

    isolated resource function get roles(RoleTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get roles/[string id](RoleTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post roles(RoleInsert[] data) returns string[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ROLE);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from RoleInsert inserted in data
            select inserted.id;
    }

    isolated resource function put roles/[string id](RoleUpdate value) returns Role|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ROLE);
        }
        _ = check sqlClient.runUpdateQuery(id, value);
        return self->/roles/[id].get();
    }

    isolated resource function delete roles/[string id]() returns Role|persist:Error {
        Role result = check self->/roles/[id].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ROLE);
        }
        _ = check sqlClient.runDeleteQuery(id);
        return result;
    }

    isolated resource function get assignments(AssignmentTargetType targetType = <>, sql:ParameterizedQuery whereClause = ``, sql:ParameterizedQuery orderByClause = ``, sql:ParameterizedQuery limitClause = ``, sql:ParameterizedQuery groupByClause = ``) returns stream<targetType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "query"
    } external;

    isolated resource function get assignments/[string id](AssignmentTargetType targetType = <>) returns targetType|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor",
        name: "queryOne"
    } external;

    isolated resource function post assignments(AssignmentInsert[] data) returns string[]|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ASSIGNMENT);
        }
        _ = check sqlClient.runBatchInsertQuery(data);
        return from AssignmentInsert inserted in data
            select inserted.id;
    }

    isolated resource function put assignments/[string id](AssignmentUpdate value) returns Assignment|persist:Error {
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ASSIGNMENT);
        }
        _ = check sqlClient.runUpdateQuery(id, value);
        return self->/assignments/[id].get();
    }

    isolated resource function delete assignments/[string id]() returns Assignment|persist:Error {
        Assignment result = check self->/assignments/[id].get();
        psql:SQLClient sqlClient;
        lock {
            sqlClient = self.persistClients.get(ASSIGNMENT);
        }
        _ = check sqlClient.runDeleteQuery(id);
        return result;
    }

    remote isolated function queryNativeSQL(sql:ParameterizedQuery sqlQuery, typedesc<record {}> rowType = <>) returns stream<rowType, persist:Error?> = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor"
    } external;

    remote isolated function executeNativeSQL(sql:ParameterizedQuery sqlQuery) returns psql:ExecutionResult|persist:Error = @java:Method {
        'class: "io.ballerina.stdlib.persist.sql.datastore.MySQLProcessor"
    } external;

    public isolated function close() returns persist:Error? {
        error? result = self.dbClient.close();
        if result is error {
            return <persist:Error>error(result.message());
        }
        return result;
    }
}

