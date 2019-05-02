function getIssueCountForLabels(http:Client clientEndpoint, string[] includeLabels, string[] excludeLabels) returns int{
    io:println("---------------------------");
    string currentPath = pathUrl;
    foreach var item in includeLabels {
        currentPath = currentPath + "+label:";
        currentPath = currentPath + item;
    }
    foreach var item in excludeLabels {
        currentPath = currentPath + "+-label:";
        currentPath = currentPath + item;
    }
    io:println(currentPath);
    var response = clientEndpoint->get(currentPath);
    return handleResponse(response);
}

function handleResponse(http:Response|error response) returns int {
    int value = 0;
    if (response is http:Response) {
        var msg = response.getJsonPayload();
        if (msg is json) {
            json issueCount = msg.total_count;
            if (issueCount is ()) {
                io:println("Invalid Issue count received:" , msg); 
            } else {
                value = untaint <int>issueCount;
            }
        } else {
            io:println("Invalid payload received:" , msg.reason());
        }
    } else {
        io:println("Error when calling the backend: ", response.detail().message);
    }
    return value;
}

