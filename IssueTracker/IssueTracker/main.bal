import ballerina/io;
import ballerina/http;

http:Client githubClient = new("https://api.github.com");

int totalLangBugs = 0;
int totalJBallerinaBugs = 0;
int totalStdlibBugs = 0;
int totalToolingBugs = 0;
int totalTesterinaBugs = 0;
int totalDocerinaBugs = 0;
int totalBuildBugs = 0;
int totalPackerinaBugs = 0; //CLI, Packerina, Central
int totalDistributionBugs = 0; // Installer, Distribution
int totalTestFailures = 0; // Type/TestFailures

int totalLang = 0;
int totalJBallerina = 0;
int totalStdlib = 0;
int totalTooling = 0;
int totalTesterina = 0;
int totalDocerina = 0;
int totalBuild = 0;
int totalPackerina = 0; //CLI, Packerina, Central
int totalDistribution = 0; // Installer, Distribution

public function main() {
    //Ballerina-platform bugs
    totalLang = getIssueCountForLabels(githubClient, [areaLanguage], []);

    totalStdlib = getIssueCountForLabels(githubClient, [areaStdlib], []);

    totalTooling = getIssueCountForLabels(githubClient, [areaTooling], []);

    totalTesterina = getIssueCountForLabels(githubClient, [componentTesterina], []);

    totalDocerina = getIssueCountForLabels(githubClient, [componentDocerina], []);

    totalBuild = getIssueCountForLabels(githubClient, [componentBuild], []);

    totalPackerina = getIssueCountForLabels(githubClient, [componentPackerina], []);

    //Ballerina-platform bugs
    totalLangBugs = getIssueCountForLabels(githubClient, [typeBug, areaLanguage], []);

    totalStdlibBugs = getIssueCountForLabels(githubClient, [typeBug, areaStdlib], []);

    totalToolingBugs = getIssueCountForLabels(githubClient, [typeBug, areaTooling], []);

    totalTesterinaBugs = getIssueCountForLabels(githubClient, [typeBug, componentTesterina], []);

    totalDocerinaBugs = getIssueCountForLabels(githubClient, [typeBug, componentDocerina], []);

    totalBuildBugs = getIssueCountForLabels(githubClient, [typeBug, componentBuild], []);

    totalPackerinaBugs = getIssueCountForLabels(githubClient, [typeBug, componentPackerina], []);

    totalTestFailures = getIssueCountForLabels(githubClient, [typeBug, typeTestFailure], []);
    
    printValues();
}

function printValues() {
    io:println("===================Issue Count - Bugs==================");
    io:println("Lang" , ":", totalLang, ":", totalLangBugs);
    io:println("JBallerina" , ":", totalJBallerina, ":", totalJBallerinaBugs);
    io:println("Stdlib" , ":", totalStdlib, ":", totalStdlibBugs);
    io:println("Tooling", ":", totalTooling, ":", totalToolingBugs);
    io:println("Testerina", ":", totalTesterina, ":", totalTesterinaBugs);
    io:println("Docerina", ":", totalDocerina, ":", totalDocerinaBugs);
    io:println("Packerina", ":", totalPackerina, ":", totalPackerinaBugs);
    io:println("Build", ":", totalBuild, ":", totalBuildBugs);
    io:println("Test Failures", ":", totalTestFailures);
}