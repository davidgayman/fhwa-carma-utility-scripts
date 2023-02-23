#include <iostream>

// SDK Overview
//      Structure
//
//          1. Include the TENA/Middleware/config.h header file
//          2. Create a TENA::Middleware::ApplicationConfiguration
//          3. Initialize the Middleware and obtain its runtime pointer
//          4. Join the execution from the runtime pointer
//
//      Data Types
//
//  ManagedPtr: Any access to a ManagedPtr may be invalidated by a manager between a validity check and subsequent pointer reference. Wrap all ManagedPtr calls in exception catching for InvalidAccess exception.

int main() {

    // Join an execution

    TENA::Middleware::RuntimePtr pTENAmiddlewareRuntime( TENA::Middleware::init( appConfig.tenaConfiguration() ) );
    TENA::Middleware::ExecutionPtr pExecution( pTENAmiddlewareRuntime->joinExecution( endpointVector ) );
    TENA::Middleware::SessionPtr pSession( pExecution->createSession( "Example-Vehicle-Publisher-v7.6.1_Session" ) );

    // Register an exit detector to catch Ctrl+C

    TENA::Middleware::Utils::ExitDetector exitDetector;
    // ...
    if ( exitDetector.exitDetected() )
    {
        break;
    }



# Specialized Operations

    // Define a point
    TENA::GeodeticSRF::ImmutableLocalClassPtr pWGS84srf(TENA::GeodeticSRF::create(TENA::RTCODE_WGS_1984_IDENTITY));
    TENA::GeodeticPosition::ImmutableLocalClassPtr const geodeticPos(TENA::GeodeticPosition::create(
            pWGS84srf,
            latitudeInDegrees,
            longitudeInDegrees,
            heightAboveEllipsoidInMeters));

    return 0;
}
