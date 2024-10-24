-- AUTO-GENERATED FILE.

-- This file is an auto-generated file by Ballerina persistence layer for model.
-- Please verify the generated scripts and execute them against the target DB server.

DROP TABLE IF EXISTS `Assignment`;
DROP TABLE IF EXISTS `Role`;
DROP TABLE IF EXISTS `Project`;
DROP TABLE IF EXISTS `Developer`;

CREATE TABLE `Developer` (
	`id` VARCHAR(191) NOT NULL,
	`name` VARCHAR(191) NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE `Project` (
	`id` VARCHAR(191) NOT NULL,
	`name` VARCHAR(191) NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE `Role` (
	`id` VARCHAR(191) NOT NULL,
	`name` VARCHAR(191) NOT NULL,
	PRIMARY KEY(`id`)
);

CREATE TABLE `Assignment` (
	`id` VARCHAR(191) NOT NULL,
	`projectId` VARCHAR(191) NOT NULL,
	FOREIGN KEY(`projectId`) REFERENCES `Project`(`id`),
	`developerId` VARCHAR(191) NOT NULL,
	FOREIGN KEY(`developerId`) REFERENCES `Developer`(`id`),
	`roleId` VARCHAR(191) NOT NULL,
	FOREIGN KEY(`roleId`) REFERENCES `Role`(`id`),
	PRIMARY KEY(`id`)
);


