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
    Separation of concern
    Abstraction/information hiding
    Loosely coupled
    Cohesive

Ways to achieve above/ best refactoring practices:
    DRY
    SOLID
    Prefer clarity over brevity
    Boy scout rule: Always leave the code base healthier than when you found it
    Split Loop
    Replace temporary variable with Query(calling a method having meaningful name)
    Split Temporary Variable: Don't use same variable for different contexts/purposes
    Put things together that change together

Code smells:
    Monster methods
    Global variables
    Usage of code types -> replace by strategy/polymorphism
    Don't have methods using boolean in signature, it means method violates SRP
    God class
    Too many parameters
    Lambdas more than 2-3 lines
    Primitive obsession -> use microtypes instead(java record, scala case class simplifies making microtypes)
    feature envy : when we are doing too much about state of an object from another object -> follow 'Law of demeter',meaning
    an object should interact with its immediate dependencies only; objects must follow 'Tell, don't ask' pattern.
    Move all the code modifying an object's state into that object and make object expose an API for clients. This helps
    in hiding implementation details, and hence reduces coupling, as any changes are localized to class only.
    Divergent change: When we have to change a module in different ways for different reasons. It means module is not following SRP
    and needs to be split.
    Data clumps -> put such data pieces together in a class, and then look for feature envy on this class to move behaviour to it
    Repeated switch/if-else statements -> replace with polymorphism
    loops -> replace with first class functions like filter,map etc
    lazy elements -> code elements like class, functions etc which over the time loose their importance. Needs to be deleted.
    Message chains/middle man
    Refused request: when a subclass methods don't really need the behaviour and code it inherits from parent class ->
    Replace inheritance with delegation



