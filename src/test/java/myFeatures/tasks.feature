Feature: Karate Basic Todos

Background:
    * url apiUrl
    * def reqToken = apiToken
    * def dbConn = dbConnStr

@readonly
Scenario: Get all todos
    When method Get
    Then status 200
    * def numofbooks = response.length
    * def lastindex = numofbooks - 1
    * print response[lastindex]
    * def sqlquery = '"SELECT numberid, numbertexten FROM NUMSTR FOR JSON PATH;"'
    * def sqlcmd = dbConn + sqlquery
    * def proc = karate.fork(sqlcmd)
    * proc.waitSync()
    * match proc.exitCode == 0
    * def sqlreturndata = read('file:testselect.out.txt')
    * print sqlreturndata

@writetest
Scenario: Basic todo flow

    * def taskName = 'First'
    Given request {title: "#(taskName)", complete:false}
    When method Post
    Then status 200
    And match response == { id: '#string', title: 'First', complete: false}
    * def id = response.id
    * def title = response.title
    * def status = response.complete
    * def nextsession = {title:#(title), id: [#(id)]}
    * print nextsession
