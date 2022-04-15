This project is an attempt to put together various coding practises recommended in various programming books, online blogs,
online programming tutorials etc.

Design hints from unit tests:
    Don't pass unnecessary data to a method.
    Avoid primitive obsession. Prefer to wrap primitives in object when they are to be passed around.
    Don't mutate input objects in a method, as it makes mocking such methods in unit tests too complex as we now need
    to mock the mutation behaviour too. Also now we need to validate for number of invocations of such impure methods.
    Try to have immutability as much as possible
    Prefer pure functions:
        No side effect + always return same result for same input
        Follow command-query-segregation
        Follow CQS(Command-Query-Segregation): Organize codebase into commands(methods changing state of the application)
        and queries(methods for querying data,pure functions which have no side effects and always returns same result for same input)
        A method must be either a command or a query, but not both
        Code smell hint in unit test: if for testing a code we are stubbing its dependency method as well as validating for its number of invocations,
        it means dependency method is breaking CQS. Refactor the dependency method into COMMAND and QUERY
        COMMAND needs validation for number of invocations, QUERY needs to be stubbed
        Try to put complex logic in pure functions so that corresponding tests need minimum or no mocks
        Follow Functional-Core-Imperative-Shell segregation pattern
        Make external calls in imperative parts, and then invoke functional parts(containing complex biz logic) passing fetched data

Guiding principles of clean code:
    Modular
    Cohesive
    Separation of concern
    Abstraction/information hiding
    Loosely coupled

Ways to achieve above:
    DRY
    SOLID
Code smells:
    Monster methods
    Don't have methods using boolean in signature, it means method violates SRP
    God class
    Too many parameters
    Lambdas more than 2-3 lines
    Primitive obsession -> use microtypes instead(java record, scala case class simplifies making microtypes)



